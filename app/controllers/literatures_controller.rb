class LiteraturesController < ApplicationController
  before_action :set_target_literature, only: %i[show edit update destroy]


  def index
    @literatures = Literature.page(params[:page])
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
    # binding.pry
    if literature.save
      flash[:notice] = "文献を追加しました"
      redirect_to literature
    else
      redirect_back(fallback_location: edit_literature_path(literature),
      flash: {literature: literature, error_messages: literature.errors.full_messages }
      )

  end

  def update
    @literature.update(literature_params)
    redirect_to @literature
  end

  def destroy
    @literature.destroy

    redirect_to literatures_path
  end

  private
  def literature_params
    params.require(:literature).permit(:id, :author, :title, :volume, :page, :url,
       :published, :publish, :price, :keyword, :state, :remarks)
  end
  def set_target_literature
    @literature = Literature.find(params[:id])
  end


end
