require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Month" do
  let(:date) {DateTime.new(1977, 7, 31)}

  it "can get the month of a date" do
    Month.new(date).to_s.should == "July"
  end
  
  def to_s
    
  end

end
