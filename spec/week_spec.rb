require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Week do
  let(:first_week) { Week.from(DateTime.new(2011, 10, 5)) }

  it "can initialize the week from a day" do
    first_week.days.to_a.length.should == 7
  end

  it "sets start_date" do
    first_week.start_date.should == Date.new(2011, 10, 2)
  end

  it "sets end_date" do
    first_week.end_date.should == Date.new(2011, 10, 8)
  end

  it "starts the week on a sunday" do
    first_week.days.first.should == Date.new(2011, 10, 2)
  end

  describe "#succ" do
    it "returns the next week" do
      first_week.succ.days.first.should == Date.new(2011, 10, 9)
    end
  end

  describe "#prev" do
    it "returns the previous week" do
      first_week.prev.days.first.should == Date.new(2011, 9, 25)
    end
  end
end
