require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/status_client', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/repository_client', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/search_client', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/metadata_cache', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/configuration', __FILE__)
require 'active_support/json'

Configuration.load(ENV['TEST_ENV'])
BASE_URL = Configuration["base_url"]

Configuration.load(ENV['DIR'])
FILE_PATH = Configuration["json"]

@cache = CraneApiTests::MetadataCache.new("#{FILE_PATH}")
p 'Loaded repo list [' + @cache.repo_id_list.to_s + ']'
p 'Loaded cache ['+ @cache.cache.inspect.to_s + ']'

