require File.expand_path('../helper', __FILE__)

describe "RequestResponse" do
  let(:riak_url){ "http://#{RIAK_CONFIG[:host]}:#{RIAK_CONFIG[:port]}" }

  describe "can process a GET" do
    let(:request_response){ Shinobi::RequestResponse.new :get, "#{riak_url}/ping", :foo }

    it "verifies the status code" do
      assert_equal 200, request_response.run.status
    end

    it "verifies the value code" do
      assert_equal 'OK', request_response.run.value
    end
  end

  describe "can process a PUT" do
    let(:request_response){ Shinobi::RequestResponse.new :put, "#{riak_url}/buckets/test/keys/request_response_put", :foo }

    it "verifies the status code" do
      assert_equal 204, request_response.run.status
    end

    it "verifies the value code" do
      assert_equal '', request_response.run.value
    end
  end
end
