class YjsChannel < ApplicationCable::Channel
  
  
  def subscribed
    stream_for content
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    YjsChannel.broadcast_to(content, data['payload'].values)
  end

  private
  
  def content
    Content.find(params[:content_id])
  end

end
