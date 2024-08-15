import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  static targets = ["price", "emojiprice", "calendar"]
  connect() {
    let price = this.emojipriceTarget.innerText
    let priceInteger = parseFloat(price)
    let priceDiv = this.priceTarget

    flatpickr(this.calendarTarget, {
      locale: {
        firstDayOfWeek: 1,
        weekdays: {
          shorthand: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
          longhand: [
            "Dimanche",
            "Lundi",
            "Mardi",
            "Mercredi",
            "Jeudi",
            "Vendredi",
            "Samedi",
          ],
        },
        months: {
          shorthand: [
            "Jan",
            "Fév",
            "Mar",
            "Avr",
            "Mai",
            "Juin",
            "Juil",
            "Août",
            "Sep",
            "Oct",
            "Nov",
            "Déc",
          ],
          longhand: [
            "Janvier",
            "Février",
            "Mars",
            "Avril",
            "Mai",
            "Juin",
            "Juillet",
            "Août",
            "Septembre",
            "Octobre",
            "Novembre",
            "Décembre",
          ],
        },
      },
      mode: "range",
      minDate: "today",
      maxDate: new Date().fp_incr(365),
      onChange: function (selectedDates, dateStr, instance) {
        /* console.log(dateStr) */
        /* console.log(selectedDates) */
        /* console.log(instance) */
        let startDate = new Date(dateStr.split(" to ")[0]);
        let endDate = new Date(dateStr.split(" to ")[1]);
        let duration = (endDate - startDate) / ((1000 * 60 * 60 * 24))
        let totalPrice = priceInteger * duration
        console.log(totalPrice)
        if (totalPrice > 0) {
          priceDiv.innerHTML = `<p data-datepicker-target="price" class="form-inputs font-size">Total : ${totalPrice.toFixed(2).replace(/\.0+$/, '')}€ </p>`
        }
      },
    });

  }
}
