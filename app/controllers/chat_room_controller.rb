class ChatRoomController < ApplicationController
  def index
  end

  def create
    # ダミーデータではなく実際のリクエストパラメータを利用する
    plan = create_travelplan(chat_room_params)

    respond_to do |format|
      format.html
      format.json { render json: plan }
    end
  end

  private

  # chat_room_params メソッドでフォームからのデータを取得する
  def chat_room_params
    params.require(:chat_room).permit(:departure, :budget, :nights, :other)
  end

  def create_travelplan(json)
    # 実際の処理をここに実装する
    # この例ではダミーデータを返す
    result = {
      "status": "success",
      "message": "Travel plan created successfully!",
      "input": json
    }
    return result
  end
end
