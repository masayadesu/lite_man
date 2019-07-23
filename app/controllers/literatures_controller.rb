class LiteraturesController < ApplicationController
  before_action :set_target_literature, only: %i[show edit update destroy]


  def index
    @literatures = Literature.all
  end

  def show
  end

  def new
    @literature = Literature.new
  end

  def edit
  end

  def create
    literature = Literature.create(literature_params)
    redirect_to literature
  end

  def update
    @literature.update(literature_params)
    redirect_to @literature
  end

  def destroy
    @literature.destroy
    # binding.pry
    redirect_to literatures_path
  end

  private
  def literature_params
    params.require(:literature).permit(
      :author, :title, :volume, :page, :url, :published, :publish, :price, :keyword, :state, :remarks)
  end
  def set_target_literature
    @literature = Literature.find(params[:id])
  end


end
