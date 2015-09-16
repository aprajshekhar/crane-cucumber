require 'rest_client'
require 'logging'
require 'connection_pool'
require 'net/ping/http'

module CraneApiTests
  Logging.logger.root.appenders = Logging.appenders.stdout
  Logging.logger.root.level = :info

  class Client

    def initialize(url)
      @log = Logging.logger[self]
      @log.info 'url: '+url
      @url = url
      @memcached = ConnectionPool.new(:size=>5, :timeout=>10){
        RestClient::Resource.new(url, :timeout=>1000 )
      }

    end

    def is_up?
      @log.info 'url: '+@url
      check = Net::Ping::HTTP.new(@url)
      check.ping?
    end

    protected
    def get_data(sub_url)
      @memcached.with do|site|
        @log.info 'sub-url: '+sub_url
        response = site[sub_url].get :accept=>'application/json'
        return response
      end
    end


  end
end