require_relative 'client'
module CraneApiTests

  class RepositoryClient < Client
    # needed to remove warning related to already defined constant
    # when used with cucumber
    URL_PART ||= '/v1/repositories/'
    def initialize(url)
      super(url)
    end

    def get_repositories
      sub_url = '/crane/repositories'
      return get_data(sub_url)
    end

    def get_images(repo_id)
      sub_url = "#{URL_PART}#{repo_id}/images"
      return get_data(sub_url)
    end

    def get_tags(repo_id)
      sub_url = "#{URL_PART}#{repo_id}/tags"
      return get_data(sub_url)
    end

    def get_tag(repo_id, tag)
      sub_url = "#{URL_PART}#{repo_id}/tags/#{tag}"
      return get_data(sub_url)
    end


  end
end
