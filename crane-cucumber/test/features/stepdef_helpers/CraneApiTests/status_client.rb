require_relative 'client'
module CraneApiTests

  class StatusClient < Client

    def initialize(url)
      super(url)
    end

    def get_status
      sub_url = '/v1/_ping'
      return get_data(sub_url)
    end

  end

end
