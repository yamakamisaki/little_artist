class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :age,       null: false
      t.text    :text,      null: false
      t.text    :material
      t.text    :making
      t.references :user,   null: false,foreign_key: true
      t.timestamps
    end
  end
end
