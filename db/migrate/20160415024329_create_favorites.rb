class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favuser, index: true
      t.references :favpost, index: true
      t.index [:favuser_id, :favpost_id], unique: true
      t.timestamps null: false
    end
  end
end
