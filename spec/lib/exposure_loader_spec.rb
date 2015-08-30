require 'rails_helper'

describe ExposureLoader do
  let(:remote_uri) { "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml" }
  let!(:nvd_data)  { "spec/support/nvdcve-2.0-modified.xml" }

  class StubLoader
    include ExposureLoader
  end

  context "#download" do
    before do
      StubLoader.new.download(nvd_data)
    end

    it "will build exposures from an imported file" do
      expect( Exposure.count ).to eq(554)
    end

    it "will build references fomr an imported file" do
      expect( Reference.count ).to eq(1611)
    end
  end
end
