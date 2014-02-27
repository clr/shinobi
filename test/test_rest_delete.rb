require File.expand_path('../helper', __FILE__)

describe "Rest Interface DELETEs" do
  let(:client){ Shinobi::Riak.new RIAK_CONFIG }

  describe "successful DELETE method" do
    before do
      client.put('ninja_weapons', 'abacus', '(boom)')
      client.put('ninja_weapons', 'dagger', '(stab)')

      @response_0 = client.delete('ninja_weapons', 'abacus')
      @response_1 = client.delete('ninja_weapons', 'dagger')
    end

    it "returned RequestResponses" do
      assert @response_0.is_a? Shinobi::RequestResponse
      assert @response_1.is_a? Shinobi::RequestResponse
    end

    it "verifies the emptiness of the ninja's former weapons" do
      assert_equal 204, @response_0.status
      assert_equal 204, @response_1.status
    end
  end
end
