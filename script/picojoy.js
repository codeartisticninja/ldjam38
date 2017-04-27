"use strict";
if (!Element.prototype.requestFullscreen) {
    Element.prototype.requestFullscreen = 
        Element.prototype["webkitRequestFullscreen"] || 
        Element.prototype["mozRequestFullScreen"] ||
        Element.prototype["msRequestFullscreen"];
}

(function(){
  var joy = window["joy"];
  var btns = window["pico8_buttons"] = [0];

  function init() {
    joy.mode = "gc";
    joy.UIparent = document.getElementById("canvasContainer");
    joy.enable();
    requestAnimationFrame(tick);
  }

  function tick() {
    joy.update();
    btns[0] =
    (Math.round(joy.dir.x) < 0 ? 1 : 0) +
    (Math.round(joy.dir.x) > 0 ? 2 : 0) +
    (Math.round(joy.dir.y) < 0 ? 4 : 0) +
    (Math.round(joy.dir.y) > 0 ? 8 : 0) +
    (           joy.fire       ? 32 : 0);
    requestAnimationFrame(tick);
  }

  init();
})();