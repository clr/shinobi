module RiakAPI
  class Bucket
  end

  class Key
  end

  class Value
  end

  module Rest
    # HTTP Header Model
    class Header
    end

    class Response
      # status, key, value
    end

    def get(bucket, key)
    end

    def put(bucket, key, value, headers = nil)
      # consult strategy
      # put to riak
      uri = build_uri_for(bucket, key)
      # return response
      {status: 204, message: {}}
    end

    def delete(bucket, key)
    end

    def post(bucket, key, value, headers = nil)
    end

    def build_uri_for(bucket, key)
      URI.encode "http://#{@config[:host]}:#{@config[:http_port]}/buckets/#{bucket}/keys/#{key}"
    end
  end
end

class Riak
  include RiakAPI::Rest
  def initialize(config)
    @config = config
  end
end

# Abstract Class for Execution
class ExecutionStrategy
end

# Serial Strategy for API Invocation
class Serial < ExecutionStrategy
end

# Concurrent Strategy for API Invocation
# (Basic | Simple | Alternate | TBD)
class Concurrent < ExecutionStrategy
end
