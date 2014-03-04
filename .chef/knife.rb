# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "suguru"
client_key               "#{current_dir}/suguru.pem"
validation_client_name   "suguru-validator"
validation_key           "#{current_dir}/suguru-validator.pem"
chef_server_url          "https://ip-10-152-150-67.ap-northeast-1.compute.internal/organizations/suguru"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
