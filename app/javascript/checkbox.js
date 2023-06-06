window.addEventListener('load', function () {
  const contrast = document.querySelectorAll(".contrast")

  contrast.forEach(function(contrast){
    contrast.addEventListener('mouseover',function(){
      this.setAttribute("style", "background-color:#2a2a2a;")
      this.style.cursor = 'default';
    })
    contrast.addEventListener('mouseout',function(){
      this.removeAttribute("style")
    })
    contrast.addEventListener('click',function(){
      // 選択されたアイコンの状態をトグル
      this.classList.toggle('selected');

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
    
    // チェックボックスの初期状態に応じてselectedクラスを設定する
    const checkbox = contrast.querySelector('input[type="checkbox"]');
    if (checkbox) {
      if (checkbox.checked) {
        contrast.classList.add('selected');
      } else {
        contrast.classList.remove('selected');
      }

      // チェックボックスの変更イベントに対してselectedクラスをトグルする
      checkbox.addEventListener('change', function() {
        contrast.classList.toggle('selected', this.checked);
      });

      // チェックボックスがオンになっている場合、selectedクラスをトグルする
      if (checkbox.checked) {
        contrast.classList.toggle('selected');
      }
    }
  });
});
