require 'active_support/cache'
require 'active_support/cache/memory_store'
require 'active_support/json'

module CraneApiTests

  class MetadataCache
    def initialize(path)
      @cache = ActiveSupport::Cache::MemoryStore.new
      createMetadataCache(path)
    end

    private

    def createMetadataCache(path)
      files = Dir.glob path+'/*.json'
      files.each do |file|
          read_json(file)
        end
    end

    def read_json(file)
      data = File.read(file)
      json_data = ActiveSupport::JSON.decode(data)
      @cache.write(json_data['repo-registry-id'],json_data)
    end
  end
end
