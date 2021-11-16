class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :company
      t.string :actor
      t.string :contact
      t.string :stakes, array:true, default:[]
      t.string :countries, array:true, default:[]
      t.string :media
      t.string :imagery

      t.timestamps
    end
  end
end
