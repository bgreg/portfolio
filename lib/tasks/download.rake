# "https://nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-2014.xml"
# "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"

require 'exposure_loader'

namespace :db do
  desc "Download all exposure data"
  task download: :environment do
    include ExposureLoader
    path = ENV['NVD_URL'] || "https://nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-2014.xml"
    download(path)
  end
end
