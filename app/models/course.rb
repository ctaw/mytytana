class Course < ActiveRecord::Base

  has_and_belongs_to_many :students
  has_many :sections, :dependent => :destroy

  accepts_nested_attributes_for :sections, :reject_if => :all_blank, :allow_destroy => true

end
