RSpec.describe UserApi do
  describe 'get /' do
    context 'not authenticated' do
      it 'outputs json' do
        get '/'
        expect(last_response.content_type).to eq 'JSON'
      end
      it 'contains "Hello World"' do
        get '/'
        expect(last_response.body).to_match 'Hello World'
      end
    end
  end
end
