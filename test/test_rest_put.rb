require File.expand_path('../helper', __FILE__)

describe "Rest Interface PUTs" do
  let(:client){ Riak.new RIAK_CONFIG }

  describe "successful PUT method" do
    before do
      @response_0 = client.put('ninja_weapons', 'abacus', '(boom)')
      @response_1 = client.put('ninja_weapons', 'dagger', '(stab)')
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 204, @response_0.status
      assert_equal 204, @response_1.status
    end

    it "verifies the key to the ninja's weapons" do
      assert_equal 'abacus', @response_0.key
      assert_equal 'dagger', @response_1.key
    end

    it "verifies the value of the ninja's weapons" do
      assert_equal '(boom)', @response_0.value
      assert_equal '(stab)', @response_1.value
    end
  end
end
