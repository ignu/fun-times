require 'date'
require 'funtimes/date_range'

class Month
  include Comparable
  include DateRange
  attr_accessor :year, :number, :start_date, :end_date

  def self.from(date)
    Month.new(date.month, date.year)
  end

  def initialize(month, year)
    @number, @year = month, year
    @start_date = DateTime.new(@year, @number, 1)
    @end_date = DateTime.new(next_months_start.year, next_months_start.month, 1) - 1
  end

  def to_s
    "#{name} #{@year}"
  end

  def name
    @start_date.strftime("%B")
  end

  def <=> (other)
    return @year <=> other.year unless @year == other.year
    @number <=> other.number
  end

  def succ
    Month.from next_months_start
  end

  def prev
    return Month.new(12, @year-1) if (@number == 1)
    Month.new @number-1, @year
  end

  def + (amount)
    rv = self
    amount.times {rv = rv.succ}
    rv
  end

  def -(amount)
    rv = self
    amount.times {rv = rv.prev}
    rv
  end

  private

  def next_months_start
    return DateTime.new(@year+1, 1, 1) if (@number == 12)
    DateTime.new(@year, @number+1, 1)
  end
end
