class DateRange < Range
  
  def initialize(date1, date2)
    @start_date, @end_date = date1, date2
    super(date1, date2)
  end

  def months
    (Month.new(@start_date)..Month.new(@end_date))
  end

end
