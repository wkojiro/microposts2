class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :retweetuser, index: true
      t.references :retweetpost, index: true
      t.index [:retweetuser_id, :retweetpost_id], unique: true
      t.timestamps null: false
    end
  end
end
