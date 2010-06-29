require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Month" do
  let(:date) {DateTime.new(1977, 7, 31)}

  it "can initialize the month of a date" do
    month = Month.new(date)
    month.to_s.should == "July"
    month.year.should == 1977 
    month.number.should == 7
  end
  

end
