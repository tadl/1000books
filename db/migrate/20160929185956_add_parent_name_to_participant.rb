class AddParentNameToParticipant < ActiveRecord::Migration
  def change
  	add_column :kids, :parent_name, :string
  end
end
