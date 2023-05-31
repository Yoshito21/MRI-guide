document.addEventListener("DOMContentLoaded", () => {
  const submitBtn = document.getElementById("submit_btn");
  if (submitBtn) {
    submitBtn.addEventListener("click", (event) => {
      event.preventDefault();
      const form = event.target.closest("form");
      const formData = new FormData(form);

      fetch(form.action, {
        method: form.method,
        body: formData,
        headers: {
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      .then(response => response.text())
      .then(html => {
        document.getElementById('results').innerHTML = html;
      });
    });
  }
});

