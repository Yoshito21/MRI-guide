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
        .then((response) => response.text())
        .then((html) => {
          searchResults.innerHTML = html;
        })
        .catch((error) => {
          console.error(error);
        });
    });
  });
  