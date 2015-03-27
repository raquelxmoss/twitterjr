enable :sessions

get '/feed' do
  unless session[:user].nil?
    id = session[:user].id
    user = User.find(id)
    @followers = user.followers.includes(:tweets)
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

get '/update_profile' do
  unless session[:user].nil?
    @user = session[:user]
    session[:error] = nil
    erb :'session_pages/update_profile'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end

get '/follow/:user_id' do
  unless User.find(params[:user_id]).nil?
    unless session[:user].nil?
      user_to_follow = User.find(params[:user_id])
      user = User.find(session[:user].id)
      user.followers << user_to_follow
      redirect '/follow'
    else
      session[:error] = "Something went wrong"
      redirect '/follow'
    end
  end
end

get '/unfollow/:user_id' do
  unless User.find(params[:user_id]).nil?
    unless session[:user].nil?
      user_to_unfollow = User.find(params[:user_id])
      user = User.find(session[:user].id)
      user.followers.delete user_to_unfollow
      redirect '/follow'
    else
      session[:error] = "Something went wrong"
      redirect '/follow'
    end
  end
end

get '/follow' do
    unless session[:user].nil?
      user = User.find(session[:user].id)
      @followers = user.followers
      @users = User.where.not(id: session[:user].id)
      erb :'session_pages/follow_people'
    else
      session[:error] = "Something went wrong"
      redirect '/'
    end
end

post '/tweet/create' do
    status = params[:status]
    unless session[:user].nil?
      user = User.find(session[:user].id)
      user.tweets << Tweet.create(status: status)
      redirect '/feed'
    else
      session[:error] = "Something went wrong"
      redirect '/feed'
    end
end

post '/update_profile' do
unless session[:user].nil?
options = {
 handle: params[:handle],
 full_name: params[:full_name],
 bio: params[:bio],
 gravatar: params[:gravatar]
}
session[:user].update(options)
redirect '/update_profile'
else
  session[:error] = "Something went wrong"
  redirect '/'
end


    @user = session[:user]
    session[:error] = nil
    redirect "/profile/#{session[:user].id}"

end
