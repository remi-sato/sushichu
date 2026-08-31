class AddStatusToOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items,
               :status,
               :integer,
               default: 0,
               null: false
  end
end
