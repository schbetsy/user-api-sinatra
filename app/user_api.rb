class UserApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    "hi"
  end
end
