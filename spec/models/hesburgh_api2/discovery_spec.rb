
describe HesburghAPI2::Discovery do
  subject { described_class }

  describe :record do

    it "returns empty string if the record is not found" do
      VCR.use_cassette 'discovery2/record_id/not_an_id' do
        expect { subject.record("not_an_id") }.to raise_error(subject::NotFound)
      end
    end


    it "returns the json for the record from our catalog" do
      VCR.use_cassette 'discovery2/record_id/ndu_aleph003042657' do
        expect(subject.record("ndu_aleph003042657")['id']).to eq("dedupmrg15940890")
      end
    end


    it "returns the json for the record from nd law" do
      VCR.use_cassette 'discovery2/record_id/ndlaw_iii.b1274315x ' do
        expect(subject.record("ndlaw_iii.b1274315x")['id']).to eq("dedupmrg15940890")
      end
    end


    it "returns the json for the record from bci" do
      VCR.use_cassette 'discovery2/record_id/bci_aleph000109663 ' do
        expect(subject.record("bci_aleph000109663")['id']).to eq("dedupmrg13765448")
      end
    end


    it "returns the json for the record from hcc" do
      VCR.use_cassette 'discovery2/record_id/hcc_aleph000012199 ' do
        expect(subject.record("hcc_aleph000012199")['id']).to eq("dedupmrg13765448")
      end
    end


    it "returns the json for the record from hcc" do
      VCR.use_cassette 'discovery2/record_id/smc_aleph000170822' do
        expect(subject.record("smc_aleph000170822")['id']).to eq("dedupmrg34637031")
      end
    end



    it "returns the json for the record from primo central" do
      VCR.use_cassette 'discovery2/record_id/TN_medline17746563' do
        expect(subject.record("TN_medline17746563")['id']).to eq("TN_medline17746563")
      end
    end


  end

  describe :fullview do
    it "returns the json for the record from our catalog" do
      VCR.use_cassette 'discovery2/fullview/ndu_aleph003042657' do
        expect(subject.fullview("ndu_aleph003042657")['id']).to eq("dedupmrg15940890")
      end
    end
  end

  describe :holds_list do
    it "returns the json for the record from our catalog" do
      VCR.use_cassette 'discovery2/holds_list/ndu_aleph001526576' do
        data = subject.holds_list("dedupmrg47445220", "PRIMO")
        expect(data['id']).to eq("dedupmrg47445220")
        expect(data['holds_list']).to be_a_kind_of(Hash)
      end
    end
  end

  describe :place_request do
    let(:item_number) { 'PRIMO$$$NDU01001526576$$$NDU50001526576000010' }
    let(:pickup_location) { 'HESB' }

    it "makes a put request" do
      VCR.use_cassette 'discovery2/holds_request/ndu_aleph001526576' do
        response = subject.place_hold(item_number: item_number, pickup_location: pickup_location)
        expect(response['status']).to eq "Success"
      end
    end

    it "makes a put request" do
      VCR.use_cassette 'discovery2/holds_request/fake' do
        response = subject.place_hold(item_number: 'fake', pickup_location: pickup_location)
        expect(response['status']).to eq "Failure"
      end
    end
  end

end
