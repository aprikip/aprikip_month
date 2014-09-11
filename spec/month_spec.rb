require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "rspec"
require "date"

describe Month do
  describe "#new" do
    it "makes a Month object, without any argument" do
      expect(Month.new).to be_a Month
    end
    it "makes a Month object, with year and month as arguments" do
      expect(Month.new(2088, 4)).to be_a Month
    end
    it "raises an error if month>12" do
      expect{Month.new(7444,18)}.to raise_error(ArgumentError)
    end
  end
  describe "#year" do
    it "returns year of Month object" do
      expect(Month.new(2778, 4).year).to eq(2778)
    end
  end
  describe "#month" do
    it "returns month of Month object" do
      expect(Month.new(2778, 4).month).to eq(4)
    end
  end
  describe "#succ" do
    it "returns a Month object of the next month" do
      expect(Month.new.succ.year).to eq(Date.today.next_month.year)
      expect(Month.new.succ.month).to eq(Date.today.next_month.month)
    end
  end
  describe "#prev" do
    it "returns a Month object of the previous month" do
      expect(Month.new.prev.year).to eq(Date.today.prev_month.year)
      expect(Month.new.prev.month).to eq(Date.today.prev_month.month)
    end
  end
  describe "#to_i" do
    it "returns serial count of month number from the epoch, ie year 0, month 1, ie Januarius, 1 Ante Christum" do
      expect(Month.new(2000, 5).to_i).to eq(24004)
    end
  end
  describe "#to_date" do
    it "returns a Date object of day 1 of the month" do
      expect(Month.new(2047, 4).to_date).to eq(Date.new(2047, 4, 1))
    end
  end
  describe "#strftime" do
    it "returns strftime'd string of day 1 of the month" do
      expect(Month.new(2009, 12).strftime("%Y-%m-%d")).to eq("2009-12-01")
    end
  end
  describe "#<=>" do
    it "compares two Month objects" do
      expect(Month.new(2040, 1)<=>Month.new(2040, 6)).to eq(-1)
      expect(Month.new(2042, 1)<=>Month.new(2040, 6)).to eq(1)
      expect(Month.new(2040, 1)<=>Month.new(2040, 1)).to eq(0)
    end
  end
  describe "#<" do
    it "compares two Month objects" do
      expect(Month.new(2040, 1)<Month.new(2040, 6)).to be true
      expect(Month.new(2040, 7)<Month.new(2040, 6)).to be false
    end
  end
  describe "#<=" do
    it "compares two Month objects" do
      expect(Month.new(2040, 1)<=Month.new(2040, 6)).to be true
      expect(Month.new(2040, 1)<=Month.new(2040, 1)).to be true
      expect(Month.new(2040, 7)<=Month.new(2040, 6)).to be false
    end
  end
  describe "#>" do
    it "compares two Month objects" do
      expect(Month.new(2040, 1)>Month.new(2040, 6)).to be false
      expect(Month.new(2040, 7)>Month.new(2040, 6)).to be true
    end
  end
  describe "#>=" do
    it "compares two Month objects" do
      expect(Month.new(2040, 1)>=Month.new(2040, 6)).to be false
      expect(Month.new(2040, 1)>=Month.new(2040, 1)).to be true
      expect(Month.new(2040, 7)>=Month.new(2040, 6)).to be true
    end
  end
  describe "#first_date" do
    it "returns a Date object of the first day of month" do
      expect(Month.new(2040, 1).first_date).to eq(Date.new(2040, 1, 1))
    end
  end
  describe "#last_date" do
    it "returns a Date object of the last day of month" do
      expect(Month.new(2040, 1).last_date).to eq(Date.new(2040, 1, 31))
      expect(Month.new(2040, 2).last_date).to eq(Date.new(2040, 2, 29))
    end
  end
  describe "#size" do
    it "returns number of days of the month" do
      expect(Month.new(2040, 1).size).to eq(31)
      expect(Month.new(2040, 2).size).to eq(29)
    end
  end
  describe "#==" do
    it "judges the equality of two Month objects, if year and month are identical, returns truth" do
      expect(Month.new==Month.new).to be true
      expect(Month.new(2048, 4)==Month.new(1148, 4)).to be false
    end
  end
  describe "#+" do
    it "returns a Month object of (other) months after" do
      expect(Month.new(2077, 4)+10).to eq(Month.new(2078, 2))
    end
  end
  describe "#-" do
    context "with another Month object" do
      it "returns a difference of two Month objects" do
        expect(Month.new(2077, 4)-Month.new(2070, 4)).to eq(84)
      end
    end
    context "with an integer" do
      it "returns a Month object of (other) months before" do
        expect(Month.new(2077, 4)-10).to eq(Month.new(2076, 6))
      end
    end
  end
  describe "#include?" do
    it "judges if given Date object belongs to this month" do
      expect(Month.new(2087, 11).include?(Date.new(2087, 11 ,14))).to be true
      expect(Month.new(2087, 12).include?(Date.new(2087, 11 ,14))).to be false
    end
  end
  describe "#to_s" do
    it "returns a String object" do
      expect(Month.new.to_s).to eq(Date.today.strftime("%Y-%m"))
    end
  end
  describe "#dates" do
    it "returns a Range of dates of this month" do
      expect(Month.new(2045, 4).dates).to eq(Date.new(2045, 4, 1)..Date.new(2045, 4, -1))
    end
  end
end

describe Date do
  describe "#to_month" do
    it "returns a Month object of that date" do
      expect(Date.today.to_month).to eq(Month.new)
    end
  end
end
