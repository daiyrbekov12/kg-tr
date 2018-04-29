class VnasController < ApplicationController
  before_action :set_vna, only: [:show, :edit, :update, :destroy]

  # GET /vnas
  # GET /vnas.json
  def index
    @vnas = Vna.all
  end

  # GET /vnas/1
  # GET /vnas/1.json
  def show
  end

  # GET /vnas/new
  def new
    @vna = Vna.new
  end

  # GET /vnas/1/edit
  def edit
  end

  # POST /vnas
  # POST /vnas.json
  def create
    @vna = Vna.new(vna_params)

    respond_to do |format|
      if @vna.save
        format.html { redirect_to @vna, notice: 'Vna was successfully created.' }
        format.json { render :show, status: :created, location: @vna }
      else
        format.html { render :new }
        format.json { render json: @vna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vnas/1
  # PATCH/PUT /vnas/1.json
  def update
    respond_to do |format|
      if @vna.update(vna_params)
        format.html { redirect_to @vna, notice: 'Vna was successfully updated.' }
        format.json { render :show, status: :ok, location: @vna }
      else
        format.html { render :edit }
        format.json { render json: @vna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vnas/1
  # DELETE /vnas/1.json
  def destroy
    @vna.destroy
    respond_to do |format|
      format.html { redirect_to vnas_url, notice: 'Vna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vna
      @vna = Vna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vna_params
      params.require(:vna).permit(:name)
    end
end
