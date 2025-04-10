class ProductsIndex < Chewy::Index
  define_type Spree::Product.includes(:taxons) do
    field :id, type: 'integer'
    field :name, type: 'text', analyzer: 'english'
    field :description, type: 'text', analyzer: 'english'
    field :sku, type: 'keyword'
    field :price, type: 'float'
    field :available_on, type: 'date'
    field :slug, type: 'keyword'
    field :taxon_ids, type: 'keyword', value: -> { taxons.pluck(:id) }
    field :taxon_names, type: 'text', value: -> { taxons.pluck(:name) }
  end
end
