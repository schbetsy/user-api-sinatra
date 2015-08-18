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
end
