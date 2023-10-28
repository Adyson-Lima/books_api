require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  before { @book = Book.create(title: "Ruby 3", description: "melhor livro de ruby 3") }

  describe 'GET /api/v1/books' do
    it 'Consegue listar todos os books e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)    
      expect(response).to have_http_status(200) 
    end
  end

end