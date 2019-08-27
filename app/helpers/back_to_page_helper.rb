module BackToPageHelper
  def take_params
    {
      :page     => params[:page],
      # :per_page => params[:per_page],
      # :search   => params[:search]
    }
  end
end
