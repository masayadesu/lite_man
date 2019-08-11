class LiteraturesController < ApplicationController
  before_action :authenticate_user
  before_action :set_target_literature, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[show edit update destroy]


  def index
    # @total_literatures = Literature.where(user_id: @current_user).count
    session[:per_page] = params[:per_page]
    @per_page = session[:per_page]
    binding.pry
    @literatures = Literature.where(user_id: @current_user).page(params[:page]).per(:per_page)
    # @literatures = Literature.where(user_id: @current_user).page(params[:page])
    # @literatures = Literature.where(user_id: @current_user).page(params[:change_number])
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
      end
    end
  end
  def per_page
    session[:per_page] = params[:per_page]
    # binding.pry
    render nothing: true

  end
  def search
    @literatures = Literature.where(user_id: @current_user).search(params[:q]).page(params[:page])
    # if params[:csv_output]
      # send_data render_to_string, filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
      # send_data render_to_string, template: "literatures/search.csv.ruby", filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
      # send_data render_to_string, template: "literatures/csv_output.csv.ruby", filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
    # else
      render "index"
    # end
  end

  # def csv_output
  #   @literatures = Literature.where(user_id: @current_user).all
    # binding.pry
    # if params[:export_csv]
    #   @literatures
    # else
    #   @literatures = Literature.where(user_id: @current_user).all
    #
    # end
    # send_data render_to_string, filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
  # end

  def show
  end

  def new
    @literature = Literature.new(flash[:notce])
  end

  def edit
  end

  def create
    literature = Literature.create(literature_params)
    if literature.save
      flash[:notice] = "文献を追加しました"
      redirect_to literature
    else
      flash[:notice] = literature
      flash[:error_messages] = literature.errors.full_messages
      redirect_back fallback_location: literature
    end
  end

  def update
    if @literature.update(literature_params)
      flash[:notice] = "#{@literature.title}の文献を編集しました"
      redirect_to @literature
    else
      flash[:notice] = @literature
      flash[:error_messages] = @literature.errors.full_messages
      redirect_back fallback_location: @literature
    end
  end

  def destroy
    @literature.destroy

    redirect_to literatures_path, flash: { notice: "#{@literature.title}の文献が削除されました" }
  end

  private
  def literature_params
    params.require(:literature).permit(:id, :author, :title, :volume, :page, :url, :published,
       :publish, :price, :keyword, :state, :remarks).merge(user_id: @current_user.id)
  end
  def set_target_literature
    @literature = Literature.find(params[:id])
  end
  def correct_user
    if @literature.user_id != @current_user.id
      flash[:error_message] = "権限がありません"
      redirect_to root_path
    end
  end
end
