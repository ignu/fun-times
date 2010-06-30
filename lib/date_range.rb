module DateRange 

  def months
    (Month.new(_start)..Month.new(_end))
  end

  def days
    (_start)..(_end)
  end
 
  def encompasses(other)
    _start < other.start_date && _end > other.end_date 
  end

  private

  def _start
    @start_date ||= start_date
  end

  def _end 
    @end_date ||= end_date
  end
end

