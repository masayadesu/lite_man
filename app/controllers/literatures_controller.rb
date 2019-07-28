class LiteraturesController < ApplicationController
  before_action :set_target_literature, only: %i[show edit update destroy]
  before_action :authenticate_user
  # before_action :ensure_correct_user, only: %i[edit, update, destroy]}
  # before_action :ensure_correct_user

  def index
      @literatures = Literature.order(:id).page(params[:page])
      # @literatures = Literature.page(params[:page])
  end

  def search
    # @literatures = Literature.search(params[:q])
    # @literatures = @literatures.page(params[:page])
    @literatures = Literature.search(params[:q]).page(params[:page])
    render "index"
  end

  def show
  end

  def new
    @literature = Literature.new(flash[:notce])
  end

  def edit
  end

  def create
    literature = Literature.create(literature_params)
    # literature = Literature.create(literature_params,user_id: @current_user.id)
    # binding.pry
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
       :publish, :price, :keyword, :state, :remarks, :user_id)
  end
  def set_target_literature
    @literature = Literature.find(params[:id])
  end

  # def ensure_correct_user
  #   @literature = Literatue.find_by(id: params[:id])
  #   if @literature.user_id != @current_user.id
  #     flash[:notice] = "権限がありません"
  #     redirect_to login_path
  #   end
  # end


end
