import socket from "../socket";

export default class Event {
  constructor () {
    let idElem = document.querySelector('#id');
    if (!idElem) { return; }
    this.id = idElem.getAttribute('data-id');
    this.quantity = document.querySelector('[data-js="Event.Quantity"]')
    this.build();
  }

  build () {
    this.createChannel();
    this.observeChannel();
    this.joinChannel();
  }

  createChannel () {
    this.channel = socket.channel(`event:${this.id}`, {});
  }

  joinChannel () {
    this.channel.join()
    .receive("ok", resp => { console.log(`Joined successfully event: ${this.id}`, resp) })
    .receive("error", resp => { console.log(`Unable to join`, resp) });
  }

  observeChannel () {
    this.channel.on("update_quantity", event => {
      console.log(event);
      this.quantity.innerText = event.quantity;
    });
  }
}
