let user = {
    fname: "Иван",
    lname: "Иванов",
    email: "ivanov@example.com",
    bio: "Немного обо мне"
  };
  
  // сохраняет данные из формы в объект user
function submitForm() {
    // Заполните поля формы
    user = {
      fname: document.getElementById('fname').value,
      lname: document.getElementById('lname').value,
      email: document.getElementById('email').value,
      bio: document.getElementById('bio').value
    };
    console.log(user);
  }