
// setInterval(callback, delay[, ...args])


class Clock {
  constructor() {
    let today = new Date();
    this.hours = today.getHours();
    this.minutes = today.getMinutes();
    this.seconds = today.getSeconds();
    this.printTime();
    window.setInterval(this._tick.bind(this), 1000);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    // Format the time in HH:MM:SS
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    // // 2. Call printTime.

    this.seconds += 1;
    if (this.seconds > 59) {
      this.seconds = 0;
      this.minutes += 1;
    }

    if (this.minutes > 59) {
      this.minutes = 0;
      this.hours += 1;
    }

    if (this.hours > 23) {
      this.hours = 0;
      this.minutes = 0;
      this.seconds = 0;
    }

    this.printTime();
  }
}

const clock = new Clock();
