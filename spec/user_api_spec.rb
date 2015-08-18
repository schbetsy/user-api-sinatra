RSpec.describe UserApi do
  describe 'get /' do
    context 'not authenticated' do
      it 'outputs json' do
        get '/'
        expect(last_response.content_type).to eq 'application/json'
      end
      it 'contains "Hello World"' do
        get '/'
        expect(last_response.body).to match 'Hello World'
      end
    end
  end

  describe 'get /user' do
    context 'given id of an existing user' do
      let!(:user) { User.create(username: 'betsy', password: 'password', info: 'stuff') }
      it "returns the requested user's information" do
        get "/user/#{user.id}"
        expect(JSON.parse(last_response.body)['username']).to match 'betsy'
        expect(JSON.parse(last_response.body)['info']).to match 'stuff'
      end
    end
    context 'given an invalid user id' do
      it "returns a message" do
        get "/user/0"
        expect(JSON.parse(last_response.body)['message']).to match 'invalid'
      end
    end
  end

  describe 'post /user' do
    context 'given username and password data' do
      let(:user_params) { {username: 'schbetsy', password: 'password', info: {name: 'betsy'}.to_json} }
      it 'creates new user in the database' do
        expect do
          post '/user', user: user_params
        end.to change{User.count}.by(1)
      end
    end
    context 'without username and password' do
      let(:user_params) { {info: {name: 'betsy'}.to_json} }
      it 'does not add a new user' do
        expect do
          post '/user', user: user_params
        end.not_to change{User.count}
      end
      it 'returns an error' do
        post '/user', user: user_params
        expect(JSON.parse(last_response.body)['message']).to match 'invalid'
      end
    end
  end

  describe 'put /user' do
    let(:old_info) { {name: 'betsy'}.to_json }
    let(:new_info) { {name: 'Inigo Montoya'}.to_json }
    context 'given id of an existing user' do
      let!(:user) { User.create(username: 'betsy2', password: 'password', info: old_info) }
      it "returns the requested user's information" do
        put "/user/#{user.id}", user: {info: new_info}
        user.reload
        expect(user.info).to match 'Inigo Montoya'
      end
    end
  end

  describe 'post /auth' do
    let!(:user) { User.create(username: 'betsy4', password: 'password') }

    context 'given correct username and password for existing user' do
      let(:user_params) { {username: 'betsy4', password: 'password' } }
      it 'returns token' do
        post '/auth', user_params
        expect(JSON.parse(last_response.body)['token']).to be
      end
      it 'assigns token to user' do
        post '/auth', user_params
        user.reload
        expect(user.auth_token).not_to be_nil
      end
    end

    context 'given incorrect username and/or password' do
      let(:user_params) { {username: 'betsy4', password: 'wrong_password' } }
      it 'returns message' do
        post '/auth', user_params
        expect(JSON.parse(last_response.body)['message']).to match 'invalid'
      end
    end
  end

end
