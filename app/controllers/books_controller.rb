class BooksController < ApplicationController
  def search
    @books = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

  private
  def read(result)
    title = result['title']
    author = result['author']
    image_url = result['largeImageUrl']
    url = result['itemUrl']
    isbn = result['isbn']

    {
      title: title,
      author: author,
      image_url: image_url,
      url: url,
      isbn: isbn,
    }
  end
end