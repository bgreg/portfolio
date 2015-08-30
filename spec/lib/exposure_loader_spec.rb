require 'rails_helper'

describe ExposureLoader do
  let(:remote_uri) { "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml" }
  let!(:nvd_data)  { File.read("spec/support/nvdcve-2.0-modified.xml") }

  class StubLoader 
    include ExposureLoader
  end

  context "#download" do 
    it "can download and import data" do 
      expect( StubLoader.new.download(nvd_data)).to change(Exposure.count).by(300)
    end
  end
end
