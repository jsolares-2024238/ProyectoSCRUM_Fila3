    document.addEventListener("DOMContentLoaded", function() {
        const passInput = document.querySelector('input[name="txtPass"]');
        const toggle = document.createElement("span");
        toggle.className = "toggle-password";
        toggle.textContent = "👁️";
        const container = passInput.parentElement;
        container.classList.add("password-container");
        container.appendChild(toggle);

        toggle.addEventListener("click", () => {
            const type = passInput.getAttribute("type") === "password" ? "text" : "password";
            passInput.setAttribute("type", type);
        });
    });
    
    function showInfo(id) {
            document.querySelectorAll('.info-content').forEach(el => el.classList.remove('active'));
            document.getElementById(id).classList.add('active');
        }
        
    function showInfo(id) {
                document.querySelectorAll('.info-content').forEach(el => el.classList.remove('active'));
                const section = document.getElementById(id);
                section.classList.add('active');
                section.scrollIntoView({ behavior: "smooth", block: "start" });
    }
    
    function showInfo(id) {
            document.querySelectorAll('.info-content').forEach(el => el.classList.remove('active'));
            document.getElementById(id).classList.add('active');
    }
    
    /* CARRUSEL */
    
      const track = document.querySelector('.carousel-track');
      const cards = Array.from(track.children);
      const nextButton = document.querySelector('.next');
      const prevButton = document.querySelector('.prev');

      let index = 0;

      function updateCarousel() {
        const cardWidth = cards[0].getBoundingClientRect().width + 20; 
        track.style.transform = `translateX(-${index * cardWidth}px)`;
      }

      nextButton.addEventListener('click', () => {
        if (index < cards.length - 3) { // deja siempre 3 visibles
          index++;
          updateCarousel();
        }
      });

      prevButton.addEventListener('click', () => {
        if (index > 0) {
          index--;
          updateCarousel();
        }
      });
