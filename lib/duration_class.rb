require 'core'

class Duration
  include Comparable

  # TODO: Use real duration units.
  MILLISECONDS = 1
  SECONDS = MILLISECONDS * 1000
  MINUTES = SECONDS * 60
  HOURS = MINUTES * 60
  DAYS = HOURS * 24
  public_constant :MILLISECONDS
  public_constant :SECONDS
  public_constant :MINUTES
  public_constant :HOURS
  public_constant :DAYS

  TIME_NAMES = {
    DAYS => 'day',
    HOURS => 'hour',
    MINUTES => 'minute',
    SECONDS => 'second',
    MILLISECONDS => 'millisecond'
  }.freeze
  private_constant :TIME_NAMES

  def initialize(amount, units: SECONDS)
    @milliseconds = Rational(amount * units)
  end

  def days
    (milliseconds / DAYS).to_i
  end

  def hours
    (milliseconds / HOURS).to_i
  end

  def hours!
    hours % (DAYS / HOURS)
  end

  def minutes
    (milliseconds / MINUTES).to_i
  end

  def minutes!
    minutes % (HOURS / MINUTES)
  end

  def seconds
    (milliseconds / SECONDS).to_i
  end

  def seconds!
    seconds % (MINUTES / SECONDS)
  end

  def milliseconds
    @milliseconds.to_i
  end
  alias ms milliseconds

  def milliseconds!
    milliseconds % (SECONDS / MILLISECONDS)
  end
  alias ms! milliseconds!

  def <=>(other)
    milliseconds <=> other.milliseconds
  end

  def +(other)
    return Duration.new(ms + other.ms, units: MILLISECONDS)
  end

  def -(other)
    return Duration.new(ms - other.ms, units: MILLISECONDS)
  end

  def *(other)
    return Duration.new(milliseconds * other, units: MILLISECONDS)
  end

  def /(other)
    return Duration.new(milliseconds / other, units: MILLISECONDS)
  end

  def format(precision = SECONDS)
    remaining = milliseconds
    parts = TIME_NAMES.filter_map { |amount, name|
      next unless amount >= precision

      value = (remaining / amount).to_i
      next unless value.positive?

      remaining -= value * amount
      "#{value} #{name.pluralize(value)}"
    }
    parts.push("0 #{TIME_NAMES.fetch(precision).pluralize(0)}") if parts.empty?
    return parts.sentence
  end
  alias to_s format
end
