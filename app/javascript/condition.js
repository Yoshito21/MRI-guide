window.addEventListener('load', function () {
  const contrast = document.querySelectorAll(".contrast")

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
      console.log(this.classList); // デバッグ用：selectedクラスが付与されているかを確認する
    

      // 選択されたアイコンを配列に追加または削除
      if (this.classList.contains('selected')) {
        selectedIcons.push(this.dataset.conditionId);
      } else {
        selectedIcons = selectedIcons.filter(selectedIconId => selectedIconId !== this.dataset.conditionId);
      }
      console.log(selectedIcons); // デバッグ用：配列に要素が正しく格納されているかを確認する
    })
  })

  // 削除ボタンにクリックイベントリスナーを設定
  const deleteButton = document.querySelector('#delete-button');
  deleteButton.addEventListener('click', () => {
    // 選択された条件の ID を送信する
const url = "/imagings/1/conditions/1/destroy?ids=" + selectedIcons.join(",") + "&occupation_id=2";
    console.log(url);
    const token = '<%=j form_authenticity_token %>';
    const formData = new FormData();
    formData.append('authenticity_token', token);
    formData.append('_method', 'delete');
    selectedIcons.forEach(id => {
      formData.append('ids[]', id);
    });
    const options = {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token
      },
      body: formData
    };
    fetch(url, options)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(responseData => {
        // 条件の削除が成功した場合の処理を記述する
        console.log(responseData); // デバッグコード：レスポンスデータをコンソールに出力する
      })
      .catch(error => {
        console.error('Error:', error);
      });
  });
});
