class AddAwskeyAwssecretkeyToEc2Instances < ActiveRecord::Migration[5.0]
  def change
    add_column :ec2_instances, :awskey, :string
    add_column :ec2_instances, :awssecretkey, :string
  end
end
