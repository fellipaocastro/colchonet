class Room < ActiveRecord::Base
  def complete_name
    "#{title}, #{location}"
  end

  validates :title, :location, :presence => true
  validates_length_of :description, :minimum => 30, :allow_blank => false
end
