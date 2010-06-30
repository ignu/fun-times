require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Campaign
  include DateRange

  attr_accessor :start_date, :end_date

  def initialize(date1, date2)
    @start_date, @end_date = date1, date2
  end
end

describe "DateRange" do

  let(:firstOfYear)  { DateTime.new(2001,1,1) }
  let(:endOfYear)    { DateTime.new(2001,12,31) }
  let(:firstOfMarch) { DateTime.new(2001,3,1) }
  let(:endOfMarch)   { DateTime.new(2001,3,30) }
  let(:firstOfApril) { DateTime.new(2001,4,1) }
  let(:endOfApril)   { DateTime.new(2001,4,30) }
  let(:campaign)     { Campaign.new(DateTime.new(2001,1,1), DateTime.new(2001,7,5))}
  let(:year)         { Campaign.new(firstOfYear, endOfYear)}
  let(:march)        { Campaign.new(firstOfMarch, endOfMarch)}
  let(:april)        { Campaign.new(firstOfApril, endOfApril)}

  it "should count the days in the range" do
    campaign.days.to_a.length.should == 31+28+31+30+31+30+5
  end
 
  it "should be able to get the number of months in a range" do
    campaign.months.to_a.length.should == 7
  end

  describe DateRange, "intersecting dates" do 
    it "should tell if one date encompasses another" do  
      year.encompasses(march).should == true 
      march.encompasses(year).should == false
      march.encompasses(april).should == false
    end 
  end
end
