# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
# User.create(:email=> "admin@mytytana.com", :password=>"password")


Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "EN 1", :prelim => "82", :midterm => "87", :final=>"79", :sem_grade=>"82", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "IT 101", :prelim => "82", :midterm => "82", :final=>"82", :sem_grade=>"82", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "IT 102", :prelim => "88", :midterm => "85", :final=>"83", :sem_grade=>"85", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "MATH 1", :prelim => "72", :midterm => "70", :final=>"82", :sem_grade=>"75", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "NATSCI 1", :prelim => "85", :midterm => "85", :final=>"81", :sem_grade=>"83", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "NSTP 1", :prelim => "79", :midterm => "84", :final=>"86", :sem_grade=>"83", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "P.E. 1", :prelim => "83", :midterm => "95", :final=>"99", :sem_grade=>"91", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)
Grade.create(:student_number => "2011100020", :year => 2011, :sem => 1, :subject_code => "SOCSCI 1", :prelim => "87", :midterm => "66", :final=>"87", :sem_grade=>"81", :course_code=>"BSIT", :description=>"BS IT Reading and Thinking Skills", :unit_lab =>3, :unit_lec=>0)

# Schedule.create(:student_number=>"2011100121", :day=>4, :time=>"7:00am - 8:30am", :subject_code =>"IT 206", :section=>"", :room=>"304", :course_code=>"BSIT")