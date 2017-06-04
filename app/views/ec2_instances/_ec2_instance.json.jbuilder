json.extract! ec2_instance, :id, :name, :aws_id, :instance_type, :instance_ami, :region, :created_at, :updated_at
json.url ec2_instance_url(ec2_instance, format: :json)
