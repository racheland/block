require 'telegram/bot'

token = '575876516:AAHgIDBXltPxRDQmh7k5K9-UXqv0GZvi5Cg'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when 'price'
      btc_price = '1050'
      bot.api.send_message(chat_id: message.chat.id, text: "BTC : " + btc_price + "만원")
    end
  end
end

