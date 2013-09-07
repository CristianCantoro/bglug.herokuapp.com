require 'sinatra'
require 'haml'
require 'kramdown'
require 'kramdown-haml'

get '/' do
  redirect '/ld/2013/'
end

get '/ld/2013/?' do
  haml 'ld/2013/index'.to_sym, :format => :html5, :layout => :linuxday
end

get '/ld/2013/segui' do
  haml 'ld/2013/segui'.to_sym, :format => :html5, :layout => :linuxday
end

not_found do
  haml :notfound
end

__END__

@@notfound
!!!
%html(xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en")
  %head
    %meta(charset="UTF-8")
    %title 404 - Not Found
  %body
    %p{style="margin: auto; text-align: center; font-size: 40px"} 404 - Not Found.
