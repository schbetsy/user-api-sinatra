class UserApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/user/:id' do
    user = User.find_by_id(params[:id])
    if user
      json({username: user.username, info: user.info})
    else
      json({message: 'invalid user id'})
    end
  end

  post '/user' do
    user = User.new(params[:user])
    if user.save
      json({id: user.id})
    else
      json({message: 'invalid user. username and password required.'})
    end
  end

  put '/user/:id' do
    user = User.find_by_id(params[:id])
    if user
      new_info = params[:user][:info]
      user.update_attributes(info: new_info)
      json({username: user.username, info: user.info})
    else
      json({message: 'invalid user id'})
    end
  end

  get '/' do
    json 'Hello World'
  end

  post '/auth' do
    user = User.find_by_username(params[:username])
    password_entered = params[:password]
    if user && user.password == password_entered
      token = user.generate_token!
      json token: token
    else
      json message: 'invalid username or password'
    end
  end
end
