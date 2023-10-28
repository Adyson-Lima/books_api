require 'rails_helper'

RSpec.describe Book, type: :model do

  before { @book = Book.new }

  describe 'Teste de preenchimento dos campos do model Book' do

    it 'title consegue ser preenchido?' do
      @book.title = "Ruby 3"
      expect(@book.title).to eq("Ruby 3")
    end

    it 'description consegue ser preenchido?' do
      @book.description = "Um bom livro de ruby"
      expect(@book.description).to eq("Um bom livro de ruby")
    end

  end
      
end
