module Shinobi
  class RequestResponse
    attr :url, :verb, :status, :value

    def initialize(verb, url, data=nil)
      @verb = verb
      @url  = url
      @data = data
    end

    def run
      if process_request_body?
        http = run_with_body
      else
        http = run_without_body
      end

      @status = http.status.to_i
      @url    = http.url
      @value  = http.body_str
      return self
    end

    def run_with_body
      return Curl.send @verb, @url, @data do |curl|
        curl.headers['Content-Type'] = 'text/plain'
      end
    end

    def run_without_body
      return Curl.send @verb, @url
    end

    private
    def process_request_body?
      [:post, :put].include? @verb
    end
  end
end
