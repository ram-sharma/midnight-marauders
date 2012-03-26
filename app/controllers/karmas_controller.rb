class KarmasController < ActionController::Base
  def update
    @karma = Karma.find params[:id]
    @karma.increment(:value)
    @karma.save
    redirect_to :back
    # redirect_to @karma.karmable
    # doesn't work because listJ_item doesn't go back to list_item
  end
end
