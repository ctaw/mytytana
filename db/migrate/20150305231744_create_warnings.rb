class CreateWarnings < ActiveRecord::Migration
  def change
    create_table :warnings do |t|
      t.integer :category
      t.string :title
      t.text :caption
    end
  end
end
