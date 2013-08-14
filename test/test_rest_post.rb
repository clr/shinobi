require File.expand_path('../helper', __FILE__)

describe "Rest Interface POSTs" do
  let(:client){ Riak.new RIAK_CONFIG }

  describe "successful POST method" do
    before do
      @response_0 = client.post('ninja_weapons', 'abacus')
      @response_1 = client.post('ninja_weapons', 'dagger')
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 204, @response_0.status
      assert_equal 204, @response_1.status
    end

    it "verifies the key to the ninja's weapons" do
      assert !@response_0.key.nil?
      assert !@response_1.key.nil?
    end

    it "verifies the value of the ninja's weapons" do
      assert_equal '(boom)', @response_0.value
      assert_equal '(stab)', @response_1.value
    end
  end
end
