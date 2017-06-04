class Ec2InstancesController < ApplicationController
  before_action :set_ec2_instance, only: [:show, :edit, :update, :destroy]

  # GET /ec2_instances
  # GET /ec2_instances.json
  def index
    @ec2_instances = Ec2Instance.all
  end

  # GET /ec2_instances/1
  # GET /ec2_instances/1.json
  def show
  end

  # GET /ec2_instances/new
  def new
    @ec2_instance = Ec2Instance.new
  end

  # GET /ec2_instances/1/edit
  def edit
  end

  # POST /ec2_instances
  # POST /ec2_instances.json
  def create

    @ec2 = AWS::EC2.new()

    # Get attributes in order to update
    @attributes = ec2_instance_params.clone
    @qty = @attributes[:aws_id].to_i

    @qty.times do
      # Create an EC2 instance from the criteria on the form
      @machine = @ec2.instances.create(:image_id => "ami-162c2575", :instance_type => "t2.micro")
      # set name tag on instances
      @machine.tag('Name', :value => @attributes[:name])

      # Set attributes in the controller from the responses
      @attributes[:aws_id] = @machine.id
      @attributes[:instance_type] = @machine.instance_type
      @attributes[:instance_ami] = @machine.image_id
      @attributes[:region] = 'ap-southeast-2'

      @ec2_instance = Ec2Instance.new(@attributes)
      # @ec2_instance.update_attributes(@attributes)

      @ec2_instance.save
    end

    respond_to do |format|
      format.html { redirect_to ec2_instances_url, notice: 'Ec2 instance(s) successfully created.' }
      format.json { head :no_content }
    end

  end

  # PATCH/PUT /ec2_instances/1
  # PATCH/PUT /ec2_instances/1.json
  def update
    respond_to do |format|
      if @ec2_instance.update(ec2_instance_params)
        format.html { redirect_to @ec2_instance, notice: 'Ec2 instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @ec2_instance }
      else
        format.html { render :edit }
        format.json { render json: @ec2_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ec2_instances/1
  # DELETE /ec2_instances/1.json
  def destroy

    #initialize AWS
    @ec2 = AWS::EC2.new()

    # Get machine from AWS using aws_id
    @machine = @ec2.instances[@ec2_instance.aws_id]

    # Terminate machine from AWS
    @machine.terminate

    # Delete from database
    @ec2_instance.destroy
    respond_to do |format|
      format.html { redirect_to ec2_instances_url, notice: 'Ec2 instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ec2_instance
      @ec2_instance = Ec2Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ec2_instance_params
      params.require(:ec2_instance).permit(:name, :aws_id, :instance_type, :instance_ami, :region)
    end
end
