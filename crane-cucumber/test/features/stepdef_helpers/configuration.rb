require 'yaml'

class Configuration
  def self.[] key
    @@config[key]
  end

  def self.load name
    @@config = nil
    path = ENV['CONFIG_FILE'] ||  File.dirname(__dir__)
    p "config path: "
    p ENV['CONFIG_FILE']
    io =  File.open(path + "/support/config.yaml" )
    YAML::load_documents(io) { |doc| @@config = doc[name] }
    raise "Could not locate a configuration named \"#{name}\"" unless @@config
  end

  def self.[]= key, value
    @@config[key] = value
  end

end

raise "Please set the TEST_ENV environment variable" unless ENV['TEST_ENV']
raise "Please set the DIR environment variable" unless ENV['DIR']
