class ToDoItem < ActiveRecord::Base
  belongs_to :to_do_list
  attr_accessible :name, :position, :to_do_list_id, :details
  acts_as_list scope: :to_do_list
end
