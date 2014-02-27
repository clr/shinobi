require File.expand_path('../helper', __FILE__)

describe "Rest Interface POSTs" do
  let(:client){ Shinobi::Riak.new RIAK_CONFIG }

  describe "successful POST method" do
    before do
      @response_0 = client.post 'ninja_weapons', 'abacus'
      @response_1 = client.post 'ninja_weapons', 'dagger'
    end

    it "returned RequestResponses" do
      assert_equal Shinobi::RequestResponse, @response_0.class
      assert_equal Shinobi::RequestResponse, @response_1.class
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 201, @response_0.status
      assert_equal 201, @response_1.status
    end

    it "verifies the path to the ninja's new weapons" do
      assert @response_0.url.match('/buckets/ninja_weapons/keys'), "Wrong Url: #{@response_0.url}"
      assert @response_1.url.match('/buckets/ninja_weapons/keys'), "Wrong Url: #{@response_1.url}"
    end
  end
end
