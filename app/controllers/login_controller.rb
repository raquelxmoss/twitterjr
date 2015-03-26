enable :sessions
require 'sanitize'

get '/' do
  erb :login
end

post '/users/new' do
  options = {
    :handle => Sanitize.fragment(params[:handle]),
    :email => Sanitize.fragment(params[:email]),
    :full_name => Sanitize.fragment(params[:full_name]),
    :password => Sanitize.fragment(params[:password]),
    :gravatar => Sanitize.fragment(params[:gravatar])
}

  User.create(options)
  redirect '/users'
end

post '/login' do
  handle = Sanitize.fragment(params[:handle])
  password = Sanitize.fragment(params[:password])

  if handle != params[:handle] || password != params[:password]
    session[:phill] = "<div class='alert alert-danger error'>YOU SHALL NOT PASS! (Phill)</div>"
    redirect '/'
  else
    session[:phill] = nil
  end

  if user = User.authenticate(handle, password)
    session[:user] = user
    session[:error] = nil
    redirect "/feed"
  else
    session[:error] = "Invalid password, please try again"
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end



