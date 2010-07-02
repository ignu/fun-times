class Quarter
  attr_accessor :number, :year

  def initialize(q,y) 
    @number, @year = q, y
  end

  def self.from(date)
    new(date.month/4+1, date.year)
  end
end
