require 'shrine'
require 'shrine/storage/s3'

s3_options = {
  region:            'xxx', #ENV['aws_region'],
  bucket:            'xxx', #ENV['aws_bucket'],
  access_key_id:     'xxx', #ENV['aws_access_key_id'],
  secret_access_key: 'xxx' #ENV['aws_secret_access_key']
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays