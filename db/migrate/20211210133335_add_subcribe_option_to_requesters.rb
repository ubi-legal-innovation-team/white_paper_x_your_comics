class AddSubcribeOptionToRequesters < ActiveRecord::Migration[6.1]
  def change
    add_column :requesters, :unsubscribe, :boolean, default:false
  end
end
