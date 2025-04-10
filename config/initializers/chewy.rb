# Configure Chewy settings
Chewy.settings = {
  host: ENV['ELASTICSEARCH_URL'] || 'localhost:9200',
  prefix: "#{Rails.env}_spree",
  wait_for_status: 'yellow',
  index: {
    number_of_shards: 1,
    number_of_replicas: 0
  }
}

# Log Elasticsearch queries in development
if Rails.env.development?
  Chewy.logger = ActiveSupport::Logger.new(STDOUT)
  Chewy.request_strategy = :urgent
end
