class LiteraturesController < ApplicationController
  before_action :authenticate_user
  before_action :set_target_literature, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[show edit update destroy]


  def index
    session[:q] = nil
    @literatures = Literature.where(user_id: @current_user).page(params[:page]).order(id: "ASC")
  end

  def search
    session[:q] = params[:q] if params[:q]
    @literatures = Literature.where(user_id: @current_user).search(session[:q]).page(params[:page]).order(id: "ASC")
      respond_to do |format|
        format.html { render :action => "index" }
        format.csv do
          send_data render_to_string, filename: "literatures-#{Time.now.strftime("%Y%m%d%H%M")}.csv", type: :csv
        end
      end
  end

  def show
  end

  def new
    @literature = Literature.new(flash[:literature])
  end

  def edit
  end

  def create
    literature = Literature.create(literature_params)
    if literature.save
      flash[:notice] = "文献を追加しました"
      redirect_to literature_path(literature)
    else
      flash[:literature] = literature
      flash[:error_messages] = literature.errors.full_messages
      redirect_back fallback_location: literature
    end
  end

  def update
    if @literature.update(literature_params)
      flash[:notice] = "「#{@literature.title}」の文献を編集しました"
      redirect_to @literature
    else
      flash[:literature] = @literature
      flash[:error_messages] = @literature.errors.full_messages
      redirect_back fallback_location: @literature
    end
  end

  def destroy
    @literature.destroy
    flash[:notice] = "「#{@literature.title}」の文献が削除されました"
    redirect_to :literatures
  end

  private
  def literature_params
    params.require(:literature).permit(:id, :author, :title, :volume, :page, :url, :published,
       :publish, :price, :keyword, :state, :remarks, :per_page).merge(user_id: @current_user.id)
  end

  def set_target_literature
    @literature = Literature.find(params[:id])
  end

  def correct_user
    if @literature.user_id != @current_user.id
      flash[:error_message] = "ページがありません"
      redirect_to :literatures
    end
  end
end
