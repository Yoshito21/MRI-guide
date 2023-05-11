window.addEventListener('load', function () {
  const contrast = document.querySelectorAll(".contrast")

  contrast.forEach(function(contrast){
    contrast.addEventListener('mouseover',function(){
      this.setAttribute("style", "background-color:#889291;")
    })
    contrast.addEventListener('mouseout',function(){
      this.removeAttribute("style")
    })
    contrast.addEventListener('click',function(){
      // 選択されたアイコンの状態をトグル
      this.classList.toggle('selected');
      console.log(this.classList); // デバッグ用：selectedクラスが付与されているかを確認する

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
  });
});
