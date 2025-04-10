namespace :elasticsearch do
  desc 'Create and update Elasticsearch indices'
  task :setup => :environment do
    puts 'Creating ProductsIndex...'
    ProductsIndex.create!
    puts 'Importing products...'
    ProductsIndex.import
    puts 'Done!'
  end

  desc 'Check Elasticsearch status'
  task :status => :environment do
    puts "Products index exists: #{ProductsIndex.exists?}"
    puts "Products count: #{ProductsIndex.count}"
  end
end
