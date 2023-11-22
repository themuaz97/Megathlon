

//Function for hiding/showing pass in register page
function password_show_hide() {
  var x = document.getElementById("pass");
  var y = document.getElementById("pass2");
  var show_eye = document.getElementById("show_eye");
  var hide_eye = document.getElementById("hide_eye");
  hide_eye.classList.remove("d-none");
  if (x.type === "password" || y.type == "password") {
    x.type = "text";
    y.type = "text";
    show_eye.style.display = "none";
    hide_eye.style.display = "block";
  } else {
    x.type = "password"; 
    y.type = "password";  
    show_eye.style.display = "block";
    hide_eye.style.display = "none";
  }
}
//Function for hiding/showing pass in login page
function password_show_hide_Login() {
  var x = document.getElementById("pass");
  
  var show_eye = document.getElementById("show_eye");
  var hide_eye = document.getElementById("hide_eye");
  hide_eye.classList.remove("d-none");
  if (x.type === "password") {
    x.type = "text";
    show_eye.style.display = "none";
    hide_eye.style.display = "block";
  } else {
    x.type = "password"; 
    show_eye.style.display = "block";
    hide_eye.style.display = "none";
  }
}
//Checks for matching password
function matchPassword() {  
 var pw1 = document.getElementById('pass');
 var pw2 = document.getElementById('pass2');
  
  
  if(pw1.value.length ==0 || pw2.value.length == 0){
	  document.getElementById('message').style.color = 'blue';
    document.getElementById('message').innerHTML = 'Password box is empty';
  }
  else if (pw1.value == pw2.value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password matched';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password not the same';
  }
 
  
}
  
/*//Checks for input, enable submit button when all are filled

function mustHaveInput(){
	let inputs = document.querySelectorAll('input');
let buttonSend = document.getElementById('submitbtn');

let inputValidator = {
  "name": false,
  "email": false,
  "password": false,
  "pass2": false
}

inputs.forEach((input) => {
  input.addEventListener('input', () => {
    let name = Event.target.getAttribute('name');
    if (Event.target.value.length > 0) {
      inputValidator[name] = true;
    } else {
      inputValidator[name] = false;
    };

    let allTrue = Object.keys(inputValidator).every((item) => {
      return inputValidator[item] === true
    });

    if (allTrue) {
      buttonSend.disabled = false;
    } else {
      buttonSend.disabled = true;
    }
  })
})
}*/