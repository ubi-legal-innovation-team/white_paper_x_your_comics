class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :position
      t.integer :region, array:true, default:[]

      t.timestamps
    end
  end
end
