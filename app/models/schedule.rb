class Schedule < ActiveRecord::Base

  belongs_to :subject

  has_many :section_schedules, :dependent => :destroy

  accepts_nested_attributes_for :section_schedules, :reject_if => :all_blank, :allow_destroy => true

  def get_day
    case day
    when 0
      "Monday"
    when 1
      "Tuesday"
    when 2
      "Wednesday"
    when 3
      "Thursday"
    when 4
      "Friday"
    when 5
      "Saturday"
    end
  end

end