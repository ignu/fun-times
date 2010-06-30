module DateRange 

  def months
    (Month.new(@start_date)..Month.new(@end_date))
  end

  def days
    (@start_date)..(@end_date)
  end

end

