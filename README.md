# AprikipMonth

This gem provides a class manipulates a month as a unit of time, as Date does
a day as a unit.  It may be useful when you deal with a monthly datum, like accounts.
This gem also extend Date class to add a ```to_month``` method, working as its name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aprikip_month'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aprikip_month

## Usage

Require no other third party gems.
```ruby
require "month"
```
### Features
You can make a new Month object with year and month.
```ruby
Month.new(2014, 4) # => #<Month:0x007f8a27927210 @count=24171, @month=4, @year=2014>
```
Without argument, it creates a Month object of current month.
```ruby
Month.new # => #<Month:0x007f8a27966de8 @count=24176, @month=9, @year=2014>
```
Attributes ```year``` and ```month``` return year and month (as a number).
```ruby
Month.new.year # => 2014
Month.new.month # => 9
```
The #succ and #prev methods return the next and previous month.  #succ
has an alias #next.
```ruby
Month.new(2018, 1).succ
# => #<Month:0x007f8a273150c0 @count=24217, @month=2, @year=2018>
Month.new(2018, 1).prev
=> #<Month:0x007f8a27b18d30 @count=24215, @month=12, @year=2017>
```
Addition and subtraction operators work as you expect.
```ruby
Month.new(2018, 1)+10
# => #<Month:0x007f8a2723e9d0 @count=24226, @month=11, @year=2018>
Month.new(2018, 1)-10
# => #<Month:0x007f8a27ad8b90 @count=24206, @month=3, @year=2017>
Month.new(2018, 1)-Month.new(2012, 1) # => 72
```
The comparison operators also work ordinary.
```ruby
Month.new(2040, 1)<Month.new(2040, 6) # => true
Month.new(2040, 1)<=Month.new(2040, 6) # => true
Month.new(2040, 1)>Month.new(2040, 6) # => false
Month.new(2040, 1)>=Month.new(2040, 6) # => false
```
The #<=> operator works to enable making a Range.
```ruby
Month.new(2040, 1)<=>Month.new(2040, 6) # => -1
Month.new(2042, 1)<=>Month.new(2040, 6) # => 1
Month.new(2040, 1)<=>Month.new(2040, 1) # => 0
Month.new(2040, 1)..Month.new(2040, 6)
# => #<Month:0x007f8a27a58508 @count=24480, @month=1, @year=2040>
..
#<Month:0x007f8a27a584e0 @count=24485, @month=6, @year=2040>
```
A Month object can be converted to a String object, a Fixnum object and
a Date object.  Date object has day 1.
```ruby
Month.new(2018, 12).to_s # => "2018-12"
Month.new(2018, 12).to_i # => 24227
Month.new(2018, 12).to_date
# => #<Date: 2018-12-01 ((2458454j,0s,0n),+0s,2299161j)>
```
The #strftime method works as well.
```ruby
Month.new(2009, 12).strftime("%Y-%m-%d") # => "2009-12-01"
```

The #first_date and #last_date return Date object as you expect.
```ruby
Month.new(2057, 8).first_date
=> #<Date: 2057-08-01 ((2472577j,0s,0n),+0s,2299161j)>
Month.new(2100, 2).last_date
# => #<Date: 2100-02-28 ((2488128j,0s,0n),+0s,2299161j)>
```
The #size, alias #length, method returns the length of month in day.
```ruby
Month.new(2048, 2).size # => 29
```
The #dates method returns a Range of Date's of this month.
```ruby
Month.new(2017, 4).dates
=> #<Date: 2017-04-01 ((2457845j,0s,0n),+0s,2299161j)>
..
#<Date: 2017-04-30 ((2457874j,0s,0n),+0s,2299161j)>
```

### Addenda
This will add #to_month method to Date class.
```ruby
Date.new(2017, 4, 27).to_month
=> #<Month:0x007fccd402a4d8 @count=24207, @month=4, @year=2017>
```

### Acknowledgement
A gem named "month", implemented by Tim Craft, already exists, here:
https://github.com/timcraft/month .
The #dates method is implemented after I saw Tim's month gem.  Also
http://qa.atmarkit.co.jp/q/3250 is helpful for me.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/aprikip_month/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
