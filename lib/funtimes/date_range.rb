module DateRange

  def days
    (_start)..(_end)
  end

  def months
    return [] unless _start && _end
    (Month.from(_start)..Month.from(_end))
  end

  def quarters
    return [] unless _start && _end
    (Quarter.from(_start)..Quarter.from(_end))
  end

  def encompasses(other)
    _start <= other.start_date && _end >= other.end_date
  end

  def intersects(other)
    other.encompasses(self) || encompasses(other) || overlaps(other)
  end

  def & (other)
    return [] unless intersects other
    return other if encompasses(other)
    return self if other.encompasses(self)
    return SimpleRange.new(other.start_date, _end) if overlaps_left_side(other)
    SimpleRange.new(_start, other.end_date)
  end

  def | (other)
    return [] unless intersects other
    return self if encompasses(other)
    return other if other.encompasses(self)
    SimpleRange.new([_start,other.start_date].min, [_end,other.end_date].max)
  end

  def same_range_as(other)
    other.start_date == _start && other.end_date == _end
  end

  def number_of_days_in(other)
    intersection = (self & other)
    return 0 if intersection == []
    intersection.days.to_a.length
  end

  private

  def overlaps(other)
    overlaps_left_side(other) || overlaps_right_side(other)
  end

  def overlaps_right_side(other)
    other.start_date <= _start && other.end_date >= _start
  end

  def overlaps_left_side(other)
    other.start_date <= _end && other.end_date >= _end
  end

  def _start
    @start_date ||= start_date
    return @start_date.to_datetime if @start_date.respond_to? :to_datetime
    @start_date
  end

  def _end
    @end_date ||= end_date
    return @end_date.to_datetime if @end_date.respond_to? :to_datetime
    @end_date
  end
end

class SimpleRange
  include DateRange

  attr_accessor :start_date, :end_date

  def initialize(date1, date2)
    @start_date, @end_date = date1, date2
  end
end
