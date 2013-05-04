class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :content
      t.string :munged_content
      t.references :project

      t.timestamps
    end
    add_index :keywords, :project_id
  end
end
