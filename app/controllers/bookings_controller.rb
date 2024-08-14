class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]

  def index
    @bookings = Booking.all
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
      params.require(:booking).permit(:date_start_on, :date_end_on)
    end
end
