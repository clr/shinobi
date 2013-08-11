require File.expand_path('../helper', __FILE__)

describe "Rest Interface POSTs" do
  let(:client) {
    @client = Riak.new RIAK_CONFIG
  }

  describe "successful POST method" do
    before do
      @response = []
      @response << @client.post('ninja_weapons', 'abacus')
      @response << @client.post('ninja_weapons', 'dagger')
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 204, response[0].status
      assert_equal 204, response[1].status
    end

    it "verifies the key to the ninja's weapons" do
      assert !response[0].key.nil?
      assert !response[1].key.nil?
    end

    it "verifies the value of the ninja's weapons" do
      assert_equal '(boom)', response[0].value
      assert_equal '(stab)', response[1].value
    end
  end
end
