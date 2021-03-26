# Duration

Ruby class representing a duration in time.

## Installation

### Global installation

```zsh
gem install duration --source https://www.jubigems.org/
```

### In a Gemfile

```ruby
gem 'duration', source: 'https://www.jubigems.org/'
```

## Usage

### Create and Compare Durations

```ruby
60.minutes == 1.hour # true
90.seconds < 2.minutes # true
1.day > 22.hours # true
```

### Duration math

```ruby
2.days / 1.hour # 48
90.minutes / 1.hour # 1.5
2.days / 2 # 1.day
4.hours * 2 # 8.hours
1.day + 2.days # 3.days
90.minutes + 3.hours # 4.5.hours
90.minutes % 1.hour # 30.minutes
28.hours % 1.day # 4.hours
```

### Integer Amounts and Remainders

```ruby
duration = 90.minutes
duration.days # 0
duration.hours # 1
duration.minutes # 90
duration.minutes! # 30
duration.seconds # 5400

duration = 28.hours
duration.days # 1
duration.hours # 28
duration.hours! # 4
duration.minutes # 1680
```

### Modify Time and DateTime

```ruby
Time.now + 4.hours + 30.minutes # 4 and a half hours in the future
DateTime.now + 2.days # 2 days in the future
Time.now - 7.days # One week ago
```

### Printing Durations

```ruby
1212342.seconds.to_s # "14 days, 45 minutes and 42 seconds"
1212342.seconds.format(Duration::DAYS) # "14 days"
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
