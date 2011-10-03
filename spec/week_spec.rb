require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Week do
  let(:first_week) { Week.from(DateTime.new(2011, 10, 5)) }

  it "can initialize the week from a day" do
    first_week.days.to_a.length.should == 7
  end

  it "starts the week on a sunday" do
    first_week.days.first.should == Date.new(2011, 10, 2)
  end

  describe "#next" do
    it "returns the next week" do
      first_week.next.days.first.should == Date.new(2011, 10, 9)
    end
  end

  describe "#previous" do
    it "returns the previous week" do
      first_week.previous.days.first.should == Date.new(2011, 9, 25)
    end
  end
end
