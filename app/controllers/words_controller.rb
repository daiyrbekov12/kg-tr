class WordsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :edit, :update, :destroy]

  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    keyword = params[:search]
    keyword = '*' if keyword==nil || keyword==''

    @words = Word.search keyword, fields: [:word] , page: params[:page], per_page: 10
    
#Session save every search
    if session[:word]==nil
      session[:word]=[]
    end
    if keyword!='*'
      if session[:word].include? keyword

        else
          session[:word].push(keyword)
      end
    end

    @all = Word.all
    @sameWords = []
#Save same words
     @all.each do |a|
        if keyword[0].upcase==a.word[0].upcase
          if keyword.capitalize == a.word.capitalize

          else
           @sameWords.push(a.word)
          end
        end
      end
  #For range += 1
    @all.each do |word|
      if keyword.capitalize == word.word.capitalize
        word.range += 1
        word.save
      end

    end

    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'words/popularpdf', pdf: 'Popularpdf'}
    end
  end


  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def is_admin
      if current_user.role!='admin'
        respond_to do |format|
          format.html { redirect_to words_url, notice: 'You can not edit dictionary' }
          format.json { head :no_content }
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:language_id,:vna_id,:category_id, :word, :translation, :definition, :audio)
    end
end
