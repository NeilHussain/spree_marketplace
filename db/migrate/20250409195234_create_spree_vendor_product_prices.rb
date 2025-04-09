class CreateSpreeVendorProductPrices < ActiveRecord::Migration[7.2]
  def change
    create_table :spree_vendor_product_prices do |t|
      t.references :vendor_product, null: false, foreign_key: { to_table: :spree_vendor_products }, type: :bigint
      t.string :country_iso, null: false
      t.string :currency, default: 'USD'
      t.decimal :price, precision: 10, scale: 2, null: false
      t.timestamps
    end

    add_index :spree_vendor_product_prices, [:vendor_product_id, :country_iso], unique: true
  end
end