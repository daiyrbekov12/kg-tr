class MakalsController < ApplicationController
  before_action :set_makal, only: [:show, :edit, :update, :destroy]

  # GET /makals
  # GET /makals.json
  def index
    # @makals = Makal.all
    keyword = params[:search]
    keyword = '*' if keyword==nil || keyword==''

    @makals = Makal.search keyword, fields: [:kg] , page: params[:page], per_page: 10
  end

  # GET /makals/1
  # GET /makals/1.json
  def show
  end

  # GET /makals/new
  def new
    @makal = Makal.new
  end

  # GET /makals/1/edit
  def edit
  end

  # POST /makals
  # POST /makals.json
  def create
    @makal = Makal.new(makal_params)

    respond_to do |format|
      if @makal.save
        format.html { redirect_to '/', notice: 'Makal was successfully created.' }
        format.json { render :show, status: :created, location: @makal }
      else
        format.html { render :new }
        format.json { render json: @makal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makals/1
  # PATCH/PUT /makals/1.json
  def update
    respond_to do |format|
      if @makal.update(makal_params)
        format.html { redirect_to '/', notice: 'Makal was successfully updated.' }
        format.json { render :show, status: :ok, location: @makal }
      else
        format.html { render :edit }
        format.json { render json: @makal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makals/1
  # DELETE /makals/1.json
  def destroy
    @makal.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Makal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_makal
      @makal = Makal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def makal_params
      params.require(:makal).permit(:kg, :tr, :description)
    end
end
