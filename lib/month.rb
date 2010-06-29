require 'date'
class Month
  def initialize(d)
    @start_date = d 
  end
  def to_s
    @start_date.strftime("%B")
  end
end
