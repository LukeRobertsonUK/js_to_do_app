class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.string :name
      t.references :to_do_list
      t.integer :position

      t.timestamps
    end
    add_index :to_do_items, :to_do_list_id
  end
end
