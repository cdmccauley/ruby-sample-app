if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :region => ENV['S3_REGION'],
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }

    # heroku log indicated port 443 being used
    # found the following configuration setting at https://stackoverflow.com/questions/35983943/rails-upload-files-to-amazon-s3-with-carrierwave-and-fog
    config.fog_use_ssl_for_aws = true

    config.fog_directory = ENV['S3_BUCKET']
  end
end