(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){"use strict";var Vector2=(function(){function Vector2(x,y){if(x===void 0){x=0;}
if(y===void 0){y=x;}
this.x=x;this.y=y;}
Object.defineProperty(Vector2.prototype,"magnitude",{get:function(){return Math.sqrt(Math.pow(this.x,2)+Math.pow(this.y,2));},set:function(mag){this.normalize();this.multiplyXY(mag);},enumerable:true,configurable:true});Vector2.prototype.set=function(x,y){if(y===void 0){y=x;}
this.x=x;this.y=y;return this;};Vector2.prototype.copyFrom=function(v){return this.set(v.x,v.y);};Vector2.prototype.copyTo=function(v){return v.set(this.x,this.y);};Vector2.prototype.addXY=function(x,y,result){if(y===void 0){y=x;}
if(result===void 0){result=this;}
result.x=this.x+x;result.y=this.y+y;return result;};Vector2.prototype.add=function(v,result){if(result===void 0){result=this;}
return this.addXY(v.x,v.y,result);};Vector2.prototype.subtractXY=function(x,y,result){if(y===void 0){y=x;}
if(result===void 0){result=this;}
return this.addXY(-x,-y,result);};Vector2.prototype.subtract=function(v,result){if(result===void 0){result=this;}
return this.subtractXY(v.x,v.y,result);};Vector2.prototype.multiplyXY=function(x,y,result){if(y===void 0){y=x;}
if(result===void 0){result=this;}
result.x=this.x*x;result.y=this.y*y;return result;};Vector2.prototype.multiply=function(v,result){if(result===void 0){result=this;}
return this.multiplyXY(v.x,v.y,result);};Vector2.prototype.normalize=function(result){if(result===void 0){result=this;}
if(this.x===0&&this.y===0){result.x=0;result.y=-1;}
else{var l=this.magnitude;this.multiplyXY(1/l,undefined,result);}
return result;};return Vector2;}());module.exports=Vector2;},{}],2:[function(require,module,exports){"use strict";var Vector2=require("./Vector2");var joypad;(function(joypad){joypad.enabled=false,joypad.device=localStorage.getItem("joypad.device"),joypad.UIparent=document.body,joypad.dir=new Vector2(),joypad.fire=false,joypad.delta={dir:0,fire:0};function enable(devices,autoUpdate){if(devices===void 0){devices=["keyboard","touch","gamepad"];}
if(autoUpdate===void 0){autoUpdate=false;}
if(_suspended!=null){for(var _i=0,devices_1=devices;_i<devices_1.length;_i++){var device=devices_1[_i];if(_suspended.indexOf(device)===-1){_suspended.push(device);}}
return;}
for(var _a=0,devices_2=devices;_a<devices_2.length;_a++){var device=devices_2[_a];switch(device){case"keyboard":if(!_keyboardEnabled){document.body.addEventListener("keydown",_onKeyDown);document.body.addEventListener("keyup",_onKeyUp);_keysDown={};}
_keyboardEnabled=true;break;case"touch":if(!_touchEnabled){document.body.addEventListener("touchstart",_showUI);document.body.addEventListener("touchmove",_onTouchMove);document.body.addEventListener("touchend",_onTouchUp);if(joypad.device==="touch")
_showUI();_leftThumb=_createJoyTouch();_rightThumb=_createJoyTouch();}
_touchEnabled=true;break;case"gamepad":_gamepadEnabled=true;}}
if(autoUpdate){return joypad.autoUpdate();}}
joypad.enable=enable;function disable(devices){if(devices===void 0){devices=["keyboard","touch","gamepad"];}
if(_suspended!=null){for(var _i=0,devices_3=devices;_i<devices_3.length;_i++){var device=devices_3[_i];var i=_suspended.indexOf(device);if(i!==-1){_suspended.splice(i,1);}}
return;}
for(var _a=0,devices_4=devices;_a<devices_4.length;_a++){var device=devices_4[_a];switch(device){case"keyboard":if(_keyboardEnabled){document.body.removeEventListener("keydown",_onKeyDown);document.body.removeEventListener("keyup",_onKeyUp);}
_keyboardEnabled=false;break;case"touch":if(_touchEnabled){document.body.removeEventListener("touchstart",_showUI);document.body.removeEventListener("touchmove",_onTouchMove);document.body.removeEventListener("touchend",_onTouchUp);}
_hideUI();_touchEnabled=false;break;case"gamepad":_gamepadEnabled=false;}}
cancelAnimationFrame(_updateTO);joypad.dir.set(0);joypad.fire=false;}
joypad.disable=disable;function suspend(){if(_suspended!=null){return;}
var devices=[];if(_keyboardEnabled){devices.push("keyboard");}
if(_touchEnabled){devices.push("touch");}
if(_gamepadEnabled){devices.push("gamepad");}
joypad.disable(devices);return _suspended=devices;}
joypad.suspend=suspend;function resume(){if(_suspended==null){return;}
var devices=_suspended;_suspended=null;joypad.enable(devices);}
joypad.resume=resume;function update(){cancelAnimationFrame(_updateTO);joypad.dir.set(0);joypad.fire=false;if(_keyboardEnabled){_scanKeys();}
if(_touchEnabled){_scanTouches();}
if(_gamepadEnabled){_scanGamepad();}
_updateUI();for(var key in joypad.delta){if(joypad[key]instanceof Vector2){if(!(joypad.delta[key]instanceof Vector2))
joypad.delta[key]=new Vector2();if(!(_lastState[key]instanceof Vector2))
_lastState[key]=new Vector2();joypad[key].subtract(_lastState[key],joypad.delta[key]);_lastState[key].copyFrom(joypad[key]);}
else{joypad.delta[key]=joypad[key]-_lastState[key];_lastState[key]=joypad[key];}}}
joypad.update=update;function autoUpdate(){joypad.update();return _updateTO=requestAnimationFrame(joypad.autoUpdate);}
joypad.autoUpdate=autoUpdate;var _keyboardEnabled,_keyMap=_getKeyMap(),_keysDown={},_shiftKey,_;function _scanKeys(){if(joypad.device!=="keyboard")
return;if(_keysDown["left"])
joypad.dir.x=-1;if(_keysDown["right"])
joypad.dir.x=1;if(_keysDown["up"])
joypad.dir.y=-1;if(_keysDown["down"])
joypad.dir.y=1;if(_keysDown["fire"])
joypad.fire=true;if(joypad.dir.magnitude)
joypad.dir.magnitude=_shiftKey?.45:1;}
function _getKeyMap(){var map=[],ctrls={"left":[37,65],"right":[39,68],"up":[38,87,80],"down":[40,83,76],"fire":[88,69,79,32,90,81,75,13]};for(var ctrl in ctrls){var keys=ctrls[ctrl];for(var _i=0,keys_1=keys;_i<keys_1.length;_i++){var key=keys_1[_i];map[key]=ctrl;}}
return map;}
function _onKeyDown(e){if(e.altKey||e.ctrlKey||e.metaKey)
return;var ctrl=_keyMap[e.keyCode];_shiftKey=e.shiftKey;localStorage.setItem("joypad.device",joypad.device="keyboard");if(ctrl){switch(ctrl){case"left":case"right":_keysDown["left"]=_keysDown["right"]=false;break;case"up":case"down":_keysDown["up"]=_keysDown["down"]=false;}
_keysDown[ctrl]=true;e.preventDefault();}
else{console.log("keyCode:",e.keyCode,e);}}
function _onKeyUp(e){var ctrl=_keyMap[e.keyCode];_shiftKey=e.shiftKey;if(ctrl){_keysDown[ctrl]=false;}
switch(e.keyCode){case 68:_keyMap[83]="down";break;case 76:_keyMap[83]="right";}}
var _touchEnabled,_touchUI,_leftThumb,_rightThumb,_stickRadius=32,_;function _scanTouches(){if(joypad.device!=="touch")
return;if(joypad.mode==="rc"){joypad.dir.x=_leftThumb.dir.x;joypad.dir.y=_rightThumb.dir.y;}
else if(joypad.mode==="gc"){joypad.dir.copyFrom(_leftThumb.dir);joypad.fire=_rightThumb.btn;}
else{joypad.dir.add(_leftThumb.dir);joypad.dir.add(_rightThumb.dir);if(joypad.dir.magnitude>_stickRadius){joypad.dir.magnitude=_stickRadius;}}
joypad.dir.multiplyXY(1/_stickRadius);if(_rightThumb.btn&&_rightThumb.id==null){_rightThumb.btn=false;joypad.fire=true;}}
function _onTouchDown(e){if(!_touchEnabled){_hideUI();return;}
var leftPad=_touchUI.querySelector(".left");var rightPad=_touchUI.querySelector(".right");for(var j=0;j<e.changedTouches.length;j++){var touchEvent=e.changedTouches[j];var touch;if(leftPad===touchEvent.target||leftPad.contains(touchEvent.target)){touch=_leftThumb;_touchUI.classList.remove("inactive");}
if(rightPad===touchEvent.target||rightPad.contains(touchEvent.target)){touch=_rightThumb;_touchUI.classList.remove("inactive");}
if(touch){touch.id=touchEvent.identifier;touch.center.set(touchEvent.screenX,touchEvent.screenY);touch.dir.set(0);touch.btn=true;}}
e.preventDefault();}
function _onTouchMove(e){for(var j=0;j<e.changedTouches.length;j++){var touchEvent=e.changedTouches[j];var touch;if(_leftThumb.id===touchEvent.identifier)
touch=_leftThumb;if(_rightThumb.id===touchEvent.identifier)
touch=_rightThumb;if(touch){touch.dir.set(touchEvent.screenX,touchEvent.screenY);touch.dir.subtract(touch.center);if(touch.dir.magnitude>_stickRadius/3){touch.btn=false;if(touch.dir.magnitude>_stickRadius){touch.dir.magnitude-=_stickRadius;touch.center.add(touch.dir);touch.dir.magnitude=_stickRadius;}}
e.preventDefault();}}}
function _onTouchUp(e){if(_leftThumb.id==null&&_rightThumb.id==null){_touchUI.classList.add("inactive");}
for(var j=0;j<e.changedTouches.length;j++){var touchEvent=e.changedTouches[j];var touch;if(_leftThumb.id===touchEvent.identifier)
touch=_leftThumb;if(_rightThumb.id===touchEvent.identifier)
touch=_rightThumb;if(touch){touch.id=null;touch.dir.set(0);}}}
function _showUI(){localStorage.setItem("joypad.device",joypad.device="touch");if(!_touchUI){_touchUI=document.createElement("div");_touchUI.id="webJoypad";_touchUI.classList.add("hidden");_touchUI.classList.add("inactive");_touchUI.innerHTML="\n        <div class=\"left\">\n          <div class=\"slider\">\n            <div class=\"knob\"></div>\n          </div>\n        </div><div class=\"right\">\n          <div class=\"fire\"></div>\n          <div class=\"slider\">\n            <div class=\"knob\"></div>\n          </div>\n        </div>";joypad.UIparent.appendChild(_touchUI);var leftPad=_touchUI.querySelector(".left");var rightPad=_touchUI.querySelector(".right");leftPad.addEventListener("touchstart",_onTouchDown);rightPad.addEventListener("touchstart",_onTouchDown);}
setTimeout(function(){_touchUI.classList.remove("hidden");},50);if(joypad.mode==="rc"){_touchUI.classList.add("rc");_touchUI.classList.remove("gc");}
else if(joypad.mode==="gc"){_touchUI.classList.remove("rc");_touchUI.classList.add("gc");}
else{_touchUI.classList.remove("rc");_touchUI.classList.remove("gc");}}
function _hideUI(){if(!_touchUI)
return;_touchUI.classList.add("hidden");_touchUI.classList.add("inactive");var leftKnob=_touchUI.querySelector(".left  .knob");var rightKnob=_touchUI.querySelector(".right .knob");leftKnob.removeAttribute("style");rightKnob.removeAttribute("style");}
function _updateUI(){if(!_touchUI)
return;var leftKnob=_touchUI.querySelector(".left  .knob");var rightKnob=_touchUI.querySelector(".right .knob");var fireBtn=_touchUI.querySelector(".fire");if(joypad.mode==="rc"){leftKnob.style.left=(1+joypad.dir.x)+"em";rightKnob.style.top=(1+joypad.dir.y)+"em";}
else{leftKnob.style.left=(1+joypad.dir.x)+"em";leftKnob.style.top=(1+joypad.dir.y)+"em";if(joypad.mode!=="gc"){rightKnob.style.left=(1+joypad.dir.x)+"em";rightKnob.style.top=(1+joypad.dir.y)+"em";}}
if(_rightThumb.btn){fireBtn.classList.add("pending");}
else{fireBtn.classList.remove("pending");}
if(joypad.fire){fireBtn.classList.add("pressed");}
else{fireBtn.classList.remove("pressed");}}
function _createJoyTouch(){return{id:null,btn:false,center:new Vector2(),dir:new Vector2()};}
var _gamepadEnabled,_activatingGamepad,_goingBack=0,_;function _scanGamepad(){var gamepad=navigator.getGamepads!=null?navigator.getGamepads()[0]:null;if(!gamepad)
return;var btn=[];for(var _i=0,_a=gamepad.buttons;_i<_a.length;_i++){var b=_a[_i];btn.push(b.pressed);}
if(btn[0])
_activatingGamepad=true;if(_activatingGamepad&&!btn[0]){localStorage.setItem("joypad.device",joypad.device="gamepad");_activatingGamepad=false;}
if(joypad.device!=="gamepad")
return;joypad.dir.x=gamepad.axes[0]||0;if(joypad.mode==="rc"){joypad.dir.y=gamepad.axes[3]||0;}
else{joypad.dir.y=gamepad.axes[1]||0;}
if(joypad.mode="gc"){joypad.fire=btn[0]||btn[1]||btn[2]||btn[3];}
else{joypad.fire=btn[0]||btn[2];if(btn[1])
joypad.dir.y=-1;if(btn[3])
joypad.dir.y=1;}
if(btn[12])
joypad.dir.y=-1;if(btn[13])
joypad.dir.y=1;if(btn[14])
joypad.dir.x=-1;if(btn[15])
joypad.dir.x=1;if(joypad.dir.magnitude<.2)
joypad.dir.set(0);if(joypad.dir.magnitude>1)
joypad.dir.magnitude=1;if(btn[8]){_goingBack--;if(_goingBack===0)
history.back();}
else{_goingBack=1;}
if(btn[9]){var el=document.querySelector(":focus");if(el){el.click();el.blur();}}}
var _updateTO,_lastState={},_suspended,_;})(joypad||(joypad={}));module.exports=joypad;},{"./Vector2":1}],3:[function(require,module,exports){"use strict";Object.defineProperty(exports,"__esModule",{value:true});var webJoypad=require("./_classes/lib/WebStory/Game/webJoypad");window["joy"]=webJoypad;},{"./_classes/lib/WebStory/Game/webJoypad":2}]},{},[3])