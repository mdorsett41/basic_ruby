require './record_parser'

describe "Code Test" do
  let(:pipe_record) { 'Smith | Steve | D | M | Red | 3-3-1985' }
  let(:space_record) { 'Kournikova Anna F F 6-3-1975 Red' }


  it 'should parse a pipe record and turn it into a person object' do
    person = RecordParser.new.parse(pipe_record)
    person.first_name.should == 'Steve'
    person.last_name.should == 'Smith'
    person.favorite_color.should == 'Red'
    person.date_of_birth.should == Time.parse("March 3 1985")
  end

  it 'should parse a space record' do
    person = RecordParser.new.parse(space_record)
    person.first_name.should == 'Anna'
    person.last_name.should == 'Kournikova'
    person.favorite_color.should == 'Red'
    person.date_of_birth.should == Time.parse("June 3 1975")
  end
end
