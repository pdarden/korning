class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
    import_data
  end

  def down
    drop_table :products
  end

  def import_data
    Sale.pluck(:product_name).each do |c|
      Product.find_or_create_by(name: c) do |product|
        product.name = c
      end
    end
  end
end
