const canvas = document.getElementById('gamecanvas');
const btn = document.getElementById('fullscreen-btn');
const loadingScreen = document.getElementById('loading-screen');

function resizeCanvas() 
{
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;
	canvas.style.transform = 1.5;
}

btn.addEventListener('click', resizeCanvas());
var Module = {
	onRuntimeInitialized: function()
	{
		console.log("Emscripten module initialized");
		loadingScreen.style.display = "none";
	},
	canvas: (function()
		{
			canvas.addEventListener("webglcontextlost", function(e) {
				alert('WebGL context lost. Reload the page.');
				e.preventDefault();
			}, false);
			return canvas;
		})()
};
