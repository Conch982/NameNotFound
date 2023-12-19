//For login.html

document.getElementById('login').addEventListener('submit', function(event) {
    event.preventDefault();

    var userName = document.getElementById('userName').value;
    var userPass = document.getElementById('userPass').value;
  
    if (userName && userPass) {
      if (userName === 'user' && userPass === 'password') {
        // Yurp
        document.getElementById('loginMessage').textContent = 'Login successful!';
      } else {
        // Nope
        document.getElementById('loginMessage').textContent = 'Invalid username or password';
      }
    } else {
      // Username & or pass empty
      document.getElementById('loginMessage').textContent = 'Please enter username and password';
    }
  });