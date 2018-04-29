class WordreposController < ApplicationController
  respond_to :js, :json, :html
  before_action :set_wordrepo, only: [:edit, :show, :update, :destroy]

  def bookmark
    word = Word.find(params[:word_id])
    @wordlist = current_user.wordlists.first

    @exist = Wordrepo.find_by_word_id_and_wordlist_id(word.id, @wordlist.id);
    # @exist=Wordrepo.where('word_id = ? and email = ?', params[:text], params[:text]).first
    if @exist!=nil
      @exist.destroy

    elsif @wordlist!=nil && word!=nil
      @res= Wordrepo.create({:wordlist_id => @wordlist.id, :word_id=> word.id})
      render @res, status: :ok
    end

  end
  # GET /wordrepos
  # GET /wordrepos.json
  def index
    @wordrepos = Wordrepo.where('wordlist_id=?' , current_user.wordlists.first.id)

        respond_to do |format|
       format.html
       format.json
       format.pdf {render template: 'wordrepos/saved', pdf: 'Saved'}
      end
  end

  # GET /wordrepos/1
  # GET /wordrepos/1.json
  def show
  end

  # GET /wordrepos/new
  def new
    @wordrepo = Wordrepo.new
  end

  # GET /wordrepos/1/edit
  def edit




  end

  # POST /wordrepos
  # POST /wordrepos.json
  def create
    @wordrepo = Wordrepo.new(wordrepo_params)
    respond_to do |format|
      if @wordrepo.save
        format.html { redirect_to @wordrepo, notice: 'Wordrepo was successfully created.' }
        format.json { render :show, status: :created, location: @wordrepo }
      else
        format.html { render :new }
        format.json { render json: @wordrepo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wordrepos/1
  # PATCH/PUT /wordrepos/1.json
  def update
    respond_to do |format|
      if @wordrepo.update(wordrepo_params)
        format.html { redirect_to @wordrepo, notice: 'Wordrepo was successfully updated.' }
        format.json { render :show, status: :ok, location: @wordrepo }
      else
        format.html { render :edit }
        format.json { render json: @wordrepo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wordrepos/1
  # DELETE /wordrepos/1.json
  def destroy
    @wordrepo.destroy
    respond_to do |format|
      format.html { redirect_to wordrepos_url, notice: 'Wordrepo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wordrepo
      @wordrepo = Wordrepo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wordrepo_params
      params.require(:wordrepo).permit(:wordlist_id, :word_id)
    end
end
