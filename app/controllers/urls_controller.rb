class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    #@url = Url.find_by(short_url: params[:short_url])
    #redirect_to @url.sanitize
    @url = Url.find(params[:id])
    #@url = Url.find_by(shorturl: params[:shorturl])
    #redirect_to @url.sanitize
  end

  def new
    @url = Url.new
  end

  def create
    #@url = Url.new(url_params)
    #@url.short_url =@url.generate_short_url
    #@url.long_url = @url.sanitize
    #if @url.save
    #  redirect_to urls_path
    #else
    #  flash[:error] = @url.errors.full_messages
    #  redirect_to new_url_path
    #end
    @url = Url.new(url_params)
    @url.shorturlcode = @url.generate_short_url_code
    @url.shorturl = @url.generate_short_url
    @url.longurl = @url.sanitize
    @url.expiry_duration = 2


    if @url.save
      #redirect_to 
      redirect_to @url
    else
      #render :new, status: :unprocessable_entity
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path
    end

  end

  def send_to_url
    id = params[:short_url]
    #id_full = baseurl + id 
    url = Url.find_by(shorturlcode: id)
    redirect_to url.longurl
  end

  private
  def url_params
    params.require(:url).permit(:longurl, :baseurl)
  end

end
