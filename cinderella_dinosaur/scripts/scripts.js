$(document).ready(function () {
  new WOW().init();

  setInterval(function () {
    $("#doubleClickToEnter").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
      $("#doubleClickToEnter").removeClass("bounce");
    });
    $("#doubleClickToEnter").addClass("animated bounce");
  }, 5000);
  $("body").dblclick(function () {
    window.location.href = "secondpage.html";
  });
});
