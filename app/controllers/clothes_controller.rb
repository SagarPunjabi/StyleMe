require './app/services/imagetag.rb'
require './app/services/clothingcolor.rb'
class ClothesController < ApplicationController
  before_action :set_clothe, only: %i[show edit update destroy]

  # GET /clothes or /clothes.json
  def index
    @clothes = Clothe.all
  end

  # GET /clothes/1 or /clothes/1.json
  def show; end

  # GET /clothes/new
  def new
    @clothe = Clothe.new(user_id: params[:user_id])
  end

  # GET /clothes/1/edit
  def edit; end

  # POST /clothes or /clothes.json
  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.clean = true
    respond_to do |format|
      if @clothe.save
        image_url = @clothe.photo.url
        image_url = image_url[0,image_url.index('?response')]

        tags_api = ImageTag.new(image_url)
        quad, category, oc = tags_api.get_tags() 
        @clothe.update(quadrant:quad) 
        @clothe.update(clothing_category: category)
        @clothe.update(occasion:oc)

        color_api = ClothingColor.new(image_url)
        color = color_api.get_clothing_color()
        @clothe.update(color: color)

        format.html { redirect_to edit_clothe_path(@clothe), notice: 'Clothe was successfully created.' }
        format.json { render :show, status: :created, location: @clothe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clothe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothes/1 or /clothes/1.json
  def update
    respond_to do |format|
      if @clothe.update(clothe_params)
        format.html { redirect_to user_path(@clothe.user_id), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @clothe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clothe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothes/1 or /clothes/1.json
  def destroy
    user_id = @clothe.user_id
    @clothe.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user_id), notice: 'Clothe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clothe
    @clothe = Clothe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def clothe_params
    params.require(:clothe).permit(:user_id, :quadrant, :clothing_category, :color, :occasion, :photo)
  end
end
