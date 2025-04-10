module Spree
  Product.class_eval do

    def self.search(query)
      ProductsIndex.query(
        multi_match: {
          query: query,
          fields: ['name^5', 'description', 'taxon_names'],
          fuzziness: 'AUTO'
        }
      )
    end
  end
end
