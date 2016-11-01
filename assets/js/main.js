var granimInstance = new Granim({
    element: '#bg',
    name: 'basic-gradient',
    direction: 'left-right',
    opacity: [1, 1],
    isPausedWhenNotInView: true,
    states : {
        "default-state": {
            gradients: [
                ['#AA076B', '#61045F'],
                ['#cb4f21', '#9fc72e'],
                ['#DA22FF', '#9733EE']
            ]
        },
        "spotify-green": {
            gradients: [
                ['#02AAB0', '#00CDAC'],
                ['#00a4d7', '#00cd40']
            ],
            transitionSpeed: 2000
        },
    }
});
var snippet = document.getElementById("snippet");
var clipboard = new Clipboard('#snippet');
var updateInstructions = function(newMessage) {
  var instructions = document.getElementById('instructions');
  var text = document.createTextNode(newMessage);
  instructions.childNodes[0].remove();
  instructions.appendChild(text);
};
snippet.addEventListener('mouseenter', function(e) {
  updateInstructions("Just click the Code Block to Copy to Clipboard!");
})
clipboard.on('success', function(e) {
  granimInstance.changeState('spotify-green')
  updateInstructions("Copied!");
});
