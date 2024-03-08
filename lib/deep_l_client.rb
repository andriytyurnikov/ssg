class DeepLClient
  HOST = ENV.fetch("DEEP_L_HOST") { 'https://api-free.deepl.com' }
  KEY = ENV.fetch("DEEP_L_KEY") { '75c9ab6b-7043-61a9-5a4b-6bd94f46a76d:fx' }

  def self.translate(text: '', target_lang: 'EN')
    response = Faraday.new(
      url: HOST,
      headers: {
        'Authorization' => "DeepL-Auth-Key #{KEY}",
        'Content-Type' => 'application/json'
      }
    ).post('/v2/translate') do |request|
      request.body = {
        text: [text.to_s],
        target_lang: target_lang
      }.to_json
    end

    JSON.parse(response.body)['translations'][0]['text']
  rescue StandardError => e
    Rails.logger.error "DeepLClient error"

    text # return text in worst case scenario
  end
end