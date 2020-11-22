function genreChange() {
  // templates/partial からid="category"の要素を取得
  const catTarget = $("#category");
  for (let i = 0; i < catTarget.length; i++){
    // catTargetのいずれかの項目が選択された時、その項目のvalue（数値）を所得しcatNumへ代入
    $(catTarget[i]).change(function() {
      let catNum = catTarget[i].value;
    // 取得したcatNumを元にAjaxでgenre_selectアクションへ移行し、HTMLでのレスポンスを要求
      $.ajax({
        url: `/cat/${Number(catNum)}`,
        type: "GET",
        data: {num: catNum},
        datatype: "html"
      })
      // 成功した場合は、responseされたpartialを描画する
      .done(function(response){
        const target = document.getElementById("genre");
      // 既に描画されたpartialが存在する場合は、先にそれを削除する
        const removeDiv = document.getElementById("genre_id");
        if (removeDiv != null) {
          removeDiv.remove();
        }
        target.insertAdjacentHTML("beforeend", response);
      })
      // 失敗した場合は、エラーメッセージを表示する
      .fail(function(){
        alert('エラーが発生しました');
      })
    });
  };
};

window.addEventListener("load", genreChange);