document.addEventListener('DOMContentLoaded', function() {
  const signalContrasts = document.querySelectorAll(".signal-contrasts");
  const contrastSearchForm = document.getElementById('contrast-search-form');
  const searchContrastResult = document.getElementById('search-contrast-results');
  const occupationId = searchContrastResult.dataset.occupationId;

  contrastSearchForm.addEventListener('submit', function(event) {
    event.preventDefault(); // フォームのデフォルトの送信をキャンセル
  });

  signalContrasts.forEach(function (signalContrasts) {
      signalContrasts.addEventListener('mouseover',function(){
        this.setAttribute("style", "background-color:#2a2a2a;")
        this.style.cursor = 'default';
      })
      signalContrasts.addEventListener('mouseout',function(){
        this.removeAttribute("style")
      })
        signalContrasts.addEventListener('click', function () {
        this.classList.toggle('selected');

        const checkbox = this.querySelector('input[type="checkbox"]');
        if (checkbox) {
          checkbox.checked = this.classList.contains('selected');
        }
          const selectedEvent = new CustomEvent('selected');
          signalContrasts.addEventListener('selected', function(event) {
          performSearch();
          });
          signalContrasts.dispatchEvent(selectedEvent);
      });
    });

    function performSearch() {
      const searchResults = document.querySelector('#search-contrast-results');
      searchResults.innerHTML = '';
    }

  function performSearch() {
      const formData = new FormData(contrastSearchForm);
  
      fetch(contrastSearchForm.action + "?" + new URLSearchParams(formData), {
        method: 'GET',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      })
      .then(response => response.json())
      .then(data => {
        const results = data;
        searchContrastResult.innerHTML = "";

      results.forEach(result => {
        const childElement = document.createElement("div");
        const linkElement = document.createElement("a");
        linkElement.href = '/imagings/' + result.id + '?occupation_id=' + occupationId;
        linkElement.textContent = result.purpose; // リンクのテキストを設定
        childElement.appendChild(linkElement);
        searchContrastResult.appendChild(childElement);
      });
    })
    .catch(error => {
      alert('エラーが発生しました。再度お試しください。');
    });
  }
});
