class CreateYearGrades < ActiveRecord::Migration
  def change
    create_table :year_grades do |t|
      t.string :course_code
      t.integer :section_id
      t.integer :year
      t.integer :sem
      t.timestamps
    end
  end
end
