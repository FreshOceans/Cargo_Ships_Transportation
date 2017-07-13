class Boat < ApplicationRecord
  belongs_to :user
  belongs_to :port
  has_many :boat_jobs
  has_many :jobs, through: :boat_jobs, dependent: :destroy

  validates :name, :uniqueness => true, :presence => { :message => "This boat name has been taken." }
  validates :amount_of_containers, numericality: true, :presence => { :message => "Please enter a valid number." }
end
