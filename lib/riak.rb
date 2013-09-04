require 'faraday'

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
      attr_accessor :status, :body
      # status, key, value
      def initialize(response)
        @status = response[:status]
        @body = response[:body]
      end
    end

    def get(bucket, key)
    end

    def put(bucket, key, value, headers = nil)
      # consult concurrent strategy (poc)
      # determine how valuable & realistic this abstraction will actually be

      # put to riak
      uri = build_uri_for(bucket, key)

      header = { 'Content-Type' => 'application/json' }
      header.merge(headers) unless headers.nil?

      client = Faraday.new(url: uri, headers: header)

      response = client.put '', value

      # return response
      Response.new({status: response.status, body: response.body})
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
