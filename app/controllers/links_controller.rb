class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.identifier = unique_identifier

    if @link.save
      redirect_to root_path
    end
  end

  def show
    link = current_link_by_id_or_by_identifier

    if link_exists?(params[:id]) == false
      click = Click.new(link_id: link.id)
      click.save!
    end

    redirect_to link.url
  end

  def index

  end

  private
  def link_params
    params.require(:link).permit(:url)
  end

  def link_exists?(id)
    Link.exists?(id)
  end

  def current_link_by_id_or_by_identifier
    id = params[:id]

    if link_exists?(id)
      Link.find(id)
    else
      Link.find_by_identifier(id)
    end
  end

  def unique_identifier
    SecureRandom.urlsafe_base64(16)
  end
end
