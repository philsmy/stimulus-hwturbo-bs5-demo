import { Controller } from "stimulus";

export default class extends Controller {
  static values = {
    start: Number,
    refreshInterval: Number,
  };

  connect() {
    console.log("connected Timer controller");

    this.load();
  }

  load() {
    console.log(this.startValue);
    console.log(this.refreshIntervalValue);

    this.startDate = new Date(this.startValue);
    console.log(this.startDate);

    if (this.hasRefreshIntervalValue) {
      this.startRefreshing();
    }
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.drawTimer();
    }, this.refreshIntervalValue);
  }

  drawTimer() {
    this.element.innerHTML = this.secondsToTime((Date.now() - this.startValue)/1000);
  }

  secondsToTime(e) {
    var h = Math.floor(e / 3600)
        .toString()
        .padStart(2, "0"),
      m = Math.floor((e % 3600) / 60)
        .toString()
        .padStart(2, "0"),
      s = Math.floor(e % 60)
        .toString()
        .padStart(2, "0");

    return h + ":" + m + ":" + s;
  }
}
