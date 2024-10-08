class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]

  def index
    @bookings = current_user.bookings
    # if params[:category] && Category.exists?(params[:category])
    #   category = Category.find params[:category]
    #   @bookings_result = []
    #   @bookings.each do |booking|
    #     booking.emoji.categories.each do |ecategory|
    #       @bookings_result << booking if ecategory == category
    #     end
    #   end
    #   @bookings = @bookings_result.uniq
    # end


    if params[:category] && Category.exists?(params[:category])
      category_id = params[:category]
      # Je mets sur l'objet Booking
      @bookings = Booking
                  # Je joins la table categories (booking.category_id = cateogry.id)
                  .joins(emoji: :categories)
                  # Je selectionne que les bookings qui appartienne à mon user
                  # Je selectionne que les bookings dont au moin une des categories de mon emojie match
                  # avec la category demandé
                  .where(
                    user_id: current_user.id,
                    categories: { id: category_id }
                  )
                  # Je supprime tout les bookings en double (.uniq)
                  .distinct
                  category = Category.find params[:category]
    end

    @current_category = category
  end

  def new
    @emoji = Emoji.find(params[:emoji_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new()
    dates = booking_params[:date_start_on].split(" to ")
    @booking.date_start_on = dates[0]
    @booking.date_end_on = dates[1]
    @booking.user = current_user
    @booking.emoji = Emoji.find(params[:emoji_id])
    @booking.price_booking = ((@booking.date_end_on - @booking.date_start_on) * @booking.emoji.price).round(2).to_s.sub(/\.0+$/, '')
    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: "Emoji was successfully booked." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:date_start_on, :date_end_on, :price_booking)
    end
end
