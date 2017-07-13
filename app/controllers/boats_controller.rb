class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  # GET /boats.json
  def index
    puts "\n******** boats_index ********"
    @boats = Boat.all
    puts "******** @boats, #{@boats} ********"
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    puts "\n******** boats_show ********"
    puts "*** params.inspect: #{params.inspect} ***"
    @user = User.find(current_user.id)
    puts "***== @user.inspect, #{@user.inspect} ==***"
  end

  # GET /boats/new
  def new
    puts "\n******** boats_new ********"
    @boat = Boat.new
    @user = User.find(current_user.id)
    puts "*** @user.inspect: #{@user.inspect} ***"
  end

  # GET /boats/1/edit
  def edit
    puts "\n******** edit_boat ********"
    @user = User.find(params[:user_id])
    puts "*** @user.inspect: #{@user.inspect} ***"
  end

  # POST /boats
  # POST /boats.json
  def create
    puts "\n******** boats_create ********"
    @boat = Boat.new(boat_params)
    puts "*** params.inspect: #{params.inspect} ***"

    respond_to do |format|
      if @boat.save
        format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
        format.json { render :show, status: :created, location: @boat }
      else
          format.html { redirect_to @boat, notice: 'Boat update failed.'  }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    puts "\n******** boats_update ********"
    respond_to do |format|
      if @boat.update(boat_params)
          format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    puts "\n******** boats_delete ********"
    @boat.destroy
    flash[:notice] = 'Boat was successfully removed.'
    redirect_to '/feed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
        puts "\n******** boat_params ********"
        params.require(:boat).permit(:user_id, :port_id, :name, :amount_of_containers)
    end
end
