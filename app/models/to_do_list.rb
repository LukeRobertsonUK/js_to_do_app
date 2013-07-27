class ToDoList < ActiveRecord::Base
  attr_accessible :name, :to_do_item_ids
  has_many :to_do_items, order: :position
end
