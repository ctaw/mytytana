class YearGrade < ActiveRecord::Base

 has_many :grades

 accepts_nested_attributes_for :grades, :reject_if => :all_blank, :allow_destroy => true

end