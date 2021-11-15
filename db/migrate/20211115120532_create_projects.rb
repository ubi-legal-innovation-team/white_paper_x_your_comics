class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :company
      t.string :actor

      t.timestamps
    end
  end
end
