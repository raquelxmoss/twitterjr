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
  if user = User.authenticate(options[:handle], options[:password])
    session[:user] = user
    redirect "/follow"
  else
   @error = "<div class='alert alert-danger error' role='alert'>Invalid password, please try again</div>"
    erb :login
  end
end

post '/login' do
  handle = Sanitize.fragment(params[:handle])
  password = Sanitize.fragment(params[:password])

  if handle != params[:handle] || password != params[:password]
    @error = "<div class='alert alert-danger error'>YOU SHALL NOT PASS! (Phill)</div>"
    return erb :login
  end

    if user = User.authenticate(handle, password)
      session[:user] = user
      redirect "/feed"
    else
      @error = "<div class='alert alert-danger error' role='alert'>Invalid password, please try again</div>"
      erb :login
    end

end

get '/logout' do
  session.clear
  redirect '/'
end



