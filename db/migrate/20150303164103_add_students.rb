class AddStudents < ActiveRecord::Migration
  def change

    create_table :students do |t|
      t.string :student_number # username
      t.string :access_code # password
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :extension_name
      t.integer :course_id
      t.string :curriculum_year
      t.string :enrollment_status
      t.integer :gender
      t.datetime :birthday
      t.string :birthplace
      t.string :civil_status
      t.string :nationality
      t.string :religion
      t.text :address
      t.string :city
      t.string :contact_number
      t.string :email
      t.string :guardian_name
      t.string :guardian_address
      t.string :guardian_contact_number
      t.string :gs_name
      t.text :gs_location
      t.string :gs_year
      t.string :hs_name
      t.text :hs_location
      t.string :hs_year
      t.timestamps
    end

    create_table :courses do |t|
      t.string :course_code
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :sections do |t|
      t.string :course_code
      t.string :name 
      t.timestamps
    end

    create_table :schedules do |t|
      t.integer :day
      t.string :time
      t.integer :subject_id
      t.integer :section_id
      t.string :room
    end

    create_table :directories do |t|
      t.string :office
      t.string :local_numbers
    end

    create_table :events do |t|
      t.string :month
      t.string :day
      t.text :caption
    end

  end
end
