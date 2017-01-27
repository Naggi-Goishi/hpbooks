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

