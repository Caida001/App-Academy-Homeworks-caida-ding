document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "green";
  ctx.fillRect(0, 0, 900, 1500);

  ctx.beginPath();
  ctx.arc(300, 200, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "orange";
  ctx.lineWidth = 200;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();

});
