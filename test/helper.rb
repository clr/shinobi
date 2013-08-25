$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'yaml'

require 'minitest/spec'
require 'minitest/autorun'

require File.join('lib','riak')

RIAK_CONFIG = YAML.load(File.read(File.expand_path(File.join('..','riak.yml'), __FILE__)))[:test]
