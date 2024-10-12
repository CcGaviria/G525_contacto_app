// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("turbo:load", () => {

    const contactFormContainer = document.getElementById('contact_form_container');

    if (contactFormContainer) { 
        const countrySelect = document.getElementById('country_select');
        const departmentSelect = document.getElementById('department_select');
        const citySelect = document.getElementById('city_select');
    
        countrySelect.addEventListener('change', function() {
        const countryId = this.value;
    
        departmentSelect.innerHTML = '';
        citySelect.innerHTML = '';
    
        departmentSelect.innerHTML = '<option value="">Selecciona un departamento</option>';
        citySelect.innerHTML = '<option value="">Selecciona una ciudad</option>';
    
        if (countryId) {
            fetch(`/countries/${countryId}/departments`)
            .then(response => response.json())
            .then(data => {
                data.forEach(department => {
                const option = document.createElement('option');
                option.value = department.id;
                option.textContent = department.name;
                departmentSelect.appendChild(option);
                });
            });
        }
        });
    
        departmentSelect.addEventListener('change', function() {
        const departmentId = this.value;
    
        citySelect.innerHTML = '';
        citySelect.innerHTML = '<option value="">Selecciona una ciudad</option>';
    
        if (departmentId) {
            fetch(`/departments/${departmentId}/cities`)
            .then(response => response.json())
            .then(data => {
                data.forEach(city => {
                const option = document.createElement('option');
                option.value = city.id;
                option.textContent = city.name;
                citySelect.appendChild(option);
                });
            });
        }
        });
    }

  });
  