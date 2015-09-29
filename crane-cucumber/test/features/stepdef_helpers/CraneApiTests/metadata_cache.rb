require 'logging'
require 'active_support/cache'
require 'active_support/cache/memory_store'
require 'active_support/json'

module CraneApiTests
  Logging.logger.root.appenders = Logging.appenders.stdout
  Logging.logger.root.level = :info

  class MetadataCache
    attr_reader :cache
    attr_reader :repo_id_list

    def initialize(path)
      @log = Logging.logger[self]
      @cache = ActiveSupport::Cache::MemoryStore.new
      @repo_id_list = []
      createMetadataCache(path)
    end

    private

    def createMetadataCache(path)
      files = Dir.glob path+'/*.json'
      files.each do |file|
          read_json(file)
      end
      @cache.write('repo-id-list',@repo_id_list)
    end

    def read_json(file)
      data = File.read(file)
      json_data = ActiveSupport::JSON.decode(data)
      p json_data['repo-registry-id']
      @cache.write(json_data['repo-registry-id'],json_data)
      @repo_id_list << json_data['repo-registry-id']
    end
  end
end
