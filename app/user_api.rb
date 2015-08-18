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

  get '/' do
    json 'Hello World'
  end
end
