class Boat < ApplicationRecord
  belongs_to :user
  belongs_to :port
  has_many :boat_jobs
  has_many :jobs, through: :boat_jobs, dependent: :destroy
end
