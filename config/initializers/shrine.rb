require "shrine"
require "shrine/storage/s3"

s3_options = {
    access_key_id:     ENV.fetch("S3_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("S3_SECRET_ACCESS_KEY"),
    region:            ENV.fetch("S3_REGION"),
    bucket:            ENV.fetch("S3_BUCKET"),
}

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"), # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :cached_attachment_data # for forms