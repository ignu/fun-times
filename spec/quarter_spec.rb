require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Quarter" do

  let (:q1) {Quarter.new(1, 2009)}
  let (:q2) {Quarter.new(2, 2009)}
  let (:q3) {Quarter.new(3, 2009)}
  let (:q4) {Quarter.new(4, 2009)}

  it "can be newed up" do 
    quarter = Quarter.new(1, 2009)
    quarter.number.should == 1
    quarter.year.should == 2009
  end

  it "can initialize from any date" do 
    quarter = Quarter.from(DateTime.new(2009, 2, 1))
    quarter.year.should == 2009
  end

  it "sets the start date correctly" do 
    q1.start_date.should == DateTime.new(2009, 1, 1)
    q2.start_date.should == DateTime.new(2009, 4, 1)
    q3.start_date.should == DateTime.new(2009, 7, 1)
    q4.start_date.should == DateTime.new(2009, 10, 1)
  end

  it "sets the end date correctly" do 
    q1.end_date.should == DateTime.new(2009, 3, 31)
    q2.end_date.should == DateTime.new(2009, 6, 30)
    q3.end_date.should == DateTime.new(2009, 9, 30)
    q4.end_date.should == DateTime.new(2009, 12, 31)
  end

  it "can iterate over quarters" do
    range = (q1..q3)
    range.first.should == q1
    range.to_a.length.should == 3
    range.end.should == q3
  end

  it "is a daterange" do 
    q1.months.to_a.length.should == 3
  end 
end
