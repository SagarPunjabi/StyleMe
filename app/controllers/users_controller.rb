class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  protect_from_forgery except: :generate_again
  require 'Weather'
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find params[:id]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        reset_session #-- 8:56
        log_in @user #-- 8:56
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_again
    @new_clothe = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                              clothing_category: params[:category], occasion: params[:occ], clean: true).sample
    if params[:quad] == 'Top' && (params[:category] == 'Winter-Coat' || params[:category] == 'Fall/Spring-Jacket')
      @random_top2 = @new_clothe
    elsif params[:quad] == 'Top'
      @random_top = @new_clothe
    elsif params[:quad] == 'Bottom'
      @random_bottom = @new_clothe
    elsif params[:quad] == 'Socks'
      @random_socks = @new_clothe
    elsif params[:quad] == 'Shoes'
      @random_shoes = @new_clothe
    elsif params[:quad] == 'Accessory'
      @random_accessory = @new_clothe
    end
    respond_to do |format|
      format.js {}
    end
  end

  def generate
    ip_address = if Rails.env.production?
                   request.remote_ip
                 else
                   Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
                 end
    @occasion = params[:occasion]
    @occasion = 'Casual' if @occasion.nil?
    @user_id = params[:user_id]
    @clothes = Clothe.all
    clothing = Weather.new(ip_address, @user_id, @occasion)
    @output = clothing.get_output
    @random_top = clothing.get_top
    @random_top2 = clothing.get_top2
    @random_bottom = clothing.get_bottom
    @random_socks = clothing.get_socks
    @random_shoes = clothing.get_shoes
    @random_accessory = clothing.get_accessory

    @ootd = { top: @random_top, jacket: @random_top2, bottom: @random_bottom, socks: @random_socks,
              shoes: @random_shoes }
  end

  def ootd
    @top = params[:top]
    @jacket = params[:top2]
    @bottom = params[:bottom]
    @socks = params[:socks]
    @shoes = params[:shoes]

    unless @top.nil?
      @top = Clothe.where(id: @top)
      @top.update(clean: false)
    end

    unless @top2.nil?
      @top2 = Clothe.where(id: @top2)
      @top2.update(clean: false)
    end

    unless @bottom.nil?
      @bottom = Clothe.where(id: @bottom)
      @bottom.update(clean: false)
    end

    unless @socks.nil?
      @socks = Clothe.where(id: @socks)
      @socks.update(clean: false)
    end

    unless @shoes.nil?
      @shoes = Clothe.where(id: @shoes)
      @shoes.update(clean: false)
    end
  end

  def laundry
    @user = User.find(params[:user_id])
    @user_clothes = Clothe.where(user_id: @user.id, clean: false)
  end

  def wash
    @user = User.find(session[:user_id])
    @used_clothes = Clothe.where(user_id: @user.id, clean: false)

    @used_clothes.each do |clothing|
      clothing.update(clean: true)
    end

    redirect_to @user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :quadrant)
  end
end
