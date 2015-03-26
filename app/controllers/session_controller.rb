enable :sessions

get '/feed' do
  unless session[:user].nil?
    id = session[:user].id
    @user = User.find(id)
    session[:error] = nil
    erb :'session_pages/my_feed'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end

get '/followers' do
  unless session[:user].nil?
    @followers = User.find(session[:user].id).followers
    session[:error] = nil
    erb :'session_pages/followers'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end
