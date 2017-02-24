window.onload = function() {
  const elements = document.querySelectorAll('.animation');

  elements.forEach(function(ele) {
    classList = ele.classList;

    if (classList.contains('feed_in_right')) {
      ele.classList.remove('feed_in_right');
    } else if (classList.contains('feed_in_left')) {
      ele.classList.remove('feed_in_left');
    }
  });
};

vex.defaultOptions.className = 'vex-theme-os';

function show_signup() {
  vex.dialog.open({
    message: 'Enter your email and password:',
    input: [
      '<input name="email" type="text" placeholder="email" required />',
      '<input name="password" type="password" placeholder="Password" required />'
    ].join(''),
    buttons: [
      Object.assign(vex.dialog.buttons.YES, { text: 'Sign up' }),
      vex.dialog.buttons.NO,
    ],
    callback: function(data) {
      if (data) {
        POST({ email: data.email, password: data.password });
      }
    }
  });
}

function POST(params) {
  var http = new XMLHttpRequest();
  var url = "sign_up";
  http.open("POST", url, true);
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  http.onreadystatechange = function() {
    if (http.readyState == 4 && http.status == 200) {
      alert(http.responseText);
    }
  };
  http.send(JSON.stringify(params));
}

