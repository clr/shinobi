require 'curb'
require 'rake'
require 'yaml'

module Shinobi
end

# Include all of the support files.
FileList[File.expand_path(File.join('..','shinobi','*.rb'),__FILE__)].each{|f| require f}
