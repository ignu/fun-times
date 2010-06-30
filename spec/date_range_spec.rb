require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DateRange" do

  let(:range) { DateRange.new(DateTime.new(2001,1,1), DateTime.new(2001,7,5))}

  it "should count the days in the range" do
    range.to_a.length.should == 31+28+31+30+31+30+5
  end
 
  it "should be able to get the number of months in a range" do
    range.months.to_a.length.should == 7
  end

end
