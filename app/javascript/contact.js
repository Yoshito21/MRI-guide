document.addEventListener('DOMContentLoaded', () => {
  const showCompletedCheckbox = document.getElementById('show-completed-checkbox');
  const visibilityForm = document.getElementById('visibility-form');

  // 初期表示時に完了済みの問い合わせを非表示にする
  const completedContacts = document.querySelectorAll('.completed-contact');
  completedContacts.forEach(contact => {
    contact.style.display = 'none';
  });

  showCompletedCheckbox.addEventListener('change', () => {
    const formData = new FormData(visibilityForm);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/contacts/update_visibility');
    xhr.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').getAttribute('content'));

    xhr.onload = () => {
      if (xhr.status === 200) {
        try {
          const response = JSON.parse(xhr.responseText);
          updateContactVisibility(response);
        } catch (error) {
          console.log('Failed to parse JSON response: ' + error);
        }
      } else {
        console.log('Request failed. Status: ' + xhr.status);
      }
    };
    

    xhr.send(formData);
  });

  function updateContactVisibility(response) {
    const visibleContacts = document.querySelectorAll('.visible-contact');
    const completedContacts = document.querySelectorAll('.completed-contact');

    if (response.show_completed) {
      // 全ての問い合わせを表示
      visibleContacts.forEach(contact => {
        contact.style.display = 'block';
      });
      completedContacts.forEach(contact => {
        contact.style.display = 'block';
      });
    } else {
      // 完了済みの問い合わせを非表示にする
      completedContacts.forEach(contact => {
        contact.style.display = 'none';
      });
      visibleContacts.forEach(contact => {
        contact.style.display = 'block';
      });
    }
  }

  const hideContactsButton = document.getElementById('hide-contacts-button');
hideContactsButton.addEventListener('click', function(event) {
  event.preventDefault();

  const selectedContacts = document.querySelectorAll('input[name="contact_ids[]"]:checked');
  const contactIds = Array.from(selectedContacts).map(contact => contact.value);

  if (contactIds.length > 0) {
    const formData = new FormData();
    formData.append('hide_contacts', true);
    contactIds.forEach(contactId => formData.append('contact_ids[]', contactId));

    fetch('/contacts/update_visibility', {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: formData
    })
    .then(response => response.json())
    .then(updateContactVisibility)
    .catch(error => console.error(error));
  }
  });
});
