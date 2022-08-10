class GroupConversionsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    @group_conversion = group.group_conversions.new(group_conversion_params)
    @group_conversion.group = group
    @group_conversion.save

    respond_to do |format|
      if @group_conversion.save
        format.html { redirect_to group_path(group), notice: 'Transaction was successfully added to group.' }
        format.json { render :show, status: :created, location: @group_conversion }
      else
        format.html { render :new }
        format.json { render json: @group_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_conversions/1 or /group_conversions/1.json
  def destroy
    @group_conversion.destroy

    respond_to do |format|
      format.html { redirect_to group_conversions_url, notice: 'group conversion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_conversion_params
    params.require(:group_conversion).permit(:quantity, :conversion_id, :group_id)
  end
end
