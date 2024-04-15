(() => {
  // app/javascript/chat_room.js
  $(function() {
    talk_num = 0;
    $(".input-box").keydown(function(event) {
      if (event.keyCode === 13 && event.ctrlKey || event.keyCode === 13 && event.metaKey) {
        event.preventDefault();
        $(".btn").click();
      }
    });
    $(".btn").on("click", function() {
      if ($(".input-box").val() == "") {
        alert("\u30E1\u30C3\u30BB\u30FC\u30B8\u3092\u5165\u529B\u3057\u3066\u304F\u3060\u3055\u3044");
      } else {
        if (talk_num == 0) {
          $("#talk_departure .chat-hukidashi-r").html($(".input-box").val());
          $("#chat_departure").val($(".input-box").val());
          $("#talk_departure").removeClass("hidden");
          $("#question_destination").removeClass("hidden");
        }
        if (talk_num == 1) {
          $("#talk_destination .chat-hukidashi-r").html($(".input-box").val());
          $("#chat_destination").val($(".input-box").val());
          $("#talk_destination").removeClass("hidden");
          $("#question_budget").removeClass("hidden");
        }
        if (talk_num == 2) {
          if ($(".input-box").val().match(/[^0-9]/)) {
            alert("\u534A\u89D2\u6570\u5B57\u3067\u5165\u529B\u3057\u3066\u304F\u3060\u3055\u3044");
            talk_num -= 1;
          } else {
            $("#talk_budget .chat-hukidashi-r").html($(".input-box").val());
            $("#chat_budget").val($(".input-box").val());
            $("#talk_budget").removeClass("hidden");
            $("#question_nights").removeClass("hidden");
          }
        }
        if (talk_num == 3) {
          $("#talk_nights .chat-hukidashi-r").html($(".input-box").val());
          $("#chat_nights").val($(".input-box").val());
          $("#talk_nights").removeClass("hidden");
          $("#question_other").removeClass("hidden");
        }
        if (talk_num == 4) {
          $("#talk_other .chat-hukidashi-r").html($(".input-box").val());
          $("#chat_other").val($(".input-box").val());
          $("#talk_other").removeClass("hidden");
          $("#generate_plan").removeClass("hidden");
        }
        $(".input-box").val("");
        talk_num += 1;
      }
    });
  });
})();
//# sourceMappingURL=assets/chat_room.js.map
