require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Campaign
  include DateRange

  def initialize(date1, date2)
    @start_date, @end_date = date1, date2
  end
end

describe "DateRange" do

  let(:campaign) { Campaign.new(DateTime.new(2001,1,1), DateTime.new(2001,7,5))}

  it "should count the days in the range" do
    campaign.days.to_a.length.should == 31+28+31+30+31+30+5
  end
 
  it "should be able to get the number of months in a range" do
    campaign.months.to_a.length.should == 7
  end

end
