require 'date'

require 'duration'

RSpec.describe(Duration) {
  it('compares to other Durations') {
    expect(60.minutes).to(eq(1.hour))
    expect(90.seconds).to(be < 2.minutes)
    expect(1.day).to(be > 22.hours)
  }

  it('does math') {
    expect(2.days / 1.hour).to(eq(48))
    expect(90.minutes / 1.hour).to(eq(1.5))
    expect(500.ms / 1.second).to(eq(Rational(1, 2)))
    expect(2.days / 2).to(eq(1.day))
    expect(4.hours * 2).to(eq(8.hours))
    expect(1.day + 2.days).to(eq(3.days))
    expect(90.minutes + 3.hours).to(eq(4.5.hours))
    expect(90.minutes % 1.hour).to(eq(30.minutes))
    expect(28.hours % 1.day).to(eq(4.hours))
  }

  it('translates amounts') {
    expect(90.minutes.days).to(eq(Rational(1, 16)))
    expect(90.minutes.hours).to(eq(1.5))
    expect(90.minutes.minutes).to(eq(90))
    expect(90.minutes.seconds).to(eq(5400))
    expect(90.minutes.ms).to(eq(5400000))

    expect(28.hours.days).to(eq((Rational(7, 6))))
    expect(28.hours.hours).to(eq(28))
    expect(28.hours.minutes).to(eq(1680))
  }

  it('manipulates Time and DateTime') {
    # rubocop:disable Style/DateTime
    expect(Time.new(2002, 10, 31) + 4.days + 30.minutes).to(
        eq(Time.new(2002, 11, 4, 0, 30)))
    expect(DateTime.new(2001, 2, 3) + 2.days).to(eq(DateTime.new(2001, 2, 5)))
    expect(Time.new(1993, 2, 24) - 7.days).to(eq(Time.new(1993, 2, 17)))
    # rubocop:enable Style/DateTime
  }

  it('pretty prints a duration') {
    expect(1218234.seconds.to_s).to(
        eq('14 days, 2 hours, 23 minutes and 54 seconds'))
    expect(1218234.seconds.format(precision: Duration::MINUTES)).to(
        eq('14 days, 2 hours and 23 minutes'))
    expect(1218234.seconds.format(precision: Duration::HOURS)).to(
        eq('14 days and 2 hours'))
    expect(1218234.seconds.format(precision: Duration::DAYS)).to(eq('14 days'))
  }
}
