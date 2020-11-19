function tabchange2(){
  const tabs = document.querySelectorAll(".tab-link");
  tabs.forEach(function(tab) {
    $(tab).click(function(){
      let tabId = tab.getAttribute("data-id")
      $.ajax({
        url: `/tab/${tabId}`,
        type: "GET",
        data: {content : $(tab).text()},
        datatype: "html",
        // success: function(data){
        //   //成功時の処理
        // },
        // error: function(data){
        //   //失敗時の処理
        // }
      })
      .done(function(response){
        $('.other-books').children().remove();
        $('.other-books').html(response);
      });
    });
  });
}

window.addEventListener("load", tabchange2);