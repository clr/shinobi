require File.expand_path('../helper', __FILE__)

describe "Rest Interface PUTs" do
  let(:client) {
    @client = Riak.new RIAK_CONFIG
  }

  describe "successful PUT method" do
    before do
      @response = []
      @response << @client.put('ninja_weapons', 'abacus', '(boom)')
      @response << @client.put('ninja_weapons', 'dagger', '(stab)')
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 204, response[0].status
      assert_equal 204, response[1].status
    end

    it "verifies the key to the ninja's weapons" do
      assert_equal 'abacus', response[0].key
      assert_equal 'dagger', response[1].key
    end

    it "verifies the value of the ninja's weapons" do
      assert_equal '(boom)', response[0].value
      assert_equal '(stab)', response[1].value
    end
  end
end
