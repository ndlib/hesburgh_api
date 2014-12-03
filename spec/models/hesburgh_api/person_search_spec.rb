require 'spec_helper'

describe HesburghAPI::PersonSearch do

    let(:example_response) { JSON.parse(File.open(Rails.root.join('../spec', 'fixtures', 'person_netid.json')).read)}
    let(:person_search_results) { JSON.parse(File.open(Rails.root.join('../spec', 'fixtures', 'person_search_results.json')).read)}
    let(:subject) { HesburghAPI::PersonSearch }

    describe "::find" do
        it "has the correct attributes" do
            expect(subject).to receive(:get_json).with('by_netid/testid').and_return(example_response)
            @user = HesburghAPI::PersonSearch.find('testid')
            ['id', 'netid', 'first_name', 'last_name', 'full_name', 'ndguid', 'position_title', 'campus_department', 'primary_affiliation', 'contact_information'].each do | key |
                expect(@user.has_key?(key)).to be_true
            end
        end
    end

    describe "::search" do
        before(:each) do
            expect(subject).to receive(:get_json).with('search/ro*').and_return(person_search_results)
            @results = HesburghAPI::PersonSearch.search('ro*')
        end

        it "returns a number of results" do
            expect(@results.count).to eq 5
        end

        it "returns necessary attributes" do
            expect(@results[2]['last_name']).to eq 'Frank'
            expect(@results[3]['uid']).to eq 'fake4'
        end
    end

end
