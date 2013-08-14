require File.expand_path('../helper', __FILE__)

describe "Rest Interface GETs" do
  let(:client){ Riak.new RIAK_CONFIG }

  describe "successful GET method" do
    before do
      client.put('ninja_weapons', 'abacus', '(boom)')
      client.put('ninja_weapons', 'dagger', '(stab)')

      @response_0 = client.get('ninja_weapons', 'abacus')
      @response_1 = client.get('ninja_weapons', 'dagger')
    end

    it "verifies the status of the ninja's weapons" do
      assert_equal 200, @response_0.status
      assert_equal 200, @response_1.status
    end

    it "verifies the value of the ninja's weapons" do
      assert_equal '(boom)', @response_0.value
      assert_equal '(stab)', @response_1.value
    end
  end

  describe "unsuccessful GET method" do
    before do
      let(:response){ client.get('ninja', 'location') }
    end

    it "can't find a ninja in the shadows" do
      assert_equal 404, @response_0.status
    end

    it "knows we are looking for a hiding ninja" do
      assert_equal 'location', @response_0.key
    end

    it "can't find a location for hiding ninja" do
      assert_equal nil, @response_0.value
    end
  end
end
