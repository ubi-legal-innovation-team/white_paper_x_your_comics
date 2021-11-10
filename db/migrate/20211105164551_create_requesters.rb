class CreateRequesters < ActiveRecord::Migration[6.1]
  def change
    create_table :requesters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :job_title
      t.string :reason
      t.string :message
      t.boolean :get_in_touch, default:false

      t.timestamps
    end
  end
end
