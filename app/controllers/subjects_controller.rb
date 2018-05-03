class SubjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subject = Subject.where(author_id: current_user.id)
  end

  def show
    @subject = Subject.find(:id)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.author = current_user
    if(@subject.save)
      redirect_to @subject
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    unless(is_author? @subject)
      redirect_to :root_path
    end
  end

  def update
    @subject = Subject.find(params[:id])
    if(is_author? @subject)
      if(@subject.update(subject_params))
        redirect_to @subject
      else
        render 'edit'
      end
    end
    redirect_to root_path

  end

  def destroy
    subject = Subject.find(params[:id])
    if(is_author? subject)
      Subject.destroy(subject)
      redirect_to subjects_path
    end
    redirect_to root_path

  end

  private
  def subject_params
    params.require(:subject).permit(:description, :name)
  end

  def is_author?(subject)
    subject.author_id == current_user.id
  end
end
