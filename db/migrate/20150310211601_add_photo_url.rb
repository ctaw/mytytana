class AddPhotoUrl < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :path, :text
  end
end
