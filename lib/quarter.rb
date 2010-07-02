class Quarter
  attr_accessor :number, :year, :start_date, :end_date

  def initialize(q,y) 
    months = [1, 4, 7, 10]
    @number, @year = q, y
    @start_date = DateTime.new(y, months[q-1], 1)
    @end_date = DateTime.new(y, months[q], 1) - 1 unless q == 4
    @end_date = DateTime.new(y+1, 1, 1) - 1 if q == 4
  end

  def self.from(date)
    new(date.month/4+1, date.year)
  end

end
