class Task < ApplicationRecord
  belongs_to :review
  validates :content, presence: true

  def update_finished_true
    self.finished = true if self.finished == false
    self.save
  end
end
