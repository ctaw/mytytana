class Subject < ActiveRecord::Migration
  def change

    create_table :subjects do |t|
      t.string :subject_code
      t.string :name
      t.text :description
      t.timestamps
    end

  end
end
