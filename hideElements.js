
document.addEventListener('DOMContentLoaded', function() {

    console.log('loaded');

    const hideMe = [...document.querySelectorAll(".gsm-site-select-label, .site-select")];

    for (const hide of hideMe) {
        hide.style.display = 'none';
    }
});
