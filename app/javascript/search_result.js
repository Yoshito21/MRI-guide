document.addEventListener('DOMContentLoaded', function() {
  const signalContrasts = document.querySelectorAll(".signal-contrasts");
  const contrastSearchForm = document.getElementById('contrast-search-form');
  const searchContrastResult = document.getElementById('search-contrast-results');
  const occupationId = searchContrastResult.dataset.occupationId;

  contrastSearchForm.addEventListener('submit', function(event) {
    event.preventDefault(); // フォームのデフォルトの送信をキャンセル
  });

  signalContrasts.forEach(function (signalContrast) {
    signalContrast.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#2a2a2a;")
      this.style.cursor = 'default';
    });
    signalContrast.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    });
    signalContrast.addEventListener('click', function () {
      this.classList.toggle('selected');

      const checkbox = this.querySelector('input[type="checkbox"]');
      if (checkbox) {
        checkbox.checked = this.classList.contains('selected');
      }
      
      performSearch();
    });
  });

  function performSearch() {
    const searchResults = document.querySelector('#search-contrast-results');
    searchResults.innerHTML = '';

    const heightIds = Array.from(contrastSearchForm.querySelectorAll('input[name="height_ids[]"]:checked')).map(input => input.value);
    const lowIds = Array.from(contrastSearchForm.querySelectorAll('input[name="low_ids[]"]:checked')).map(input => input.value);

    const params = {
      height_ids: heightIds,
      low_ids: lowIds
    };

    const url = new URL(contrastSearchForm.action);
    Object.entries(params).forEach(([key, value]) => {
      if (Array.isArray(value)) {
        value.forEach(item => url.searchParams.append(key + '[]', item));
      } else {
        url.searchParams.append(key, value);
      }
    });

    fetch(url, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then(response => response.json())
      .then(data => {
        const results = data;
        searchResults.innerHTML = "";

        results.forEach(result => {
          const childElement = document.createElement("div");
          const linkElement = document.createElement("a");
          linkElement.href = '/imagings/' + result.id + '?occupation_id=' + occupationId;
          linkElement.textContent = result.purpose; // リンクのテキストを設定
          childElement.appendChild(linkElement);
          searchResults.appendChild(childElement);
        });
      })
  }
});
