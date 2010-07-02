require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DateRange" do

  let(:firstOfYear)  { DateTime.new(2001,1,1) }
  let(:endOfYear)    { DateTime.new(2001,12,31) }
  let(:firstOfMarch) { DateTime.new(2001,3,1) }
  let(:endOfMarch)   { DateTime.new(2001,3,30) }
  let(:firstOfJuly)  { DateTime.new(2001,7,1) }
  let(:endOfJuly)    { DateTime.new(2001,7,31) }
  let(:range)        { SimpleRange.new(DateTime.new(2001,1,1), DateTime.new(2001,7,5))}
  let(:year)         { SimpleRange.new(firstOfYear, endOfYear)}
  let(:march)        { SimpleRange.new(firstOfMarch, endOfMarch)}
  let(:july)         { SimpleRange.new(firstOfJuly, endOfJuly)}

  it "should be equal if start and end dates are the same" do 
    year.same_range_as(year).should == true 
  end

  it "should have the quarters in a range" do 
    year.quarters.first.number.should == 1
    year.quarters.to_a.length.should == 4
  end

  it "should count the days in the range" do
    range.days.to_a.length.should == 31+28+31+30+31+30+5
  end
 
  it "should be able to get the number of months in a range" do
    range.months.to_a.length.should == 7
  end

  describe DateRange, "intersecting dates" do 

    it "should tell if one date range encompasses another" do  
      year.encompasses(march).should == true 
      march.encompasses(year).should == false
      march.encompasses(july).should == false
    end 

    it "should be able to tell if one date range intersects another" do 
      year.intersects(march).should == true
      year.intersects(year).should == true
      march.intersects(year).should == true
      march.intersects(july).should == false
      range.intersects(july).should == true
      july.intersects(range).should == true
    end

    it "can return the intersection" do 
      (year & march).should == march
      (march & year).should == march
      (march & march).should == march
      
      left = (range & july)
      left.start_date.should == firstOfJuly
      left.end_date.should == range.end_date
      left = (july & range)
      left.start_date.should == firstOfJuly
      left.end_date.should == range.end_date
      
      (march & july).should == []
    end


    it "can figure out the number of days in" do
      year.number_of_days_in(march).should == 30
      march.number_of_days_in(july).should == 0
    end

    it "returns null collections when start or end date is not set" do 
      r = SimpleRange.new(nil, DateTime.new)
      r.months.length.should == 0
      r = SimpleRange.new(DateTime.new, nil)
      r.months.length.should == 0
    end
  end
end
