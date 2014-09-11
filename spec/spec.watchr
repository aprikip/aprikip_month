require 'autowatchr'

Autowatchr.new(self) do |config|
  config.ruby      = 'clear && rspec'
# config.lib_dir   = 'lib'
  config.test_dir  = 'spec'
# config.lib_re    = "^#{config.lib_dir}/.*\.rb$"
  config.test_re   = "^#{config.test_dir}/(.*)_spec\.rb$"
  config.test_file = '%s_spec.rb'
end
