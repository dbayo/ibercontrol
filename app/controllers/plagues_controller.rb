class PlaguesController < ApplicationController
  before_action :set_plague, only: [:show, :edit, :update, :destroy]

  # GET /plagues
  # GET /plagues.json
  def index
    @plagues = Plague.all
  end

  # GET /plagues/1
  # GET /plagues/1.json
  def show
  end

  # GET /plagues/new
  def new
    @plague = Plague.new
  end

  # GET /plagues/1/edit
  def edit
  end

  # POST /plagues
  # POST /plagues.json
  def create
    @plague = Plague.new(plague_params)

    respond_to do |format|
      if @plague.save
        format.html { redirect_to @plague, notice: 'Plague was successfully created.' }
        format.json { render :show, status: :created, location: @plague }
      else
        format.html { render :new }
        format.json { render json: @plague.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plagues/1
  # PATCH/PUT /plagues/1.json
  def update
    respond_to do |format|
      if @plague.update(plague_params)
        format.html { redirect_to @plague, notice: 'Plague was successfully updated.' }
        format.json { render :show, status: :ok, location: @plague }
      else
        format.html { render :edit }
        format.json { render json: @plague.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plagues/1
  # DELETE /plagues/1.json
  def destroy
    @plague.destroy
    respond_to do |format|
      format.html { redirect_to plagues_url, notice: 'Plague was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plague
      @plague = Plague.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plague_params
      params.require(:plague).permit(:name, :plagues)
    end
end
