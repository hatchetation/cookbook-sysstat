name 'sysstat'
maintainer 'Simply Measured'
maintainer_email 'infrastructure@simplymeasured.com'
license 'Apache 2.0'
description 'Installs/Configures sysstat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.4.4'

recipe 'sysstat', 'Installs/Configures sysstat'

%w(debian ubuntu).each do |os|
  supports os
end

depends 'cron'
