require 'date'
class Month
  attr_accessor :year, :number

  def initialize(d)
    @start_date = d 
    @number = d.month
    @year = d.year
  end

  def to_s
    @start_date.strftime("%B")
  end

end
