class EmojisController < ApplicationController

  before_action :set_emoji, only: %i[ show edit update destroy ]

  skip_before_action :authenticate_user!, only: [:index, :show]


  # GET /emojis or /emojis.json
  def index
    @emojis = Emoji.all
    if params[:category] && Category.exists?(params[:category])
      category = Category.find params[:category]
      @emojis = @emojis.select { |emoji| emoji.categories.include? category }
    end
  end

  # GET /emojis/1 or /emojis/1.json
  def show
    @booking = Booking.new
  end

  # GET /emojis/new
  def new
    @emoji = Emoji.new
  end

  # POST /emojis or /emojis.json
  def create
    @emoji = Emoji.new(emoji_params)
    params[:emoji][:categories].each do |category_id|
      if Category.exists? category_id
        category = Category.find category_id
        @emoji.categories << category
      end
    end
    @emoji.user = current_user
    @emoji.tag_list.add(params[:emoji][:tag])

    respond_to do |format|
      if @emoji.save
        format.html { redirect_to my_emojis_url, notice: "Emoji was successfully created." }
        format.json { render :show, status: :created, location: @emoji }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emoji.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /emojis/1/edit
  def edit
    # @emoji = Emoji.find(params[:id])
    set_emoji
  end

  # PATCH/PUT /emojis/1 or /emojis/1.json
  def update
    respond_to do |format|
      if @emoji.update(emoji_params)
        format.html { redirect_to my_emojis_url, notice: "Emoji was successfully updated." }
        format.json { render :show, status: :ok, location: @emoji }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emoji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emojis/1 or /emojis/1.json
  def destroy
    @emoji.destroy!

    respond_to do |format|
      format.html { redirect_to my_emojis_url, notice: "Emoji was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emoji
      @emoji = Emoji.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emoji_params
      params.require(:emoji).permit(:name, :description, :price, :picture)
    end
end
