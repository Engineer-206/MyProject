// Function to show the home page
function showHomePage() {
    hideAllPages();
    document.getElementById('home-page').style.display = 'block';
  }
  
  // Function to show the about page
  function showAboutPage() {
    hideAllPages();
    document.getElementById('about-page').style.display = 'block';
  }
  
  // Function to show the login page
  function showLoginPage() {
    hideAllPages();
    document.getElementById('login-page').style.display = 'block';
  }
  
  // Function to show the registration page
  function showRegisterPage() {
    hideAllPages();
    document.getElementById('registration-page').style.display = 'block';
  }
  
  // Function to show the download page
  function showDownloadPage() {
    hideAllPages();
    document.getElementById('software-list').style.display = 'block';
  }
  
  // Function to hide all pages
  function hideAllPages() {
    var pages = document.querySelectorAll('.page');
    for (var i = 0; i < pages.length; i++) {
      pages[i].style.display = 'none';
    }
  }
  

// Placeholder for user registration
function registerUser() {
    var firstName = document.getElementById('fname').value;
    var lastName = document.getElementById('lname').value;
    var username = document.getElementById('username').value;
    var email = document.getElementById('email').value;
    var phone = document.getElementById('phone').value;
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var department = document.getElementById('department').value;
  
    // Simple input validation
    if (!firstName || !lastName || !username || !email || !phone || !password || !confirmPassword || !department) {
      alert('Please fill in all required fields.');
      return;
    }
 
function loginUser() {
    var loginUsername = document.getElementById('loginUsername').value;
    var loginPassword = document.getElementById('loginPassword').value;
  
    // Placeholder: Send login request to the server
    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: loginUsername,
        password: loginPassword,
      }),
    })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert('User login successful! (Placeholder)');
        } else {
          alert('Invalid username or password. Please try again.');
        }
      })
      .catch(error => {
        console.error('Error during login:', error);
      });
  }
  
    // Perform more robust validation, e.g., check email format, password strength, etc.
    if (password !== confirmPassword) {
      alert('Password and Confirm Password do not match. Please try again.');
      return;
    }
  
    alert('User registration successful! ');
  }
 
function loginUser() {
  var loginUsername = document.getElementById('loginUsername').value;
  var loginPassword = document.getElementById('loginPassword').value;

  // Check if username and password fields are not empty
  if (loginUsername.trim() !== '' && loginPassword.trim() !== '') {
 
    alert('User login successful! ');
  } else {
    alert('Please enter your username and password.');
  }
}

  function downloadSoftware(softwareName) {
    alert('Downloading ' + softwareName + '... ');
  }
  
function populateSoftwareList(department) {
  const softwareData = getSoftwareDataForDepartment(department);

  const softwareListContainer = document.getElementById('software-list');
  const noSoftwareMessage = document.getElementById('noSoftwareMessage');

  softwareListContainer.innerHTML = '';

  if (softwareData.length > 0) {
    noSoftwareMessage.style.display = 'none';

    softwareData.forEach((software) => {
      const li = document.createElement('li');
      li.innerHTML = `${software.name} - Version ${software.version} 
        <button onclick="downloadSoftware('${software.name}')">Download</button>`;
      softwareListContainer.appendChild(li);
    });
  } else {
    noSoftwareMessage.style.display = 'block';
  }
}

function getSoftwareDataForDepartment(department) {
  const data = {
    computer_science: [
      { name: 'Software 1', version: '1.0' },
      { name: 'Software 2', version: '2.5' }
  
    ],
    electrical_engineering: [
      { name: 'Software 3', version: '3.0' },
      { name: 'Software 4', version: '4.2' }
  
    ]
  };

  return data[department] || [];
}
