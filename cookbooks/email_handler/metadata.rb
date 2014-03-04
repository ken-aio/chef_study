name             'email_handler'
maintainer       'ken-aio'
maintainer_email 'hoge@example.com'
license          'All rights reserved'
description      'Installs/Configures email_handler'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'chef_handler'
depends 'postfix'
depends 'mailx'
