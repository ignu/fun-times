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
    Month.new Date.new(@year, @number+1, 1)
  end
end
