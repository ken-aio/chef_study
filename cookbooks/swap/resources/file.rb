actions :create, :destroy

attribute :file_name, :name_attribute => true, :kind_of => String
attribute :blocks, :default => 65536, :kind_of => Fixnum

default_action :create
