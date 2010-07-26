class Quarter
  include DateRange
  attr_accessor :number, :year, :start_date, :end_date
  @@months = [1, 4, 7, 10]

  def initialize(q,y) 
    @number, @year = q, y
    @start_date = DateTime.new(y, @@months[q-1], 1)
    @end_date = DateTime.new(y, @@months[q], 1) - 1 unless q == 4
    @end_date = DateTime.new(y+1, 1, 1) - 1 if q == 4
  end

  def self.from(date)
    number = @@months.index(@@months.reverse.detect{|i| i <= date.month}) + 1
    new(number, date.year)
  end

  def succ
    return Quarter.new(@number+1, @year) unless @number == 4
    Quarter.new(1, @year+1)
  end

  def <=> (other)
    @start_date <=> other.start_date 
  end

  def to_s
    "Q#{@number}, #{@year}"
  end 
end
