[1mdiff --git a/package.json b/package.json[m
[1mindex 7e1404b..942f6ad 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -10,6 +10,8 @@[m
     "react": "^16.10.0",[m
     "react-dom": "^16.10.0",[m
     "react-scripts": "3.1.2",[m
[32m+[m[32m    "semantic-ui-css": "^2.4.1",[m
[32m+[m[32m    "semantic-ui-react": "^0.88.1",[m
     "typescript": "3.6.3"[m
   },[m
   "devDependencies": {[m
[1mdiff --git a/src/App.css b/src/App.css[m
[1mindex afc3885..e69de29 100644[m
[1m--- a/src/App.css[m
[1m+++ b/src/App.css[m
[36m@@ -1,22 +0,0 @@[m
[31m-.App {[m
[31m-  text-align: center;[m
[31m-}[m
[31m-[m
[31m-.App-logo {[m
[31m-  height: 40vmin;[m
[31m-}[m
[31m-[m
[31m-.App-header {[m
[31m-  background-color: #282c34;[m
[31m-  min-height: 100vh;[m
[31m-  display: flex;[m
[31m-  flex-direction: column;[m
[31m-  align-items: center;[m
[31m-  justify-content: center;[m
[31m-  font-size: calc(10px + 2vmin);[m
[31m-  color: white;[m
[31m-}[m
[31m-[m
[31m-.App-link {[m
[31m-  color: #09d3ac;[m
[31m-}[m
[1mdiff --git a/src/App.tsx b/src/App.tsx[m
[1mindex a6aaeeb..01b4b69 100644[m
[1m--- a/src/App.tsx[m
[1m+++ b/src/App.tsx[m
[36m@@ -1,14 +1,23 @@[m
 import React, { useState, useEffect } from "react";[m
 import logo from "./logo.svg";[m
[31m-import "./App.css";[m
[32m+[m[32mimport {[m
[32m+[m[32m  Container,[m
[32m+[m[32m  Confirm,[m
[32m+[m[32m  Divider,[m
[32m+[m[32m  Icon,[m
[32m+[m[32m  Dimmer,[m
[32m+[m[32m  Loader,[m
[32m+[m[32m  Header,[m
[32m+[m[32m  Button,[m
[32m+[m[32m  Segment[m
[32m+[m[32m} from "semantic-ui-react";[m
 [m
 const App: React.FC = () => {[m
   const [latitude, setLatitude] = useState(0.0);[m
   const [longitude, setLongitude] = useState(0.0);[m
[32m+[m[32m  const [watchID, setWatchID] = useState<number | undefined>(undefined)[m
   const [error, setError] = useState("");[m
 [m
[31m-  let watchID = undefined;[m
[31m-[m
   useEffect(() => {}, [latitude, longitude, error]);[m
 [m
   function startWatch(): void {[m
[36m@@ -17,7 +26,7 @@[m [mconst App: React.FC = () => {[m
         "geolocation" in navigator &&[m
         "watchPosition" in navigator.geolocation[m
       ) {[m
[31m-        watchID = navigator.geolocation.watchPosition([m
[32m+[m[32m        let watch = navigator.geolocation.watchPosition([m
           setCurrentPosition,[m
           positionError,[m
           {[m
[36m@@ -26,6 +35,7 @@[m [mconst App: React.FC = () => {[m
             maximumAge: 0[m
           }[m
         );[m
[32m+[m[32m        setWatchID(watch)[m
       } else {[m
         setError("Geolocation is not supported.");[m
       }[m
[36m@@ -33,8 +43,10 @@[m [mconst App: React.FC = () => {[m
   }[m
 [m
   function stopWatch(): void {[m
[31m-    navigator.geolocation.clearWatch(watchID);[m
[31m-    geoWatch = undefined;[m
[32m+[m[32m    if (watchID) {[m
[32m+[m[32m      navigator.geolocation.clearWatch(watchID);[m
[32m+[m[32m      setWatchID(undefined)[m
[32m+[m[32m    }[m
   }[m
 [m
   function setCurrentPosition(position: Position) {[m
[1mdiff --git a/yarn.lock b/yarn.lock[m
[1mindex dd8301a..df5945e 100644[m
[1m--- a/yarn.lock[m
[1m+++ b/yarn.lock[m
[36m@@ -902,7 +902,7 @@[m
   dependencies:[m
     regenerator-runtime "^0.13.2"[m
 [m
[31m-"@babel/runtime@^7.0.0", "@babel/runtime@^7.3.4", "@babel/runtime@^7.4.2", "@babel/runtime@^7.4.5":[m
[32m+[m[32m"@babel/runtime@^7.0.0", "@babel/runtime@^7.1.2", "@babel/runtime@^7.3.4", "@babel/runtime@^7.4.2", "@babel/runtime@^7.4.5":[m
   version "7.6.2"[m
   resolved "https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.6.2.tgz#c3d6e41b304ef10dcf13777a33e7694ec4a9a6dd"[m
   integrity sha512-EXxN64agfUqqIGeEjI5dL5z0Sw0ZwWo1mLTi4mQowCZ42O59b7DRpZAnTC6OqdF28wMBMFKNb/4uFGrVaigSpg==[m
[36m@@ -1186,6 +1186,31 @@[m
   resolved "https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-1.1.3.tgz#2b5a3ab3f918cca48a8c754c08168e3f03eba61b"[m
   integrity sha512-shAmDyaQC4H92APFoIaVDHCx5bStIocgvbwQyxPRrbUY20V1EYTbSDchWbuwlMG3V17cprZhA6+78JfB+3DTPw==[m
 [m
[32m+[m[32m"@semantic-ui-react/event-stack@^3.1.0":[m
[32m+[m[32m  version "3.1.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/@semantic-ui-react/event-stack/-/event-stack-3.1.0.tgz#aadbe4a28b0dd7703c5f451640d0fefe66dd9208"[m
[32m+[m[32m  integrity sha512-WHtU9wutZByZtFZxzj4BVEk+rvWldZpZhRcyv6d84+XLSolm83zLHYJLTACGuSl6Xa/xpgVXquvm9GyMudkJYg==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    exenv "^1.2.2"[m
[32m+[m[32m    prop-types "^15.6.2"[m
[32m+[m
[32m+[m[32m"@stardust-ui/react-component-event-listener@~0.38.0":[m
[32m+[m[32m  version "0.38.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/@stardust-ui/react-component-event-listener/-/react-component-event-listener-0.38.0.tgz#1787faded94b40ad41226e6289baf13e701c6e7f"[m
[32m+[m[32m  integrity sha512-sIP/e0dyOrrlb8K7KWumfMxj/gAifswTBC4o68Aa+C/GA73ccRp/6W1VlHvF/dlOR4KLsA+5SKnhjH36xzPsWg==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@babel/runtime" "^7.1.2"[m
[32m+[m[32m    prop-types "^15.7.2"[m
[32m+[m
[32m+[m[32m"@stardust-ui/react-component-ref@~0.38.0":[m
[32m+[m[32m  version "0.38.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/@stardust-ui/react-component-ref/-/react-component-ref-0.38.0.tgz#52d555f2d5edd213c923c93a106f7de940e427ef"[m
[32m+[m[32m  integrity sha512-xjs6WnvJVueSIXMWw0C3oWIgAPpcD03qw43oGOjUXqFktvpNkB73JoKIhS4sCrtQxBdct75qqr4ZL6JiyPcESw==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@babel/runtime" "^7.1.2"[m
[32m+[m[32m    prop-types "^15.7.2"[m
[32m+[m[32m    react-is "^16.6.3"[m
[32m+[m
 "@svgr/babel-plugin-add-jsx-attribute@^4.2.0":[m
   version "4.2.0"[m
   resolved "https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-4.2.0.tgz#dadcb6218503532d6884b210e7f3c502caaa44b1"[m
[36m@@ -2615,6 +2640,11 @@[m [mclass-utils@^0.3.5:[m
     isobject "^3.0.0"[m
     static-extend "^0.1.1"[m
 [m
[32m+[m[32mclassnames@^2.2.6:[m
[32m+[m[32m  version "2.2.6"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/classnames/-/classnames-2.2.6.tgz#43935bffdd291f326dad0a205309b38d00f650ce"[m
[32m+[m[32m  integrity sha512-JR/iSQOSt+LQIWwrwEzJ9uk0xfN3mTVYMwt1Ir5mUcSN6pU+V4zQFFaJsclJbPuAUQH+yfWef6tm7l1quW3C8Q==[m
[32m+[m
 clean-css@4.2.x:[m
   version "4.2.1"[m
   resolved "https://registry.yarnpkg.com/clean-css/-/clean-css-4.2.1.tgz#2d411ef76b8569b6d0c84068dabe85b0aa5e5c17"[m
[36m@@ -2977,6 +3007,14 @@[m [mcreate-hmac@^1.1.0, create-hmac@^1.1.2, create-hmac@^1.1.4:[m
     safe-buffer "^5.0.1"[m
     sha.js "^2.4.8"[m
 [m
[32m+[m[32mcreate-react-context@^0.3.0:[m
[32m+[m[32m  version "0.3.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/create-react-context/-/create-react-context-0.3.0.tgz#546dede9dc422def0d3fc2fe03afe0bc0f4f7d8c"[m
[32m+[m[32m  integrity sha512-dNldIoSuNSvlTJ7slIKC/ZFGKexBMBrrcc+TTe1NdmROnaASuLPvqpwj9v4XS4uXZ8+YPu0sNmShX2rXI5LNsw==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    gud "^1.0.0"[m
[32m+[m[32m    warning "^4.0.3"[m
[32m+[m
 cross-spawn@6.0.5, cross-spawn@^6.0.0, cross-spawn@^6.0.5:[m
   version "6.0.5"[m
   resolved "https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.5.tgz#4a5ec7c64dfae22c3a14124dbacdee846d80cbc4"[m
[36m@@ -4019,6 +4057,11 @@[m [mexeca@^1.0.0:[m
     signal-exit "^3.0.0"[m
     strip-eof "^1.0.0"[m
 [m
[32m+[m[32mexenv@^1.2.2:[m
[32m+[m[32m  version "1.2.2"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/exenv/-/exenv-1.2.2.tgz#2ae78e85d9894158670b03d47bec1f03bd91bb9d"[m
[32m+[m[32m  integrity sha1-KueOhdmJQVhnCwPUe+wfA72Ru50=[m
[32m+[m
 exit@^0.1.2:[m
   version "0.1.2"[m
   resolved "https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz#0632638f8d877cc82107d30a0fff1a17cba1cd0c"[m
[36m@@ -4604,6 +4647,11 @@[m [mgrowly@^1.3.0:[m
   resolved "https://registry.yarnpkg.com/growly/-/growly-1.3.0.tgz#f10748cbe76af964b7c96c93c6bcc28af120c081"[m
   integrity sha1-8QdIy+dq+WS3yWyTxrzCivEgwIE=[m
 [m
[32m+[m[32mgud@^1.0.0:[m
[32m+[m[32m  version "1.0.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/gud/-/gud-1.0.0.tgz#a489581b17e6a70beca9abe3ae57de7a499852c0"[m
[32m+[m[32m  integrity sha512-zGEOVKFM5sVPPrYs7J5/hYEw2Pof8KCyOwyhG8sAF26mCAeUFAcYPu1mwB7hhpIP29zOIBaDqwuHdLp0jvZXjw==[m
[32m+[m
 gzip-size@5.1.1:[m
   version "5.1.1"[m
   resolved "https://registry.yarnpkg.com/gzip-size/-/gzip-size-5.1.1.tgz#cb9bee692f87c0612b232840a873904e4c135274"[m
[36m@@ -5805,6 +5853,11 @@[m [mjest@24.9.0:[m
     import-local "^2.0.0"[m
     jest-cli "^24.9.0"[m
 [m
[32m+[m[32mjquery@x.*:[m
[32m+[m[32m  version "3.4.1"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/jquery/-/jquery-3.4.1.tgz#714f1f8d9dde4bdfa55764ba37ef214630d80ef2"[m
[32m+[m[32m  integrity sha512-36+AdBzCL+y6qjw5Tx7HgzeGCzC81MDDgaUP8ld2zhx58HdqXGoBd+tHdrBMiyjGQs0Hxs/MLZTu/eHNJJuWPw==[m
[32m+[m
 js-levenshtein@^1.1.3:[m
   version "1.1.6"[m
   resolved "https://registry.yarnpkg.com/js-levenshtein/-/js-levenshtein-1.1.6.tgz#c6cee58eb3550372df8deb85fad5ce66ce01d59d"[m
[36m@@ -5996,6 +6049,11 @@[m [mjsx-ast-utils@^2.1.0, jsx-ast-utils@^2.2.1:[m
     array-includes "^3.0.3"[m
     object.assign "^4.1.0"[m
 [m
[32m+[m[32mkeyboard-key@^1.0.4:[m
[32m+[m[32m  version "1.0.4"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/keyboard-key/-/keyboard-key-1.0.4.tgz#52d8fa07b7e17757072aa22a67fb4ae85e4c46b0"[m
[32m+[m[32m  integrity sha512-my04dE6BCwPpwoe4KYKfPxWiwgDYQOHrVmtzn1CfzmoEsGG/ef4oZGaXCzi1+iFhG7CN5JkOuxmei5OABY8/ag==[m
[32m+[m
 killable@^1.0.0:[m
   version "1.0.1"[m
   resolved "https://registry.yarnpkg.com/killable/-/killable-1.0.1.tgz#4c8ce441187a061c7474fb87ca08e2a638194892"[m
[36m@@ -7292,6 +7350,11 @@[m [mpnp-webpack-plugin@1.5.0:[m
   dependencies:[m
     ts-pnp "^1.1.2"[m
 [m
[32m+[m[32mpopper.js@^1.14.4:[m
[32m+[m[32m  version "1.15.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/popper.js/-/popper.js-1.15.0.tgz#5560b99bbad7647e9faa475c6b8056621f5a4ff2"[m
[32m+[m[32m  integrity sha512-w010cY1oCUmI+9KwwlWki+r5jxKfTFDVoadl7MSrIujHU5MJ5OR6HTDj6Xo8aoR/QsA56x8jKjA59qGH4ELtrA==[m
[32m+[m
 portfinder@^1.0.9:[m
   version "1.0.20"[m
   resolved "https://registry.yarnpkg.com/portfinder/-/portfinder-1.0.20.tgz#bea68632e54b2e13ab7b0c4775e9b41bf270e44a"[m
[36m@@ -8044,7 +8107,7 @@[m [mprompts@^2.0.1:[m
     kleur "^3.0.3"[m
     sisteransi "^1.0.3"[m
 [m
[31m-prop-types@^15.6.2, prop-types@^15.7.2:[m
[32m+[m[32mprop-types@^15.6.1, prop-types@^15.6.2, prop-types@^15.7.2:[m
   version "15.7.2"[m
   resolved "https://registry.yarnpkg.com/prop-types/-/prop-types-15.7.2.tgz#52c41e75b8c87e72b9d9360e0206b99dcbffa6c5"[m
   integrity sha512-8QQikdH7//R2vurIJSutZ1smHYTcLpRWEOlHnzcWHmBYrOGUysKwSsrC89BCiFj3CbrfJ/nXFdJepOVrY1GCHQ==[m
[36m@@ -8266,15 +8329,27 @@[m [mreact-error-overlay@^6.0.2:[m
   resolved "https://registry.yarnpkg.com/react-error-overlay/-/react-error-overlay-6.0.2.tgz#642bd6157c6a4b6e9ca4a816f7ed30b868c47f81"[m
   integrity sha512-DHRuRk3K4Lg9obI6J4Y+nKvtwjasYRU9CFL3ud42x9YJG1HbQjSNublapC/WBJOA726gNUbqbj0U2df9+uzspQ==[m
 [m
[32m+[m[32mreact-is@^16.6.3, react-is@^16.8.4, react-is@^16.8.6:[m
[32m+[m[32m  version "16.10.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/react-is/-/react-is-16.10.0.tgz#3d6a031e57fff73c3cfa0347feb3e8f40c5141e5"[m
[32m+[m[32m  integrity sha512-WRki2sBb7MTpYp7FtDEmSeGKX2vamYyq3rc9o7fKUG+/DHVyJu69NnvJsiSwwhh2Tt8XN40MQHkDBEXwyfxncQ==[m
[32m+[m
 react-is@^16.8.1:[m
   version "16.8.4"[m
   resolved "https://registry.yarnpkg.com/react-is/-/react-is-16.8.4.tgz#90f336a68c3a29a096a3d648ab80e87ec61482a2"[m
   integrity sha512-PVadd+WaUDOAciICm/J1waJaSvgq+4rHE/K70j0PFqKhkTBsPv/82UGQJNXAngz1fOQLLxI6z1sEDmJDQhCTAA==[m
 [m
[31m-react-is@^16.8.4:[m
[31m-  version "16.10.0"[m
[31m-  resolved "https://registry.yarnpkg.com/react-is/-/react-is-16.10.0.tgz#3d6a031e57fff73c3cfa0347feb3e8f40c5141e5"[m
[31m-  integrity sha512-WRki2sBb7MTpYp7FtDEmSeGKX2vamYyq3rc9o7fKUG+/DHVyJu69NnvJsiSwwhh2Tt8XN40MQHkDBEXwyfxncQ==[m
[32m+[m[32mreact-popper@^1.3.4:[m
[32m+[m[32m  version "1.3.4"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/react-popper/-/react-popper-1.3.4.tgz#f0cd3b0d30378e1f663b0d79bcc8614221652ced"[m
[32m+[m[32m  integrity sha512-9AcQB29V+WrBKk6X7p0eojd1f25/oJajVdMZkywIoAV6Ag7hzE1Mhyeup2Q1QnvFRtGQFQvtqfhlEoDAPfKAVA==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@babel/runtime" "^7.1.2"[m
[32m+[m[32m    create-react-context "^0.3.0"[m
[32m+[m[32m    popper.js "^1.14.4"[m
[32m+[m[32m    prop-types "^15.6.1"[m
[32m+[m[32m    typed-styles "^0.0.7"[m
[32m+[m[32m    warning "^4.0.2"[m
 [m
 react-scripts@3.1.2:[m
   version "3.1.2"[m
[36m@@ -8827,6 +8902,30 @@[m [mselfsigned@^1.9.1:[m
   dependencies:[m
     node-forge "0.7.5"[m
 [m
[32m+[m[32msemantic-ui-css@^2.4.1:[m
[32m+[m[32m  version "2.4.1"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/semantic-ui-css/-/semantic-ui-css-2.4.1.tgz#f5aea39fafb787cbd905ec724272a3f9cba9004a"[m
[32m+[m[32m  integrity sha512-Pkp0p9oWOxlH0kODx7qFpIRYpK1T4WJOO4lNnpNPOoWKCrYsfHqYSKgk5fHfQtnWnsAKy7nLJMW02bgDWWFZFg==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    jquery x.*[m
[32m+[m
[32m+[m[32msemantic-ui-react@^0.88.1:[m
[32m+[m[32m  version "0.88.1"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/semantic-ui-react/-/semantic-ui-react-0.88.1.tgz#006d63f838b651370d68e73510327308f19ff6fd"[m
[32m+[m[32m  integrity sha512-fCCDnRXiVJUJ9icFVSu0n0pZ2cg2QssiLM2nP4pz6aODQpPZTPtXVI6V/hFciwJ+GPkV6WZAmEmFLxR7nRVF4Q==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@babel/runtime" "^7.1.2"[m
[32m+[m[32m    "@semantic-ui-react/event-stack" "^3.1.0"[m
[32m+[m[32m    "@stardust-ui/react-component-event-listener" "~0.38.0"[m
[32m+[m[32m    "@stardust-ui/react-component-ref" "~0.38.0"[m
[32m+[m[32m    classnames "^2.2.6"[m
[32m+[m[32m    keyboard-key "^1.0.4"[m
[32m+[m[32m    lodash "^4.17.15"[m
[32m+[m[32m    prop-types "^15.7.2"[m
[32m+[m[32m    react-is "^16.8.6"[m
[32m+[m[32m    react-popper "^1.3.4"[m
[32m+[m[32m    shallowequal "^1.1.0"[m
[32m+[m
 "semver@2 || 3 || 4 || 5", semver@^5.3.0, semver@^5.4.1, semver@^5.5.0, semver@^5.5.1, semver@^5.6.0:[m
   version "5.6.0"[m
   resolved "https://registry.yarnpkg.com/semver/-/semver-5.6.0.tgz#7e74256fbaa49c75aa7c7a205cc22799cac80004"[m
[36m@@ -8944,6 +9043,11 @@[m [mshallow-clone@^3.0.0:[m
   dependencies:[m
     kind-of "^6.0.2"[m
 [m
[32m+[m[32mshallowequal@^1.1.0:[m
[32m+[m[32m  version "1.1.0"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/shallowequal/-/shallowequal-1.1.0.tgz#188d521de95b9087404fd4dcb68b13df0ae4e7f8"[m
[32m+[m[32m  integrity sha512-y0m1JoUZSlPAjXVtPPW70aZWfIL/dSP7AFkRnniLCrK/8MDKog3TySTBmckD+RObVxH0v4Tox67+F14PdED2oQ==[m
[32m+[m
 shebang-command@^1.2.0:[m
   version "1.2.0"[m
   resolved "https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz#44aac65b695b03398968c39f363fee5deafdf1ea"[m
[36m@@ -9737,6 +9841,11 @@[m [mtype@^1.0.1:[m
   resolved "https://registry.yarnpkg.com/type/-/type-1.2.0.tgz#848dd7698dafa3e54a6c479e759c4bc3f18847a0"[m
   integrity sha512-+5nt5AAniqsCnu2cEQQdpzCAh33kVx8n0VoFidKpB1dVVLAN/F+bgVOqOJqOnEnrhp222clB5p3vUlD+1QAnfg==[m
 [m
[32m+[m[32mtyped-styles@^0.0.7:[m
[32m+[m[32m  version "0.0.7"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/typed-styles/-/typed-styles-0.0.7.tgz#93392a008794c4595119ff62dde6809dbc40a3d9"[m
[32m+[m[32m  integrity sha512-pzP0PWoZUhsECYjABgCGQlRGL1n7tOHsgwYv3oIiEpJwGhFTuty/YNeduxQYzXXa3Ge5BdT6sHYIQYpl4uJ+5Q==[m
[32m+[m
 typedarray@^0.0.6:[m
   version "0.0.6"[m
   resolved "https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz#867ac74e3864187b1d3d47d996a78ec5c8830777"[m
[36m@@ -9994,6 +10103,13 @@[m [mwalker@^1.0.7, walker@~1.0.5:[m
   dependencies:[m
     makeerror "1.0.x"[m
 [m
[32m+[m[32mwarning@^4.0.2, warning@^4.0.3:[m
[32m+[m[32m  version "4.0.3"[m
[32m+[m[32m  resolved "https://registry.yarnpkg.com/warning/-/warning-4.0.3.tgz#16e9e077eb8a86d6af7d64aa1e05fd85b4678ca3"[m
[32m+[m[32m  integrity sha512-rpJyN222KWIvHJ/F53XSZv0Zl/accqHR8et1kpaMTD/fLCRxtV8iX8czMzY7sVZupTI3zcUTg8eycS2kNF9l6w==[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    loose-envify "^1.0.0"[m
[32m+[m
 watchpack@^1.6.0:[m
   version "1.6.0"[m
   resolved "https://registry.yarnpkg.com/watchpack/-/watchpack-1.6.0.tgz#4bc12c2ebe8aa277a71f1d3f14d685c7b446cd00"[m
