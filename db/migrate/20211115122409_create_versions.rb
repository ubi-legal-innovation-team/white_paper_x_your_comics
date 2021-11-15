class CreateVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :versions do |t|
      t.references :project, null: false, foreign_key: true
      t.string :stakes, array:true, default:[]
      t.string :media
      t.string :country
      t.string :questions, array:true, default:[]
      t.string :answers, array:true, default:[]
      t.string :imagery
      t.string :short_description
      t.string :language

      t.timestamps
    end
  end
end
