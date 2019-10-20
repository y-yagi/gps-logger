import { GpsLoggerDatabase, GpsLog } from "./db";

class GpsLogger {
  public logs: Array<any>;
  public startedAt: Date | undefined;
  public stoppedAt: Date | undefined;
  private db: GpsLoggerDatabase;

  public constructor() {
    this.logs = [];
    this.startedAt = undefined;
    this.stoppedAt = undefined;
    this.db = new GpsLoggerDatabase();
  }

  public start(): void {
    this.startedAt = new Date();
    this.stoppedAt = undefined;
    this.logs = [];
  }

  public stop(): void {
    this.stoppedAt = new Date();
    this.db.transaction("rw", this.db.gpslogs, async () => {
      this.db.gpslogs.add({
        startedAt: this.startedAt,
        stoppedAt: this.stoppedAt,
        logs: this.logs
      });
    });
  }

  public record(position: Position): void {
    if (this.logs.length === 0) {
      this.logs.push({
        latitude: position.coords.latitude,
        longitude: position.coords.longitude
      });

      return;
    }

    var last = this.logs[this.logs.length - 1];
    if (
      last.latitude !== position.coords.latitude ||
      last.longitude !== position.coords.longitude
    ) {
      this.logs.push({
        latitude: position.coords.latitude,
        longitude: position.coords.longitude
      });
    }
  }

  public histories(): Promise<GpsLog[]> {
    return this.db.gpslogs.orderBy("id").toArray();
  }

  public delete(id: number): Promise<void> {
    return this.db.gpslogs.delete(id);
  }
}

export default GpsLogger;
