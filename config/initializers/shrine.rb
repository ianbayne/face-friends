require 'shrine'

s3_options = {
  region:            ENV['aws_region'],
  bucket:            ENV['aws_bucket'],
  access_key_id:     ENV['aws_access_key_id'],
  secret_access_key: ENV['aws_secret_access_key']
}

if Rails.env.development?
  require 'shrine/storage/file_system'

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'store')
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require 'shrine/storage/s3'

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
