import React from "react";
import ReactDOM from "react-dom";
import * as Sentry from '@sentry/browser';
import "./index.css";
import "semantic-ui-css/semantic.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";

Sentry.init({dsn: "https://7016974a134b4facafb2d30ec8e12491@sentry.io/1779538"});

ReactDOM.render(<App />, document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.register();
