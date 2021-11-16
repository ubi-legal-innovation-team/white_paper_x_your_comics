class CreateBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :bodies do |t|
      t.references :project, null: false, foreign_key: true
      t.string :version
      t.string :short_description
      t.string :content

      t.timestamps
    end
  end
end
