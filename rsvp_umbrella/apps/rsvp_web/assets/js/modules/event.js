import socket from "../socket";

export default class Event {
  constructor () {
    let idElem = document.querySelector('#id');
    if (!idElem) { return; }
    this.id = idElem.getAttribute('data-id');
    this.build();
  }

  build () {
    this.createChannel();
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
}
