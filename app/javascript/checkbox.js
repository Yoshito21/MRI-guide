window.addEventListener('DOMContentLoaded', function () {
  // 既に選択されているチェックボックスにselectedクラスを付与する
  const selectedCheckboxes = document.querySelectorAll('.contrast input[type="checkbox"]:checked');
  selectedCheckboxes.forEach(function (checkbox) {
    const contrast = checkbox.closest('.contrast');
    contrast.classList.add('selected');
    applyCSSBasedOnIds(contrast);
  });

  // チェックボックスのイベントリスナーを設定する
  const contrastElements = document.querySelectorAll('.contrast');
  contrastElements.forEach(function (contrast) {
    contrast.addEventListener('mouseover', function () {
      this.setAttribute("style", "background-color:#2a2a2a;");
      this.style.cursor = 'default';
    });

    contrast.addEventListener('mouseout', function () {
      this.removeAttribute("style");
    });

    contrast.addEventListener('click', function () {
      // 選択されたアイコンの状態をトグル
      this.classList.toggle('selected');
      applyCSSBasedOnIds(this);

      // 削除ボタンを表示する
      const selectedConditions = document.querySelectorAll('.contrast.selected');
      const deleteConditionsButton = document.querySelector('.delete-conditions');
      if (selectedConditions.length > 0) {
        deleteConditionsButton.style.display = 'block';
      } else {
        deleteConditionsButton.style.display = 'none';
      }

      // チェックボックスの状態を変更する
      const checkbox = this.querySelector('input[type="checkbox"]');
      if (checkbox) {
        checkbox.checked = this.classList.contains('selected');
      }
    });

    // チェックボックスの変更イベントに対してselectedクラスをトグルする
    const checkbox = contrast.querySelector('input[type="checkbox"]');
    if (checkbox) {
      checkbox.addEventListener('change', function () {
        contrast.classList.toggle('selected', this.checked);
        applyCSSBasedOnIds(contrast);
      });
    }
  });

  function applyCSSBasedOnIds(contrast) {
    const heightId = contrast.dataset.heightId;

    // height_idに基づいてCSSを適用
    if (heightId) {
      const heightElement = document.querySelector('.height[data-id="' + heightId + '"]');
      if (heightElement) {
        // CSSを適用する処理を記述
        heightElement.style.backgroundColor = '#dbd1d1';
        heightElement.style.color = '#1b1b1b';
      }
    }
  }
});
