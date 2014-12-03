require 'spec_helper'


describe HesburghAPI::PrintReserves do

    let(:all_print_reserves) { JSON.parse(eval(File.open(Rails.root.join('../spec', 'fixtures', 'all_print_reserves.json')).read).to_json)}
    let(:subject) { HesburghAPI::PrintReserves }

    describe :all do

        before(:each) do
            expect(subject).to receive(:get_json).and_return(all_print_reserves)
        end

        let(:results) { subject.all }

        it "returns an array with the results" do
            expect(results.class).to eq(Array)
        end

        it "has a bib_id" do
            record = results.first
            expect(record.has_key?("bib_id")).to be_true
        end

        it "has a crosslist id" do
            record = results.first
            expect(record.has_key?("crosslist_id")).to be_true
        end


        it "has a doc_number" do
            record = results.first
            expect(record.has_key?("doc_number")).to be_true
        end
    end


    describe :find_by_bib_id_course_id do
        
        before(:each) do
            expect(subject).to receive(:get_json).and_return(all_print_reserves)
        end
            
        let(:record) { subject.find_by_bib_id_course_id('000846188', '201410_NZ') }

        it "returns an array " do
            expect(record.class).to eq(Array)
        end

        it "finds a record " do
            expect(record.first['sid']).to eq("NDU01-000846188-MUS-50022-01")
        end

        it "returns empty array if not found" do
            record = subject.find_by_bib_id_course_id('adfsasdffd', '201320_24573')
            expect(record).to eq([])
        end
    end


    describe :find_by_rta_id do
        
        before(:each) do
            expect(subject).to receive(:get_json).and_return(all_print_reserves)
        end

        it "returns an array " do
            record = ''
            record = subject.find_by_rta_id_course_id('000050614', '201320_24573')
            expect(record.class).to eq(Array)
        end

        it "finds a record " do
            record = ''
            record = subject.find_by_rta_id_course_id('000030726', '201410_17378')
            expect(record.first['sid']).to eq("NDU01-001775554-LLRO-13186-02")
        end

        it "returns empty array if not found" do
            record = ''
            record = subject.find_by_rta_id_course_id('notanid', '201310_PQ')
            expect(record).to eq([])
        end
    end



    def all_results
        file = File.join(Rails.root, 'spec', 'fixtures', 'json_save', 'print_reserves', 'all.json')
        File.read(file)
    end

end
