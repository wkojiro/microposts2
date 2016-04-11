class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true
      t.references :followed, index: true
      t.index [:follower_id, :followed_id], unique: true
      t.timestamps null: false
    end
  end
end
