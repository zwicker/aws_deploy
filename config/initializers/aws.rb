require 'aws-sdk-v1'

AWS.config(
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  :region => 'ap-southeast-2'
)

ec2 = AWS::EC2.new()
