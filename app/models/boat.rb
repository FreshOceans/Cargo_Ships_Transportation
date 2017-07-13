class Boat < ApplicationRecord
  belongs_to :user
  belongs_to :port
  has_many :boat_jobs
  has_many :jobs, through: :boat_jobs, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: { message: 'Please enter a valid Name' }

end
