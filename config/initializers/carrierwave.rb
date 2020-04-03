CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/aws' 
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAIBE7AR7LCRRTWWNQ',
      :aws_secret_access_key => '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',
      :region => 'sa-east-1'
    }
    config.fog_directory = 'lababertobsb'
    config.fog_attributes = {'Cache-Control' => 'max-age=3153600', 'Expires' => 'max'}
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end