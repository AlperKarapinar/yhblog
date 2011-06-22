class User::MembershipController < ApplicationController
  
  before_filter :require_authenticated

  def show
    @user = current_user
  end
  
  def edit
    @user = current_user

  end
  
  def update
    @user = current_user
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to  user_membership_info_path, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end
  
end