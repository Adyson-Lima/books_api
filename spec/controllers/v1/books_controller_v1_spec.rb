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

  describe 'GET /api/v1/books/id' do
    it 'Consegue listar um book especifico e retornar status 200?' do
      get :show, params: {id: @book.id}
      expect(response.body).to include_json(id: @book.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/books' do
    it 'Consegue criar um book e retornar status 201?' do
      post :create, params: {book: {title: "rails 7", description: "um bom livro de rails 7"},format: :json}
      expect(response.body).to include_json(title: "rails 7")
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/books/id' do
    it 'Consegue atualizar um book e retornar status 200?' do
      book = Book.last
      patch :update, params: {book: {title: "ruby 3", description: "livro de ruby 3"},id: book.id}

      expect(response.body).to include_json(title: "ruby 3")
      expect(response).to have_http_status(200)
    end
  end

end