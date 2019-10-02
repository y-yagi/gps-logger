import { GpsLoggerDatabase } from "./db";

class GpsLogger {
  public logs: Array<any>
  public startedAt: Date | undefined
  public stoppedAt: Date | undefined
  private db: GpsLoggerDatabase

  public constructor() {
    this.logs = [];
    this.startedAt= undefined;
    this.stoppedAt= undefined;
    this.db = new GpsLoggerDatabase();
  }

  public start() {
    this.startedAt = new Date();
    this.stoppedAt = undefined;
    this.logs = [];
  }

  public stop() {
    this.stoppedAt = new Date();
    this.db.transaction('rw', this.db.gpslogs, async() => {
      this.db.gpslogs.add({startedAt: this.startedAt, stoppedAt: this.stoppedAt, logs: this.logs});
    });
  }

  public record(position: Position) {
    this.logs.push({ latitude: position.coords.latitude, longitude: position.coords.longitude });
  }

  public histories() {
    return this.db.gpslogs.orderBy("id").toArray();
  }

  public delete(id: number) {
    return this.db.gpslogs.delete(id);
  }
}

export default GpsLogger;
