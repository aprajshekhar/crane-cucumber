require_relative 'client'
module CraneApiTests

  class RepositoryClient < Client

    def initialize(url)
      super(url)
    end

    def get_repositories
      sub_url = '/crane/repositories'
      return get_data(sub_url)
    end

    def get_images(repo_id)
      sub_url = '/v1/repositories/'+repo_id+'/images'
      return get_data(sub_url)
    end

  end
end
