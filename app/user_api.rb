class UserApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    json 'Hello World'
  end
end
