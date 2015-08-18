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
    user = User.create(params[:user])
    json({id: user.id})
  end

  get '/' do
    json 'Hello World'
  end
end
