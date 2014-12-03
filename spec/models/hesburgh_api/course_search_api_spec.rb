require 'spec_helper'


describe HesburghAPI::CourseSearchApi do

    let(:example_response) { JSON.parse(eval(File.open(Rails.root.join('../spec', 'fixtures', 'course_by_crosslist_id_201410_11596.json')).read).to_json)}
    let(:subject) { HesburghAPI::CourseSearchApi }

    before(:each) do
        expect(subject).to receive(:get_json).with('by_crosslist/201410_11596').and_return(example_response)
        @result = subject.courses_by_crosslist_id('201410_11596')
    end


  it "returns an array of courses with the crosslist id" do
    expect(@result.class).to eq(Array)
    expect(@result.size).to eq(1)
  end

  context :cache_key_date_code do

    it "sets key as the current date if it is after 5am " do
      expect(subject).to receive(:current_time).and_return("07/11/2013 05:47:AM".to_time)
      expect(subject.cache_key_date_code).to eq("11-07-2013")
    end


    it "sets the key as the previous date if the time is before 5am" do
      expect(subject).to receive(:current_time).and_return("07/11/2013 04:47:AM".to_time)
      expect(subject.cache_key_date_code).to eq("11-06-2013")
    end

  end

end
