class AddFieldToToDoItems < ActiveRecord::Migration
  def change
    add_column :to_do_items, :details, :text
  end
end
