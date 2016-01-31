class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.integer :gender, null: false, default: 0, limit: 2

      t.timestamps null: false
    end
  end
end
