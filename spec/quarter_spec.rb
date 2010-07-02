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

end
