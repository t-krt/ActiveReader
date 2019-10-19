class Task < ApplicationRecord
  belongs_to :review
  validates :content, presence: true

  scope :finished, -> { where(finished: true) }
  scope :unfinished, -> { where(finished: false) }
  scope :desc, -> { order(updated_at: "DESC") }

  def update_finished_true
    self.finished = true if finished == false
    save
  end
end
