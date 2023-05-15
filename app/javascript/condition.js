window.addEventListener('load', function () {
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('condition-form');
    const button = document.getElementById('show-form-button');
    button.addEventListener('click', function() {
      form.style.display = 'block';
    });
  });
});
