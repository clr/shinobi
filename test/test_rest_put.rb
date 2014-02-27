require File.expand_path('../helper', __FILE__)

describe "Rest Interface PUTs" do
  let(:client){ Shinobi::Riak.new RIAK_CONFIG }

  describe "successful PUT method" do
    before do
      @response_0 = client.put('ninja_weapons', 'abacus', '(boom)')
      @response_1 = client.put('ninja_weapons', 'dagger', '(stab)')
    end

    it "returned RequestResponses" do
      assert @response_0.is_a? Shinobi::RequestResponse
      assert @response_1.is_a? Shinobi::RequestResponse
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 204, @response_0.status
      assert_equal 204, @response_1.status
    end

    it "verifies the path to the ninja's weapons" do
      assert @response_0.url.match '/buckets/ninja_weapons/keys/abacus'
      assert @response_1.url.match '/buckets/ninja_weapons/keys/dagger'
    end
  end
end
