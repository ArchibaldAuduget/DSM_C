const about = document.getElementsByClassName('about')[0];
const aboutBtn = document.getElementsByClassName('about-btn')[0];
const aboutClose = document.getElementsByClassName('about-close')[0];
var count = false;

aboutBtn.addEventListener('click', () => {
    if (count == false) {
        about.classList.remove('hidden');
        count = true;
        console.log(count);
    } else {
        about.classList.add('hidden');
        count = false;
    }
})

aboutClose.addEventListener('click', () => {
    about.classList.add('hidden');
    count = false;
})