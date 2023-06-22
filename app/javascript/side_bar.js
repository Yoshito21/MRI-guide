document.addEventListener('DOMContentLoaded', function() {
  const searchForm = document.getElementById('detailed-search-form');
  const searchInput = document.getElementById('search-purpose');
  const searchSite = document.getElementById('search-site');
  const searchResult = document.getElementById('detailed-search-result');
  const occupationId = searchResult.dataset.occupationId;

  let timerId = null;

  searchInput.addEventListener('input', function(event) {
    clearTimeout(timerId);

    timerId = setTimeout(function() {
      performSearch();
    }, 300); // 300ミリ秒のディレイを設定しています
  });

  searchSite.addEventListener('change', function(event) {
    performSearch();
  });

  searchForm.addEventListener('submit', function(event) {
    event.preventDefault(); // フォームのデフォルトの送信をキャンセルします
    performSearch();
  });

  function performSearch() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const formData = new FormData(searchForm);

    fetch(searchForm.action, {
      method: 'POST',
      body: formData,
      headers: {
        'X-CSRF-Token': csrfToken
      }
    })
    .then(response => response.json())
    .then(data => {
      const results = data;
      searchResult.innerHTML = "";

      results.forEach(result => {
        const childElement = document.createElement("div");
        const linkElement = document.createElement("a");
        linkElement.href = '/imagings/' + result.id + '?occupation_id=' + occupationId;
        linkElement.textContent = result.purpose; // リンクのテキストを設定
        childElement.appendChild(linkElement);
        searchResult.appendChild(childElement);
      });
    })
    .catch(error => {
      alert('エラーが発生しました。再度お試しください。');
    });
  }
});
