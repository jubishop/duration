require 'date'

require_relative 'duration_class'

module DateTimeDurationExtensions
  def -(other)
    if other.is_a?(Duration)
      return super(Rational(other.milliseconds / Duration::DAYS))
    end

    super(other)
  end

  def +(other)
    if other.is_a?(Duration)
      return super(Rational(other.milliseconds / Duration::DAYS))
    end

    super(other)
  end
end

class DateTime < Date
  prepend DateTimeDurationExtensions
end
