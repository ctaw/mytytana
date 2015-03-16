class Subject < ActiveRecord::Base
  

  has_many :schedules

  accepts_nested_attributes_for :schedules, :reject_if => :all_blank, :allow_destroy => true
end
