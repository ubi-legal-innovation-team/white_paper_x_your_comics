class AddRemoteIpToUserAgent < ActiveRecord::Migration[6.1]
  def change
    add_column :user_agents, :remotes_ip, :string, array:true, default:[]
  end
end
