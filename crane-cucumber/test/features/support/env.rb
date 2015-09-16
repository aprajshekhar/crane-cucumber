require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/status_client', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/CraneApiTests/metadata_cache', __FILE__)
require_relative File.expand_path('../../stepdef_helpers/configuration', __FILE__)

Configuration.load(ENV['TEST_ENV'])
BASE_URL = Configuration["base_url"]

Configuration.load(ENV['PATHS'])
FILE_PATH = Configuration["json"]

@cache = CraneApiTests::MetadataCache.new(FILE_PATH)

