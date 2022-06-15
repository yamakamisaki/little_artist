function pullDownMobile() {

  const mypageBtnMobile = document.getElementById("mypage__btn__mobile");
  const pullDown = document.getElementById("pull-down");

  mypageBtnMobile.addEventListener('mouseover', function() {
    if (pullDown.getAttribute("style") == "display:block;") {
        pullDown.removeAttribute("style", "display:block;");
    } else {
        pullDown.setAttribute("style", "display:block;");
    }
  });

};

window.addEventListener('load', pullDownMobile);