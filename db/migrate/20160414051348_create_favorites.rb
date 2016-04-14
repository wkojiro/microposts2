class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favuser, index: true, foreign_key: true
      t.references :favpost, index: true, foreign_key: true
      t.index [:favuser_id, :favpost_id]
      t.timestamps null: false
    end
  end
end
