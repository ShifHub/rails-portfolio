import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';


// Connects to data-controller="sortable"
export default class extends Controller {
  
  set_positions() {
    const cards = document.getElementsByClassName('portfolio-card');
    Array.from(cards).forEach((card, i) => {
      card.dataset.pos = i + 1;
    })
  }

  connect() {
    this.set_positions();

    Sortable.create(this.element, {
      animation: 150,
      onUpdate: (evt) => {
        const cards = document.getElementsByClassName('portfolio-card');
        console.log(cards)
        this.set_positions();

        var order = []
        Array.from(cards).forEach((card, i) => {
          var id = card.dataset.id
          var position = card.dataset.pos
          order.push({ id, position });
        })

        console.log('Sending AJAX request')
        $.ajax({
          url: '/portfolios/sort',
          type: 'PUT',
          data: { order },
          success: function (response) {
            console.log('Succeeded')
          }
        });
      }
    });
  }
}


// $('.col').each(function (i) {
//   $(this).attr('data-pos', i + 1);
// });