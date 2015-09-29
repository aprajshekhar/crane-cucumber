require_relative 'client'

module CraneApiTests

  class SearchClient < Client

    def initialize(url)
      super(url)
    end

    def search(keyword)
      @log.info('searching for: '+keyword)
      sub_url = '/v1/search?q='+keyword
      @log.info('search url with keyword: '+sub_url)
      return get_data(sub_url)
    end

  end
end