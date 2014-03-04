name "base"
description "Base Server Role"
run_list "recipe[email_handler]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client]",
  "recipe[ntp]",
  "recipe[motd]",
  "recipe[users]"
