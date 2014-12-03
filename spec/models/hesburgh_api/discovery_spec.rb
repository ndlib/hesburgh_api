
describe HesburghAPI::Discovery do


  describe :record do

    it "returns empty string if the record is not found" do
      VCR.use_cassette 'discovery/record_id/not_an_id' do
        expect { HesburghAPI::Discovery.record("not_an_id") }.to raise_error(HesburghAPI::Discovery::NotFound)
      end
    end


    it "returns the json for the record from our catalog" do
      VCR.use_cassette 'discovery/record_id/ndu_aleph003042657' do
        expect(HesburghAPI::Discovery.record("ndu_aleph003042657")['id']).to eq("dedupmrg15940890")
      end
    end


    it "returns the json for the record from nd law" do
      VCR.use_cassette 'discovery/record_id/ndlaw_iii.b1274315x ' do
        expect(HesburghAPI::Discovery.record("ndlaw_iii.b1274315x")['id']).to eq("dedupmrg15940890")
      end
    end


    it "returns the json for the record from bci" do
      VCR.use_cassette 'discovery/record_id/bci_aleph000109663 ' do
        expect(HesburghAPI::Discovery.record("bci_aleph000109663")['id']).to eq("dedupmrg13765448")
      end
    end


    it "returns the json for the record from hcc" do
      VCR.use_cassette 'discovery/record_id/hcc_aleph000012199 ' do
        expect(HesburghAPI::Discovery.record("hcc_aleph000012199")['id']).to eq("dedupmrg13765448")
      end
    end


    it "returns the json for the record from hcc" do
      VCR.use_cassette 'discovery/record_id/smc_aleph000170822' do
        expect(HesburghAPI::Discovery.record("smc_aleph000170822")['id']).to eq("dedupmrg34637031")
      end
    end



    it "returns the json for the record from primo central" do
      VCR.use_cassette 'discovery/record_id/TN_medline17746563' do
        expect(HesburghAPI::Discovery.record("TN_medline17746563")['id']).to eq("TN_medline17746563")
      end
    end


  end


  describe :fix_id do

    it "appends ndu_aleph if the the id is all numeric and 9 characters long" do
      expect(HesburghAPI::Discovery.fix_id("025332532")).to eq("ndu_aleph025332532")
    end


    it "does not append ndu_aleph if the id is less then 9 characters" do
      expect(HesburghAPI::Discovery.fix_id("02533253")).to eq("02533253")
    end


    it "does not append ndu_aleph if the id contains alpha charcters" do
      expect(HesburghAPI::Discovery.fix_id("a02533253")).to eq("a02533253")
    end

    it "does not append ndu_aleph if the number is longer then 9 characters" do
      expect(HesburghAPI::Discovery.fix_id("0253325300")).to eq("0253325300")
    end

  end
end
