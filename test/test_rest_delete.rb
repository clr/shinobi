require File.expand_path('../helper', __FILE__)

describe "Rest Interface DELETEs" do
  let(:client) {
    @client = Riak.new RIAK_CONFIG
  }

  describe "successful DELETE method" do
    before do
      @client.put('ninja_weapons', 'abacus', '(boom)')
      @client.put('ninja_weapons', 'dagger', '(stab)')

      @response = []
      @response << @client.delete('ninja_weapons', 'abacus')
      @response << @client.delete('ninja_weapons', 'dagger')
    end

    it "verifies the emptiness of the ninja's former weapons" do
      assert_equal 204, response[0].status
      assert_equal 204, response[1].status
    end
  end
end
