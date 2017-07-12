class User < ApplicationRecord
    has_many :boats
    has_many :comments
    has_many :jobs
end
