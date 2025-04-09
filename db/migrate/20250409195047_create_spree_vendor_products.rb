class CreateSpreeVendorProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :spree_vendor_products do |t|
      t.references :vendor, null: false, foreign_key: { to_table: :spree_vendors }, type: :integer
      t.references :product, null: false, foreign_key: { to_table: :spree_products }, type: :bigint
      t.boolean :enabled, default: true
      t.timestamps
    end

    add_index :spree_vendor_products, [:vendor_id, :product_id], unique: true
  end
end