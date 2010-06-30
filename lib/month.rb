require 'date'
class Month
  include Comparable
  attr_accessor :year, :number

  def initialize(d)
    @start_date = d 
    @number = d.month
    @year = d.year
  end

  def to_s
    "#{name}, #{@year}"
  end

  def name
    @start_date.strftime("%B")
  end 

  def <=> (other)
    return @year <=> other.year unless @year == other.year
    @number <=> other.number
  end

  def succ 
    return Month.new(Date.new(@year+1, 1, 1)) if (@number == 12)
    Month.new Date.new(@year, @number+1, 1) 
  end

  #TODO: refactor for speed and clarity 
  def prev 
    return Month.new(Date.new(@year-1, 12, 1)) if (@number == 1)
    Month.new Date.new(@year, @number-1, 1) 
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
end
