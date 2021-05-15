class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :new]


  # GET /dresses
  # GET /dresses.json
  def index
    @dresses = Dress.all
  end

  # GET /dresses/1
  # GET /dresses/1.json
  def show
  end

  # GET /dresses/new
  def new
    @dress = Dress.new
  end

  # GET /dresses/1/edit
  def edit
  end

  # POST /dresses
  # POST /dresses.json
  def create
    @dress = Dress.new(dress_params)

    respond_to do |format|
      if @dress.save
        format.html { redirect_to @dress, notice: 'Wedding Dress was successfully created.' }
        format.json { render :show, status: :created, location: @dress }
      else
        set_categories
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dresses/1
  # PATCH/PUT /dresses/1.json
  def update
    respond_to do |format|
      if @dress.update(dress_params)
        format.html { redirect_to @dress, notice: 'Wedding Dress was successfully updated.' }
        format.json { render :show, status: :ok, location: @dress }
      else
        set_categories
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dresses/1
  # DELETE /dresses/1.json
  def destroy
    @dress.destroy
    respond_to do |format|
      format.html { redirect_to dresses_url, notice: 'Wedding Dress was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dress
      @dress = Dress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dress_params
      params.require(:dress).permit(:name, :color, :size, :description, :price, :category_id)
    end

    def set_categories
      @categories = Category.all
    end 
end
