class CreateVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :versions do |t|
      t.references :project, null: false, foreign_key: true
      t.string :stakes, array:true, default:[]
      t.string :media
      t.string :countries, array:true, default:[]
      t.json :questions, default:{}
      t.json :answers, default:{}
      t.string :imagery
      t.string :short_description
      t.string :description
      t.string :language

      t.timestamps
    end
  end
end
