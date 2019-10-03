import Dexie from "dexie";

export interface GpsLog {
  id?: number;
  startedAt?: Date;
  stoppedAt?: Date;
  logs?: Array<any>;
}

export class GpsLoggerDatabase extends Dexie {
  public gpslogs: Dexie.Table<GpsLog, number>;

  public constructor() {
    super("GpsLoggerDatabase");
    this.version(1).stores({
      gpslogs: "++id,startedAt,stoppedAt,log"
    });
    this.gpslogs = this.table("gpslogs");
  }
}
