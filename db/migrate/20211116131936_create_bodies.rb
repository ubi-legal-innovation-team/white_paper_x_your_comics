class CreateBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :bodies do |t|
      t.references :project, null: false, foreign_key: true
      t.string :version
      t.string :short_description
      t.string :long_description
      t.string :question_one
      t.string :question_two
      t.string :question_three
      t.string :question_four
      t.string :question_five
      t.string :question_six
      t.string :question_seven

      t.timestamps
    end
  end
end
