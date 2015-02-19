module AprikipMonth
  require "date"
  class Month
    attr_reader :year, :month
    AprikipMonth::Date=Date

    def initialize(year=Date::today.year, month=Date::today.month)
      raise ArgumentError if month>12
      @count=year*12+month-1
      @year=year
      @month=month
    end

    def Month.at(count)
      Month.new(count/12, count%12+1)
    end

    def succ
      new_count=@count+1
      Month.new(new_count/12, new_count % 12+1)
    end

    alias next succ

    def prev
      new_count=@count-1
      Month.new(new_count/12, new_count % 12+1)
    end

    def to_i
      @count
    end

    def to_date
      Date.new(self.year, self.month, 1)
    end

    def strftime(format)
      self.to_date.strftime(format)
    end

    def <=>(other)
      self.to_i <=> other.to_i
    end

    def <(other)
      self.to_i<other.to_i
    end

    def <=(other)
      self.to_i<=other.to_i
    end

    def >(other)
      self.to_i>other.to_i
    end

    def >=(other)
      self.to_i>=other.to_i
    end

    def ==(other)
      self.to_i==other.to_i
    end

    def first_date
      Date.new(self.year, self.month, 1)
    end

    def last_date
      Date.new(self.year, self.month, -1)
    end

    def size
      (self.last_date-self.first_date+1).to_i
    end

    alias length size

    def +(other)
      new_count=@count+other
      Month.new(new_count/12, new_count % 12+1)
    end

    def -(other)
      if other.class==Fixnum
        new_count=@count-other
        Month.new(new_count/12, new_count % 12+1)
      elsif other.class==Month
        self.to_i-other.to_i
      end
    end

    def include?(date)
      self.first_date <= date and date <= self.last_date
    end

    def to_s
      self.to_date.strftime("%Y-%m")
    end

    def dates
      self.first_date..self.last_date
    end
  end

  class Date
    def to_month
      Month.new(self.year, self.month)
    end
  end
end
