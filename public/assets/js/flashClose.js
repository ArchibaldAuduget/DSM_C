const flashBtn = document.getElementsByClassName('flash-btn')[0];
const flashCtn = document.getElementsByClassName('flash-container')[0];

flashBtn.addEventListener('click', () => {
    flashCtn.classList.remove('d-flex', 'justify-content-between', 'msg_flash', 'alert', 'alert-danger', 'alert-warning', 'alert-info', 'alert-success');
    flashCtn.classList.add('closed');
})