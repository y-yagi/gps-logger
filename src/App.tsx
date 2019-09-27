import React, { useState, useEffect } from "react";
import "./App.css";
import {
  Container,
  Divider,
  Icon,
  Header,
  Button,
  Message
} from "semantic-ui-react";

const App: React.FC = () => {
  const [latitude, setLatitude] = useState(0.0);
  const [longitude, setLongitude] = useState(0.0);
  const [watchID, setWatchID] = useState<number | undefined>(undefined);
  const [error, setError] = useState("");

  useEffect(() => {}, [latitude, longitude, error]);

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
        setWatchID(watch);
      } else {
        setError("Geolocation is not supported.");
      }
    }
  }

  function stopWatch(): void {
    if (watchID) {
      navigator.geolocation.clearWatch(watchID);
      setWatchID(undefined);
      setLatitude(0.0);
      setLongitude(0.0);
    }
  }

  function setCurrentPosition(position: Position) {
    setLatitude(position.coords.latitude);
    setLongitude(position.coords.longitude);
  }

  function positionError(error: PositionError) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        setError("User denied the request for Geolocation.");
        break;
      case error.POSITION_UNAVAILABLE:
        setError("Location information is unavailable.");
        break;
      case error.TIMEOUT:
        setError("The request to get user location timed out.");
        break;
    }
  }

  function startOrStopButtion() {
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
      <Message error={true}>Error: {error}</Message>
    </Container>
  );
};

export default App;
