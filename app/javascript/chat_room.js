$(function() {
    // ページが読み込まれたときに実行されるコード
    $('#chat_departure').val('Hokkaido'); // #chat_departureの値を'New Value'に変更する
    $('#chat_destination').val('Sapporo');
    $('#chat_budget').val('50000');
    $('#chat_nights').val('2');
    $('#chat_other').val('Sightseeing');

    talk_num = 0;
    $('.btn').on('click', function() {
        if (talk_num == 0){
            $('#talk_departure .chat-hukidashi-r').html($('.input-box').val());
            $('#talk_departure').removeClass('hidden');
            $('#question_destination').removeClass('hidden');
            $('.input-box').val('')
            talk_num+=1;
        }
        // if (talk_num == 1){
        //     $('#talk_departure .chat-hukidashi-r').html($('.input-box').val());
        //     $('#talk_departure').removeClass('hidden');
        //     $('#question_destination').removeClass('hidden');
        //     talk_num+=1;
        // }
    });
    // $('#talk_departure').removeClass('hidden');
    // $('#question_destination').removeClass('hidden');
});
