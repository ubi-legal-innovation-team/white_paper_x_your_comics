class CreatePrintablePdfs < ActiveRecord::Migration[6.1]
  def change
    create_table :printable_pdfs do |t|
      t.integer :project_id
      t.integer :user_agent_id

      t.timestamps
    end
  end
end
