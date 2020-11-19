function tabchange(){
  const tabs = document.querySelectorAll(".tab-link");
  tabs.forEach(function(tab) {
    $(tab).click(function(){
      let tabId = tab.getAttribute("data-id")
      $.ajax({
        url: `/tab/${tabId}`,
        type: "GET",
        data: {content : $(tab).text()},
        datatype: "html",
        })
        .done(function(response){
          $('.other-books').children().remove();
          $('.other-books').html(response);
        })
        .fail(function(){
          alert('エラーが発生しました');
        })
    });
  });
};

window.addEventListener("load", tabchange);