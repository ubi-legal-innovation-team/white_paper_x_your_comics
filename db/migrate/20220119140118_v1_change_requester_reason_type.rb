class V1ChangeRequesterReasonType < ActiveRecord::Migration[6.1]
  def change
    change_column :requesters, :reason, :string, array:true, default:[], using: "(string_to_array(reason, ','))"
  end
end
