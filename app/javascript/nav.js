function pullDown() {

  const mypageBtn = document.getElementById("mypage__btn");
  const pullDown = document.getElementById("pull-down");

  mypageBtn.addEventListener('mouseover', function() {
    if (pullDown.getAttribute("style") == "display:block;") {
        pullDown.removeAttribute("style", "display:block;");
    } else {
        pullDown.setAttribute("style", "display:block;");
    }
  });

};

window.addEventListener('load', pullDown);