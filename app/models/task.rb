class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  validates :title, :start_time,  :status, presence: true
  validates :category_id, presence: { message: 'を選択してください。' }
  paginates_per 18
end
