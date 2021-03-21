require 'time'

require_relative 'duration_class'

module TimeDurationExtensions
  def -(other)
    case other
    when Duration
      super(Rational(other.milliseconds / Duration::SECONDS))
    else
      super(other)
    end
  end

  def +(other)
    case other
    when Duration
      super(Rational(other.milliseconds / Duration::SECONDS))
    else
      super(other)
    end
  end
end

class Time
  prepend TimeDurationExtensions
end
