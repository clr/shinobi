module Shinobi
  class Riak

    def initialize(config)
      @host = config[:host]
      @port = config[:port]
    end

    def ping
      begin
        http = Curl.get url('ping')
        http.body_str == 'OK'
      rescue => e
        false
      end
    end

    def get(bucket, key)
      request_response = Shinobi::RequestResponse.new :get, url('buckets', bucket, 'keys', key)
      request_response.run
    end

    def put(bucket, key, data)
      request_response = Shinobi::RequestResponse.new :put, url('buckets', bucket, 'keys', key), data
      request_response.run
    end

    def post(bucket, data)
      request_response = Shinobi::RequestResponse.new :post, url('buckets', bucket, 'keys'), data
      request_response.run
    end

    def delete(bucket, key)
      request_response = Shinobi::RequestResponse.new :delete, url('buckets', bucket, 'keys', key)
      request_response.run
    end

    private
    def url(*args)
      "http://#{@host}:#{@port}/#{args.join('/')}"
    end
  end
end
