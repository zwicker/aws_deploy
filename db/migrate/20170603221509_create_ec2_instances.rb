class CreateEc2Instances < ActiveRecord::Migration[5.0]
  def change
    create_table :ec2_instances do |t|
      t.string :name
      t.string :aws_id
      t.string :instance_type
      t.string :instance_ami
      t.string :region

      t.timestamps
    end
  end
end
