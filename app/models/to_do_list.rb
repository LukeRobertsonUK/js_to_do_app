class ToDoList < ActiveRecord::Base
  attr_accessible :name, :to_do_item_ids
  has_many :to_do_items, order: :position
  before_destroy :delete_to_do_items



  def delete_to_do_items
    ToDoItem.where(to_do_list_id: self.id).each do |item|
      item.destroy
    end
  end




end
