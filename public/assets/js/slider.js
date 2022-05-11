let imgSlider = document.getElementsByClassName('img__slider');
let previous = document.getElementsByClassName('previous')[0];
let next = document.getElementsByClassName('next')[0];

let step = 0;
let nbImg = imgSlider.length;

function removeActive() {
    for(let i = 0; i < nbImg ; i++) {
        imgSlider[i].classList.remove('active');
    }
}

next.addEventListener('click', () => {
    step++;
    if(step >= nbImg) {
        step = 0;
    }
    removeActive();
    imgSlider[step].classList.add('active')
})

previous.addEventListener('click', () => {
    step--;
    if(step < 0) {
        step = nbImg - 1;
    }
    removeActive();
    imgSlider[step].classList.add('active');
})

setInterval(() => {
    step++;
    if(step >= nbImg) {
        step = 0;
    }
    removeActive();
    imgSlider[step].classList.add('active')
}, 4000)