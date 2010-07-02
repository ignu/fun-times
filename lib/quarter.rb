class Quarter
  attr_accessor :number, :year, :start_date, :end_date

  def initialize(q,y) 
    months = [1, 4, 7, 10]
    @number, @year = q, y
    @start_date = DateTime.new(2009, months[q-1], 1)
  end

  def self.from(date)
    new(date.month/4+1, date.year)
  end

end
