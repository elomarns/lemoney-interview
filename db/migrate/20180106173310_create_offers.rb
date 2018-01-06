class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :premium, default: false
      t.integer :status, default: 0 # When created an offer is disabled.

      t.timestamps
    end

    add_index :offers, :advertiser_name, unique: true
  end
end
