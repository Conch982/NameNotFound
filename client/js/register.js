document.getElementById('regis').addEventListener('submit', function(event) {
    event.preventDefault();
  
    var userName = document.getElementById('userName').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
  
    if (userName && email && password) {
      
      var registrationData = {
        userName: userName,
        email: email,
        password: password
      };
      console.log('Registration Data:', registrationData);
      document.getElementById('registrationMessage').textContent = 'Registration successful!';

    } else {
      
      document.getElementById('regiMessage').textContent = 'Please fill out all fields';
    }
  });