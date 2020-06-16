require 'time'

require_relative 'duration_class'

module TimeDurationExtensions
  def -(other)
    if other.is_a?(Duration)
      return self - Rational(other.milliseconds / Duration::SECONDS)
    end

    super(other)
  end

  def +(other)
    if other.is_a?(Duration)
      return self + Rational(other.milliseconds / Duration::SECONDS)
    end

    super(other)
  end
end

class Time
  prepend TimeDurationExtensions
end
