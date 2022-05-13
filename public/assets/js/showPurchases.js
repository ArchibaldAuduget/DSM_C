const showBtn = document.getElementsByClassName('myaccount-show-btn')[0];
const hideBtn = document.getElementsByClassName('myaccount-hide-btn')[0];
const table = document.getElementsByClassName('purchase-table')[0];

showBtn.addEventListener('click', () => {
    hideBtn.classList.remove('hidden');
    table.classList.remove('hidden');
    showBtn.classList.add('hidden');
})

hideBtn.addEventListener('click', () => {
    showBtn.classList.remove('hidden');
    table.classList.add('hidden');
    hideBtn.classList.add('hidden');
})