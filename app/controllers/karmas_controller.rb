class KarmasController < ActionController::Base
  def update
    @karma = Karma.find params[:id]
    @karma.increment(:value)
    @karma.save
    redirect_to(:back)
  end
end
