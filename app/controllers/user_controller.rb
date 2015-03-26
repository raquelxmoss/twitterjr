enable :sessions
get '/users' do
  @users = User.all

  erb :'/users/index'
end

get '/my_feed' do
  unless session[:user].nil?
    id = session[:user].id
    @user = User.find(id)
    erb :'users/my_feed'
  else
    redirect '/'
  end
end






