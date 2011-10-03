require 'date'
require 'funtimes/date_range'

class Week
  START_DAY = 0

  include DateRange

  def initialize(date)
    start_date = get_start_date(date)
    @start_date, @end_date = start_date, start_date + 6
  end

  def self.from(start_date)
    Week.new start_date
  end

  def previous
    Week.new(@start_date - 7)
  end

  def next
    Week.new(@start_date + 7)
  end

  private

    def get_start_date(date)
      date = date -1 while date.wday != START_DAY
      date
    end
end
