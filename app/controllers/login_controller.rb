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
    redirect "/feed"
  else
    session[:error] = "<div class='alert alert-danger error' role='alert'>Invalid password, please try again</div>"
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end



