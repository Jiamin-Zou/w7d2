class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.references :band, null: false, index: false, foreign_key: true
      t.boolean :live, default: false

      t.timestamps
    end

    add_index :albums, [:title, :band_id], unique: true
  end
end
