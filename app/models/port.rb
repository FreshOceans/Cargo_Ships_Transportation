class Port < ApplicationRecord
    has_many :boats

    has_many :jobs_as_port_origin, :class_name => 'Job', :foreign_key => 'port_origin_id'
    has_many :jobs_as_port_destination, :class_name => 'Job', :foreign_key => 'port_destination_id'
end
