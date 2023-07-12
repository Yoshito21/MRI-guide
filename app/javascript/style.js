window.addEventListener('load', function () {
    const selectOptions = document.querySelectorAll('select option');
    selectOptions.forEach(option => {
    option.addEventListener('mouseover', function() {
        this.style.backgroundColor = '#72bce7';
    });
    option.addEventListener('mouseout', function() {
        this.style.backgroundColor = '';
    });
    });
});