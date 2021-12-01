class AddDataRetentionPeriodToRequesters < ActiveRecord::Migration[6.1]
  def change
    add_column :requesters, :data_retention_period, :string
  end
end
