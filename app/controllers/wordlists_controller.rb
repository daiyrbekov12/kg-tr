class WordlistsController < ApplicationController
  before_action :set_wordlist, only: [:show, :edit, :update, :destroy]

  # GET /wordlists
  # GET /wordlists.json
  def index
    @wordlists = current_user.wordlists.all
  end

  # GET /wordlists/1
  # GET /wordlists/1.json
  def show
  end

  # GET /wordlists/new
  def new
    @wordlist = Wordlist.new
  end

  # GET /wordlists/1/edit
  def edit
  end

  # POST /wordlists
  # POST /wordlists.json
  def create
    @wordlist = Wordlist.new(wordlist_params)

    respond_to do |format|
      if @wordlist.save
        format.html { redirect_to @wordlist, notice: 'Wordlist was successfully created.' }
        format.json { render :show, status: :created, location: @wordlist }
      else
        format.html { render :new }
        format.json { render json: @wordlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wordlists/1
  # PATCH/PUT /wordlists/1.json
  def update
    respond_to do |format|
      if @wordlist.update(wordlist_params)
        format.html { redirect_to @wordlist, notice: 'Wordlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @wordlist }
      else
        format.html { render :edit }
        format.json { render json: @wordlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wordlists/1
  # DELETE /wordlists/1.json
  def destroy
    @wordlist.destroy
    respond_to do |format|
      format.html { redirect_to wordlists_url, notice: 'Wordlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wordlist
      @wordlist = Wordlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wordlist_params
      params.require(:wordlist).permit(:name, :user_id)
    end
end
