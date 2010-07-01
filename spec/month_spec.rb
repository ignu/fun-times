require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Month" do
  let(:july) {Month.new DateTime.new(1977, 7, 31)}
  let(:sept) {Month.new DateTime.new(1977, 9, 30)}

  it "can initialize the month of a date" do
    july.to_s.should == "July, 1977"
    july.name.should == "July"
    july.year.should == 1977 
    july.number.should == 7
    july.start_date.should == Date.new(1977, 7, 1) 
    july.end_date.should == Date.new(1977, 7, 31) 
  end

  it "can use the less than operator" do
    july.should be < sept
  end

  it "can iterate over months" do
    range = (july..sept)
    range.first.should == july
    range.to_a.length.should == 3
    range.end.should == sept
  end

  it "can iterate over months when crossing a year barrier" do
    range = (july..(Month.new(Date.new(1978, 1, 1))))
    range.to_a.length.should == 7
  end

  it "can add and subtract months" do 
    (july+1).to_s.should == "August, 1977"
    (july-1).to_s.should == "June, 1977"
  end

  it "is a daterange" do 
    july.days.to_a.length.should == 31
  end

end
