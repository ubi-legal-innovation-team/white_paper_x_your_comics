class AddAttributesToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :licence, :string
    add_column :projects, :website, :string
    add_column :projects, :copyright, :string
    add_column :projects, :credits, :string
  end
end
