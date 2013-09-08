require 'sinatra'
require 'haml'
require 'kramdown'
require 'kramdown-haml'
require 'google_drive'

get '/' do
  redirect '/ld/2013/'
end

get '/ld/2013/?' do
  haml 'ld/2013/index'.to_sym, :format => :html5, :layout => :linuxday
end

get '/ld/2013/segui' do
  haml 'ld/2013/segui'.to_sym, :format => :html5, :layout => :linuxday
end

get '/ld/2013/presenta' do
  haml 'ld/2013/presenta'.to_sym, :format => :html5, :layout => :linuxday
end

get '/ld/2013/installa' do
  haml 'ld/2013/installa'.to_sym, :format => :html5, :layout => :linuxday
end

get '/ld/2013/piudonnealbglug' do
  redirect 'https://docs.google.com/spreadsheet/ccc?key=0AiGfqla6ISdEdEJHYnNJYVEyS09ER2ctU203eVJVc0E&usp=sharing'
end

post '/ld/2013/conferma' do
  if params[:submit] == 'Conferma'
    case params[:azione]
      when 'segui' then 
        session = GoogleDrive.login('bglug.herokuapp@gmail.com', 'kill4win')
        oo = session.spreadsheet_by_key('0AiGfqla6ISdEdEJHYnNJYVEyS09ER2ctU203eVJVc0E').worksheets[1]
        row = oo.num_rows + 1

        oo[row, 1] = params[:nome]
        oo[row, 2] = params[:email]
        oo[row, 3] = params[:accompagnatore]
        oo[row, 4] = params[:accompagnati]
        oo[row, 5] = params[:note]
        oo.synchronize()

        haml 'ld/2013/conferma_segui'.to_sym, :layout => :linuxday, :format => :html5, :locals => params
      when 'presenta' then
        session = GoogleDrive.login('bglug.herokuapp@gmail.com', 'kill4win')
        oo = session.spreadsheet_by_key('0AiGfqla6ISdEdEJHYnNJYVEyS09ER2ctU203eVJVc0E').worksheets[0]
        row = oo.num_rows + 1

        oo[row, 1] = params[:nome]
        oo[row, 2] = params[:email]
        oo[row, 3] = params[:titolo]
        oo[row, 4] = params[:sessione]
        oo[row, 5] = params[:formato]
        oo[row, 6] = params[:abstract]
        oo.synchronize()

        haml 'ld/2013/conferma_presenta'.to_sym, :format => :html5, :layout => :linuxday, :locals => params
      when 'installa' then
        session = GoogleDrive.login('bglug.herokuapp@gmail.com', 'kill4win')
        oo = session.spreadsheet_by_key('0AiGfqla6ISdEdEJHYnNJYVEyS09ER2ctU203eVJVc0E').worksheets[2]
        row = oo.num_rows + 1

        oo[row, 1] = params[:nome]
        oo[row, 2] = params[:email]
        oo[row, 3] = params[:tipo]
        oo[row, 4] = params[:cpu]
        oo[row, 5] = params[:ram]
        oo[row, 6] = params[:flavor]
        oo[row, 7] = params[:note]
        oo.synchronize()

        haml 'ld/2013/conferma_installa'.to_sym, :format => :html5, :layout => :linuxday, :locals => params
    end
  end
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
