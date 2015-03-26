enable :sessions

get '/' do
  erb :login
end

post '/users/new' do
  options = {
    :handle => params[:handle],
    :email => params[:email],
    :full_name => params[:full_name],
    :password => params[:password],
    :gravatar => params[:gravatar]
}

  User.create(options)
  redirect '/users'
end

post '/login' do
  handle = params[:handle]
  password = params[:password]

  if user = User.authenticate(handle, password)
    session[:user] = user
    session[:error] = nil
    redirect "/session_pages/my_feed"
  else
    session[:error] = "Invalid password, please try again"
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end



