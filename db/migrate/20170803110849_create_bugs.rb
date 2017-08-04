class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :status
      t.integer :created_by
      t.integer :asigned_to
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
