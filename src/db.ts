import Dexie from 'dexie';

interface GpsLog {
  id?: number;
  started_at?: Date;
  stopped_at?: Date;
  logs?: Array<any>;
}

class GpsLoggerDatabase extends Dexie {
  public gpslogs: Dexie.Table<GpsLog, number>;

  public constructor() {
    super("GpsLoggerDatabase");
    this.version(1).stores({
      gpslogs: "++id,started_at,stopped_at,log"
    });
    this.gpslogs = this.table("gpslogs");
  }
}

export default GpsLoggerDatabase;
