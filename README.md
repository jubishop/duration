# Duration

Ruby class representing a duration in time.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'duration', github: 'jubishop/duration'
```

And then execute:

```sh
$ bundle install
```

## Usage

### Create and Compare Durations

```ruby
60.minutes == 1.hour # true
90.seconds < 2.minutes # true
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
