function changeImage(el) {
    document.getElementById("mainImage").src = el.src;
}

function toggleLike() {
    const icon = document.getElementById("likeIcon");
    icon.classList.toggle("bi-heart");
    icon.classList.toggle("bi-heart-fill");
}