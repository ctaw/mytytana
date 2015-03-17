class Section < ActiveRecord::Base
  belongs_to :course

  has_many :section_schedules, :dependent => :destroy

  accepts_nested_attributes_for :section_schedules, :reject_if => :all_blank, :allow_destroy => true

end