class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]


  # GET /comment_ujs
  def comment_ujs
    puts "\n******** comment_ujs ********"
    respond_to do |format|
        format.js {render :comment_ujs }
    end
  end

  # GET /jobs
  # GET /jobs.json
  def index
    puts "\n******** job_index ********"
    @jobs = Job.all
    @user = User.find(current_user.id)
    puts "******** @jobs, #{@jobs} ********"
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    puts "\n******** job_show ********"
    puts "*** params.inspect: #{params.inspect} ***"
    @user = User.find(current_user.id)
    @comment = Comment.new
    @comments = @job.comments

    puts "***== @user.inspect, #{@user.inspect} ==***"
  end

  # GET /jobs/new
  def new
    puts "\n******** job_new ********"
    @user = User.find(current_user.id)
    @ports = Port.all
    @boats = Boat.all
    @job = Job.new
    puts "*** @user.inspect: #{@user.inspect} ***"
    puts "*** @port.inspect: #{@port.inspect} ***"
    puts "*** @boats.inspect: #{@boats.inspect} ***"
  end

  # GET /jobs/1/edit
  def edit
    puts "\n******** job_edit ********"
  end

  # POST /jobs
  # POST /jobs.json
    def create
      puts "\n******** job_create ********"
      puts "*** @boat.inspect: #{@boat.inspect} ***"
      @job = Job.new(job_params)
      if @job.save
        @job.boats << Boat.find(params[:boat_id])
        redirect_to user_jobs_path(current_user.id)
      else
        @user = User.find(current_user.id)
        @ports = Port.all
        @boats = Boat.all
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    puts "\n******** job_update ********"
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to user_jobs_path(current_user.id), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    puts "\n******** job_delete ********"
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      puts "\n******** job_params ********"
    #   binding.pry
      params.require(:job).permit(:name, :user_id, :boat_id, :port_origin_id, :port_destination_id, :description,  :amount_of_containers, :cost)
    end
end
