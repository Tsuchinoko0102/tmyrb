function genreChange() {
  const catTarget = $("#category");
  for (let i = 0; i < catTarget.length; i++){
    $(catTarget[i]).change(function() {
      let catNum = catTarget[i].value;
      console.log(catNum);
      $.ajax({
        url: `/cat/${Number(catNum)}`,
        type: "GET",
        data: {num: catNum},
        datatype: "html"
      })
      .done(function(response){
        // const selectBox = $.parseHTML(response);
        const target = document.getElementById("genre");
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