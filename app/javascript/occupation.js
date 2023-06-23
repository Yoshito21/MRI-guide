document.addEventListener("DOMContentLoaded", () => {
  const searchForm = document.getElementById("search-occupation");
  const searchResults = document.getElementById("search-occupation-results");

  searchForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const formData = new FormData(searchForm);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

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
      searchResults.innerHTML = "";

      const filteredResults = results.filter(result => result.id !== 1 && result.id !== 2);

      if (filteredResults.length === 0) {
        const newOccupationButton = document.createElement("a");
        newOccupationButton.href = '/occupations/new';
        newOccupationButton.textContent = "新規登録";
        searchResults.appendChild(newOccupationButton);
      } else {
        filteredResults.forEach(result => {
          const childElement = document.createElement("div");
          const linkElement = document.createElement("a");
          linkElement.href = '/occupations/' + result.id;
          linkElement.textContent = result.name;
          childElement.appendChild(linkElement);
          searchResults.appendChild(childElement);
        });
      }
    })
  });
});
