function tabchange() {
  const tabs = document.querySelectorAll(".tab-link");
  tabs.forEach(function(tab) {
    tab.addEventListener('click', () =>{
      // let tabName = tab.textContent
      // console.log(tabName);
      let tabId = tab.getAttribute("data-id")
      const XHR = new XMLHttpRequest(tabId);
      XHR.open("GET", `/tab/${tabId}`, true);
      XHR.responseType = "json";
      XHR.send();
      // JSONでのレスポンス受信
      XHR.onload = () => {
        // レスポンスのHTTPステータスを解析、該当するエラーメッセージを返す
        if (XHR.status != 200){
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        } 
        if (XHR.status == 200){
          console.log("XHR");
        }
      };
    })
  });

};

window.addEventListener("load", tabchange);