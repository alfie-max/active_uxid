ActiveUxid::Settings.configure do |config|
  config.encoder_type = 'ulid'
  config.encoding_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  config.encoding_length = 26
  config.encoding_length = 1369136
end
