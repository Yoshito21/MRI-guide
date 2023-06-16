document.addEventListener('DOMContentLoaded', function() {
  const signalContrasts = document.querySelectorAll(".signal-contrasts");
  const contrastSearchForm = document.getElementById('contrast-search-form');

  contrastSearchForm.addEventListener('submit', function(event) {
    event.preventDefault(); // フォームのデフォルトの送信をキャンセル
  });

  signalContrasts.forEach(function(signalContrast) {
    signalContrast.addEventListener('mouseover', function() {
      this.setAttribute("style", "background-color:#2a2a2a;");
      this.style.cursor = 'default';
    });
    signalContrast.addEventListener('mouseout', function() {
      this.removeAttribute("style");
    });
    signalContrast.addEventListener('click', function() {
      this.classList.toggle('selected');

      const checkbox = this.querySelector('input[type="checkbox"]');
      if (checkbox) {
        checkbox.checked = this.classList.contains('selected');
      }
      
      performSearch();
    });
  });

  function performSearch() {
    const searchResults = document.querySelector('#search-results'); // ビューファイルのid修正
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
    });
  }

  function checkSelectedContrasts() {
    const selectedHeightContrasts = Array.from(contrastSearchForm.querySelectorAll('input[name="height_ids[]"]:checked')).length;
    const selectedLowContrasts = Array.from(contrastSearchForm.querySelectorAll('input[name="low_ids[]"]:checked')).length;
    
    if (selectedHeightContrasts === 0 && selectedLowContrasts === 0) {
      // どの信号値も選択されていない場合は全ての結果を表示
      performSearch();
    }
  }

  checkSelectedContrasts(); // 初期表示時に選択された信号値があれば検索を実行
});
