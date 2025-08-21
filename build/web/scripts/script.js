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