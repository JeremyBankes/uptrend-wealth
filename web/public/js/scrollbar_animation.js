window.addEventListener('load', function() {
    let scrollbar = document.querySelector('.scrollbar-progress');

    window.addEventListener('scroll', function(e) {
        let currHeight = window.pageYOffset;
        let bodyHeight = document.body.clientHeight - window.innerHeight;
        let newWidth = (currHeight/bodyHeight) * 100;
        scrollbar.style.width = newWidth + '%';
    });
});
