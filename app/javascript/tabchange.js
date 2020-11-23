function tabchange(){
  // イベント発火対象をtabs変数に規定
  const tabs = document.querySelectorAll(".tab-link");
  // tabsのいずれかがclickされた際に、Ajax通信発生
  tabs.forEach(function(tab) {
    $(tab).click(function(){
      // clickされたタブのIDをコントローラに送信するため、tabIdを定義
      let tabId = tab.getAttribute("data-id");
      let genreId = tab.getAttribute("data-text");
      $.ajax({
        // URLはtabchangeアクションを動かすために設定
        url: `/tab/${tabId}`,
        type: "GET",
        // 選択されたタブの文字列をコントローラで照会するため、contentとしてデータ送信
        data: {content: `${genreId}`},
        datatype: "html",
        })
        // 成功した場合は、元のother-booksを削除して、AjaxのresponseをHTML要素として描画
        .done(function(response){
          $('.other-books').children().remove();
          $('.other-books').html(response);
        })
        // 失敗した場合は、エラーメッセージを表示する
        .fail(function(){
          alert('エラーが発生しました');
        })
    });
  });
};

window.addEventListener("turbolinks:load", tabchange);