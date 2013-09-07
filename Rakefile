task :default => :rackup

task :sass do
  sh 'sass public/css/linuxday.scss public/css/linuxday.css'
end

task :bundle  do
  sh 'bundle update'
end

task :bundle_install do
  sh 'bundle install --without production test'
end

task :srvstart do
  sh 'rackup &'
end

task :srvstop do
  sh 'killall rackup'
end
