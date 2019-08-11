class ReviewForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # TODO: → books+Category_books+reviews+Tasks

  # attr_accessor :title, :author, :image, :book_id, :category_id, :user_id, :purpose, :learned,:note, :rate, :review_status, :deadline, :task_content, :finished. :review_id

  # validates :purpose, presence: true
  # validates :review_status, presence: true, default: 0
  # validates :title, presence: true
  # validates :task_content, presence true

  # def save
  #   return false if invalid?
  # end
end
