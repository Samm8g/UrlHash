require "zlib"
require "base64"
require "uri"

class UrlMappingsController < ApplicationController
  def new
    @url_mapping = UrlMapping.new
  end

  def create
    @url_mapping = UrlMapping.new(url_mapping_params)
    if @url_mapping.valid?
      compressed_url = Zlib::Deflate.deflate(@url_mapping.original_url)
      @url_mapping.short_url = Base64.urlsafe_encode64(compressed_url)
      render :show
    else
      render :new
    end
  end

  def show
    # This action is now rendered from 'create'
  end

  def redirect
    begin
      compressed_url = Base64.urlsafe_decode64(params[:id])
      original_url = Zlib::Inflate.inflate(compressed_url)
      uri = URI.parse(original_url)
      if uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
        redirect_to original_url, allow_other_host: true
      else
        render plain: "Invalid URL", status: :unprocessable_entity
      end
    rescue
      render plain: "Not Found", status: :not_found
    end
  end

  private

  def url_mapping_params
    params.require(:url_mapping).permit(:original_url)
  end
end
