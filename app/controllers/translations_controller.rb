class TranslationsController < ApplicationController
  def translate
    response = DeepLClient.translate  text: params[:text],
                                      target_lang: params[:to]

    puts response.body
    puts params[:text].inspect
    render json: {translation: response.body}
  end
end
