class AddConsentToRequesters < ActiveRecord::Migration[6.1]
  def change
    add_column :requesters, :consent, :boolean, default:false
  end
end
