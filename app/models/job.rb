class Job < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  belongs_to :port_origin, :class_name => 'Port'
  belongs_to :port_destination, :class_name => 'Port'

  has_many :boat_jobs
  has_many :boats, through: :boat_jobs, dependent: :destroy
end
