class CreateUserAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :user_agents do |t|
      t.string :host_name
      t.string :operating_system
      t.string :privates_socket_ip, array:true, default:[]
      t.string :publics_socket_ip, array:true, default:[]
      t.string :publics_ip, array:true, default:[]
      t.string :countries, array:true, default:[]
      t.string :regions, array:true, default:[]
      t.string :cities, array:true, default:[]
      t.string :zips, array:true, default:[]
      t.string :isps, array:true, default:[]
      t.string :orgs, array:true, default:[]
      t.boolean :mobile, array:true, default:[]

      t.timestamps
    end
  end
end
