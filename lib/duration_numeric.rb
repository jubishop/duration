require_relative 'duration_class'

module NumericExtensions
  def milliseconds
    # @type self: number
    return Duration.new(self, units: Duration::MILLISECONDS)
  end
  alias millisecond milliseconds
  alias ms milliseconds

  def seconds
    # @type self: number
    return Duration.new(self, units: Duration::SECONDS)
  end
  alias second seconds

  def minutes
    # @type self: number
    return Duration.new(self, units: Duration::MINUTES)
  end
  alias minute minutes

  def hours
    # @type self: number
    return Duration.new(self, units: Duration::HOURS)
  end
  alias hour hours

  def days
    # @type self: number
    return Duration.new(self, units: Duration::DAYS)
  end
  alias day days
end

class Float < Numeric
  include NumericExtensions
end

class Rational < Numeric
  include NumericExtensions
end

class Integer < Numeric
  include NumericExtensions
end
