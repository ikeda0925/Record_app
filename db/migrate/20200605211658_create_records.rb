class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :character_1_id
      t.integer :character_2_id
      t.integer :win_user_id
      t.integer :lose_user_id

      t.timestamps
    end
  end
end
