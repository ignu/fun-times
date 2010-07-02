require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Quarter" do

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
    Quarter.new(1, 2009).start_date.should == DateTime.new(2009, 1, 1)
    Quarter.new(2, 2009).start_date.should == DateTime.new(2009, 4, 1)
  end

end
