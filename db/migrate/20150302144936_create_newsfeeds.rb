class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.string :title
      t.string :department
      t.datetime :event_date
      t.text :description
      t.text :path_name
      t.attachment :photo
      t.timestamps
    end
  end
end
