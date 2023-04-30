window.addEventListener('load', function () {
    const contrast = document.querySelectorAll("#contrast")
    // 選択されたアイコンの配列を宣言
    let selectedIcons = [];
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
        
        // 選択されたアイコンを配列に追加または削除
        if (contrast.classList.contains('selected')) {
          selectedIcons.push(contrast);
        } else {
          selectedIcons = selectedIcons.filter(selectedIcon => selectedIcon !== icon);
        }
    })
    })
    
// 削除ボタンにクリックイベントリスナーを設定
const deleteButton = document.querySelector('#delete-button');
deleteButton.addEventListener('click', () => {
  // 選択されたアイコンを削除
  selectedIcons.forEach(selectedIcon => {
    selectedIcon.remove();
  });
  
  // 選択されたアイコンの配列をリセット
  selectedIcons = [];
})
})