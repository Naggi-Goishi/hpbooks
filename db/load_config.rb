require 'yaml'

class Hash
  def keys_to_sym
    self.inject({}) do |hash, (key, value)|
      value = value.keys_to_sym if value.class == Hash
      hash[key.to_sym] = value
      hash
    end
  end
end

# this wil will be executed from Rakefile,
# so if you want to execute this file alone,
# you may need to chenge the path of to "../../config/database.yml"
File.open('config/database.yml') do |config|
  CONFIG = YAML.load(config.read).keys_to_sym
end

DEVELOPMENT = CONFIG[:development]