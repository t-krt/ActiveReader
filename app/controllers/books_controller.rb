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
    url = result['itemUrl']
    isbn = result['isbn']
    image_url = result['mediumImageUrl']

    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      remote_image_url: image_url,
    }
  end
end