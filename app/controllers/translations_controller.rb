class TranslationsController < ApplicationController
  def translate
    cache_key = "translations-#{ translation_params[:text] }"

    translation = Rails.cache.fetch(cache_key) do
      DeepLClient.translate text: translation_params[:text],
                            target_lang: translation_params[:to]
    end

    render json: {translation: translation }
  end

  private
  def translation_params
    params.permit(:text, :to)
  end
end
