let currentIndex = 0;
const totalSlides = 3;
const slideInterval = 5000;
let slideTimer;

function showSlide(index) {
    const mainCarousel = document.querySelector('.main-carousel');
    const imageSections = document.querySelectorAll('.carousel-item');

    if (index === totalSlides) {
        index = 0;
    } else if (index < 0) {
        index = totalSlides - 1;
    }

    mainCarousel.style.transition = 'transform 0.5s ease-in-out';
    mainCarousel.style.transform = `translateX(-${index * 100}%)`;

    currentIndex = index;
    updateIndicators();
}

function nextSlide() {
    showSlide(currentIndex + 1);
    resetSlideTimer();
}

function prevSlide() {
    showSlide(currentIndex - 1);
    resetSlideTimer();
}

function currentSlide(index) {
    showSlide(index);
    resetSlideTimer();
}

function resetSlideTimer() {
    clearInterval(slideTimer);
    slideTimer = setInterval(() => {
        nextSlide();
    }, slideInterval);
}

function updateIndicators() {
    const indicators = document.querySelectorAll('.carousel-indicator');
    indicators.forEach((indicator, index) => {
        if (index === currentIndex) {
            indicator.classList.add('active-indicator');
        } else {
            indicator.classList.remove('active-indicator');
        }
    });
}

// Start auto-slide
resetSlideTimer();