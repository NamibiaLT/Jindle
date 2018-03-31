require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it 'handles a missing book properly' do
    get :show, id: 'not-here'

    expect(response).to redirect_to(book_path)

    notice = 'The book you were trying to find can not be found.'
    expect(flash[:alert]).to eq notice
  end
end
