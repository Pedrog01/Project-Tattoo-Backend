class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.integer :price
      t.text :description
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
