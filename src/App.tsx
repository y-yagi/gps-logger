import React, { useState, useEffect } from "react";
import { captureMessage } from "@sentry/browser";
import "./App.css";
import GpsLogger from "./gps_logger";
import { GpsLog } from "./db";
import generateKmlFile from "./kml";
import {
  Container,
  Divider,
  Icon,
  Header,
  Button,
  Table,
  Message
} from "semantic-ui-react";

const logger = new GpsLogger();

interface HistoryProps {
  counter: number;
}

const History: React.FC<HistoryProps> = props => {
  const [isNeedLoad, setIsNeedLoad] = useState(true);
  const [histories, setHistories] = useState<GpsLog[]>([]);

  useEffect(() => {
    (async () => {
      setHistories(await logger.histories());
      setIsNeedLoad(false);
    })();
  }, [isNeedLoad, props.counter]);

  function period(history: GpsLog): string {
    if (history.startedAt && history.stoppedAt) {
      return `${history.startedAt.toString()} ~ ${history.stoppedAt.toString()}`;
    } else {
      return "";
    }
  }

  function handleDownload(event: any, key: number): void {
    const content = generateKmlFile(histories[key]);
    const blob = new Blob([content], { type: "text/plain" });
    event.target.href = window.URL.createObjectURL(blob);
  }

  function handleDestroy(id: number | undefined): void {
    if (!id) {
      return;
    }

    (async () => {
      await logger.delete(id);
      setIsNeedLoad(true);
    })();
  }

  return (
    <Table celled>
      <Table.Header>
        <Table.Row>
          <Table.HeaderCell>id</Table.HeaderCell>
          <Table.HeaderCell>period</Table.HeaderCell>
          <Table.HeaderCell>action</Table.HeaderCell>
        </Table.Row>
      </Table.Header>
      <Table.Body>
        {Object.keys(histories).map(key => {
          var history = histories[Number(key)];
          return (
            <Table.Row key={key}>
              <Table.Cell width={2}>{history.id}</Table.Cell>
              <Table.Cell>{period(history)}</Table.Cell>
              <Table.Cell width={3}>
                <Button
                  color="blue"
                  as="a"
                  size="small"
                  href="#"
                  download="history.kml"
                  compact
                  onClick={e => handleDownload(e, Number(key))}
                >
                  Download
                </Button>
                <Button
                  color="red"
                  size="small"
                  compact
                  onClick={() => handleDestroy(history.id)}
                >
                  Destroy
                </Button>
              </Table.Cell>
            </Table.Row>
          );
        })}
      </Table.Body>
    </Table>
  );
};

const App: React.FC = () => {
  const [latitude, setLatitude] = useState(0.0);
  const [longitude, setLongitude] = useState(0.0);
  const [watchID, setWatchID] = useState<number | undefined>(undefined);
  const [error, setError] = useState("");
  const [counter, setCounter] = useState(0);

  useEffect(() => {}, [latitude, longitude, error]);
  logger.histories();

  function startWatch(): void {
    if (!watchID) {
      if (
        "geolocation" in navigator &&
        "watchPosition" in navigator.geolocation
      ) {
        let watch = navigator.geolocation.watchPosition(
          setCurrentPosition,
          positionError,
          {
            enableHighAccuracy: false,
            timeout: 15000,
            maximumAge: 0
          }
        );

        logger.start();
        setWatchID(watch);
      } else {
        setError("Geolocation is not supported.");
      }
    }
  }

  function stopWatch(): void {
    if (watchID) {
      logger.stop();
      navigator.geolocation.clearWatch(watchID);

      setWatchID(undefined);
      setLatitude(0.0);
      setLongitude(0.0);
      setCounter(counter + 1);
    }
  }

  function setCurrentPosition(position: Position): void {
    setLatitude(position.coords.latitude);
    setLongitude(position.coords.longitude);
    logger.record(position);
  }

  function positionError(error: PositionError): void {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        setError("User denied the request for Geolocation.");
        break;
      case error.POSITION_UNAVAILABLE:
        setError(`Location information is unavailable.`);
        captureMessage(`Position unavailable. detail: ${error.message}`);
        break;
      case error.TIMEOUT:
        setError("The request to get user location timed out.");
        captureMessage(`Timeout. detail: ${error.message}`);
        break;
    }
  }

  function startOrStopButtion(): JSX.Element {
    if (watchID) {
      return (
        <Button color="red" type="submit" onClick={() => stopWatch()}>
          Stop
        </Button>
      );
    } else {
      return (
        <Button color="blue" type="submit" onClick={() => startWatch()}>
          Start
        </Button>
      );
    }
  }

  function errorMessage(): JSX.Element {
    if (error !== "") {
      return <Message error={true}>Error: {error}</Message>;
    } else {
      return <span />;
    }
  }

  return (
    <Container className="main-container">
      <Header as="h2" icon textAlign="center" color="blue">
        <Icon name="map marker alternate" />
        <Header.Content>GPS Logger</Header.Content>
      </Header>
      <Divider hidden section />
      {startOrStopButtion()}
      <Message>
        latitude: {latitude}, longitude: {longitude}
      </Message>
      {errorMessage()}
      <Divider hidden section />
      <History counter={counter} />
    </Container>
  );
};

export default App;
