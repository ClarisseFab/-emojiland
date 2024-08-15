class UsersController < ApplicationController

  def my_emojis
    @user = current_user
    @emojis = @user.emojis
    if params[:category] && Category.exists?(params[:category])
      category = Category.find params[:category]
      @emojis = @emojis.select { |emoji| emoji.categories.include? category }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
