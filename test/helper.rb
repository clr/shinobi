$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'minitest/spec'
require 'minitest/autorun'

require File.join('lib','shinobi')

RIAK_CONFIG = YAML.load(File.read(File.expand_path(File.join('..','riak.yml'), __FILE__)))[:test]

# Verify that the test server is responsive.
client = Shinobi::Riak.new RIAK_CONFIG
unless client.ping
  puts '****************************************************************'
  puts '     The test server is not responding. Please check that'
  puts '     the Riak node is online and responding to requests'
  puts '     at the host and port specified in the riak.yml file'
  puts '     in the test/ directory.'
  puts '****************************************************************'
  puts ' '
  raise 'Fatal Error.'
end
