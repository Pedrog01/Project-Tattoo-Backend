class CreateProfileusers < ActiveRecord::Migration[7.0]
  def change
    create_table :profileusers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone
      t.date :birthdate
      t.string :avatar
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
