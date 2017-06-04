class AddQtyToEc2Instances < ActiveRecord::Migration[5.0]
  def change
    add_column :ec2_instances, :qty, :integer
  end
end
