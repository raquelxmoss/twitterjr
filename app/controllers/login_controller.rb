enable :sessions

get '/' do
  erb :login
end

post '/users/new' do
  handle = params[:handle]
  email = params[:handle]
  fullname = params[:full_name]
  password = params[:password]
  gravatar = params[:gravatar]

  User.create(handle: handle, email: email, full_name: fullname, password: password, gravatar: gravatar)
  redirect '/users/:id/feed'
end

post '/login' do
  handle = params[:handle]
  password = params[:handle]

  if user = User.authenticate(handle, password)
    session[:user] = user
    session[:error] = nil #used to raise an error if incorrect password
    redirect '/users/:id/feed'
  else
    session[:error] = "Invalid password, please try again"
    redirect '/login'
  end
end
