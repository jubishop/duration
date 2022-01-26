# Duration

[![RSpec Status](https://github.com/jubishop/duration/workflows/RSpec/badge.svg)](https://github.com/jubishop/duration/actions/workflows/rspec.yml)  [![Rubocop Status](https://github.com/jubishop/duration/workflows/Rubocop/badge.svg)](https://github.com/jubishop/duration/actions/workflows/rubocop.yml)

Ruby class representing a duration in time.

## Installation

### In a Gemfile

```ruby
source: 'https://www.jubigems.org/' do
  gem 'core'
  gem 'duration'
end
```

## Usage

### Comparisons

```ruby
60.minutes == 1.hour # true
90.seconds < 2.minutes # true
1.day > 22.hours # true
```

### Math

```ruby
2.days / 1.hour # 48
90.minutes / 1.hour # 1.5
500.ms / 1.second # (1/2)
2.days / 2 # 1.day
4.hours * 2 # 8.hours
1.day + 2.days # 3.days
90.minutes + 3.hours # 4.5.hours
90.minutes % 1.hour # 30.minutes
28.hours % 1.day # 4.hours
```

### Amounts

```ruby
duration = 90.minutes
duration.days # (1/16)
duration.hours # 1.5
duration.minutes # 90
duration.seconds # 5400
duration.ms # 5400000

duration = 28.hours
duration.days # (7/6)
duration.hours # 28
duration.minutes # 1680
```

#### Rationals

`Duration` objects deal in `Rational` units to maintain absolute precision.  For example, `28.hours.days` is `7/6`, rather than an imprecise `1.1666666666666667`.

### Manipulating Time and DateTime

```ruby
Time.new(2002, 10, 31) + 4.days + 30.minutes # 11/04/2002, 12:30am.
DateTime.new(2001,2,3) + 2.days # 02/05/2001
Time.new(1993, 2, 24) - 7.days # 02/17/1993
```

### Converting any duration to absolute duration

```ruby
(30.minutes - 90.minutes).abs # 60.minutes
```

### Pretty Printing

```ruby
1218234.seconds.to_s # '14 days, 2 hours, 23 minutes and 54 seconds'
1218234.seconds.format(precision: Duration::MINUTES) # '14 days, 2 hours and 23 minutes'
1218234.seconds.format(precision: Duration::HOURS) # '14 days and 2 hours'
1218234.seconds.format(precision: Duration::DAYS) # '14 days'
```

#### Pretty Printed Parts

```ruby
1218234.seconds.format_parts # ['14 days', '2 hours', '23 minutes', '54 seconds']
1218234.seconds.format_parts(precision: Duration::MINUTES) # ['14 days', '2 hours', '23 minutes']
1218234.seconds.format_parts(precision: Duration::HOURS) # ['14 days', '2 hours']
1218234.seconds.format_parts(precision: Duration::DAYS) # ['14 days']
```

### RBS

`duration` comes with [complete `.rbs` definitions](https://github.com/jubishop/duration/tree/master/sig) for the main `Duration` class and the additions to the `DateTime`, `Time`, and `Numeric` classes.

### RSpec

Every example provided by this `README` is tested in [`RSpec`](https://github.com/jubishop/duration/tree/master/spec)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
