document.addEventListener("DOMContentLoaded", () => {
    const searchForm = document.getElementById("search-occupation");
    const searchResults = document.getElementById("search-occupation-results");
  
    searchForm.addEventListener("submit", (event) => {
      event.preventDefault();
      const formData = new FormData(searchForm);
      const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content'); // CSRFトークンを取得
  
      fetch(searchForm.action, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRF-Token': csrfToken // リクエストヘッダーにCSRFトークンを含める
        }
      })
      .then(response => response.json())
      .then(data => {
        const results = data;
        searchResults.innerHTML = "";
  
        results.forEach(result => {
          if (result.id !== 1 && result.id !== 2) {            
            const childElement = document.createElement("div");
            const linkElement = document.createElement("a");
            linkElement.href = '/occupations/' + result.id;
            linkElement.textContent = result.name; // リンクのテキストを設定
            childElement.appendChild(linkElement);
            searchResults.appendChild(childElement);
          };
        });
      })
    });
  });
  