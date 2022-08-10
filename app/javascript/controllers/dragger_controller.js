import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
    connect() {
        var nestedSortables = [].slice.call(document.querySelectorAll('.nested'));
        // Loop through each nested sortable element
        for (var i = 0; i < nestedSortables.length; i++) {
            new Sortable(nestedSortables[i], {
                group: 'nested',
                animation: 150,
                fallbackOnBody: true,
                swapThreshold: 0.65,
                onEnd: this.end.bind(this),
            });
        }
    }

    end(event) {
        let id = event.item.dataset.id
        let parent_node = event.item.closest('.nested')
        let data = new FormData()
        data.append("position", event.newIndex + 1)
        data.append("ancestry", parent_node.dataset.id)
        Rails.ajax({
            url: this.data.get("url").replace(":id", id),
            type: 'PATCH',
            data: data
        })
    }
}
