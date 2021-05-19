require "rails_helper"
RSpec.describe "Search Books", :type => :request do
  before(:each) do
    @books_url = '/api/v1/books/' 
  end

  describe 'List Books' do
    describe 'GET /api/v1/books/' do
      context 'when search all books' do
        before do
          get @books_url
        end
        it 'returns status 200' do
          expect(response).to have_http_status(200)
        end
      end

      # context 'when search one book by title' do
      # end

      # context 'when search books by author' do
      # end

      # context 'when search books by simple text' do
      # end

      # context 'when search books and return order title ASC' do
      # end

      # context 'when search books and return order title DESC' do
      # end
    end
  end
end
