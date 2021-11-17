class CreateStakes < ActiveRecord::Migration[6.1]
  def change
    create_table :stakes do |t|
      t.string :name

      t.timestamps
    end
  end
end
