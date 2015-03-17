class SectionSchedule < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :section
end