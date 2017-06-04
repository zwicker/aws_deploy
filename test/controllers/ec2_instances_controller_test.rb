require 'test_helper'

class Ec2InstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ec2_instance = ec2_instances(:one)
  end

  test "should get index" do
    get ec2_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_ec2_instance_url
    assert_response :success
  end

  test "should create ec2_instance" do
    assert_difference('Ec2Instance.count') do
      post ec2_instances_url, params: { ec2_instance: { aws_id: @ec2_instance.aws_id, instance_ami: @ec2_instance.instance_ami, instance_type: @ec2_instance.instance_type, name: @ec2_instance.name, region: @ec2_instance.region } }
    end

    assert_redirected_to ec2_instance_url(Ec2Instance.last)
  end

  test "should show ec2_instance" do
    get ec2_instance_url(@ec2_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_ec2_instance_url(@ec2_instance)
    assert_response :success
  end

  test "should update ec2_instance" do
    patch ec2_instance_url(@ec2_instance), params: { ec2_instance: { aws_id: @ec2_instance.aws_id, instance_ami: @ec2_instance.instance_ami, instance_type: @ec2_instance.instance_type, name: @ec2_instance.name, region: @ec2_instance.region } }
    assert_redirected_to ec2_instance_url(@ec2_instance)
  end

  test "should destroy ec2_instance" do
    assert_difference('Ec2Instance.count', -1) do
      delete ec2_instance_url(@ec2_instance)
    end

    assert_redirected_to ec2_instances_url
  end
end
