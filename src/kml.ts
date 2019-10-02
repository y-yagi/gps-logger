import { GpsLog } from "./db";

function generateKmlFile(gpsLog: GpsLog): string {
  if (!gpsLog.logs) {
    return "";
  }

  const name = "GPS Logger";
  const lastIndex = gpsLog.logs.length - 1;
  const startCoordinate = `${gpsLog.logs[0].longitude},${gpsLog.logs[0].latitude}`
  const endCoordinate = `${gpsLog.logs[lastIndex].longitude},${gpsLog.logs[lastIndex].latitude}`
  const reducer = (accumulator: string, cur: any) => accumulator + `${cur.longitude},${cur.latitude}\n`;
  const coordinates = gpsLog.logs.reduce(reducer, "");

  return `<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2">
    <Document>
      <Style id="icon-123-nodesc-normal">
        <IconStyle>
          <scale>1.1</scale>
          <Icon>
            <href>http://www.gstatic.com/mapspro/images/stock/123-red-dot.png</href>
          </Icon>
          <hotSpot x="16" xunits="pixels" y="32" yunits="insetPixels"/>
        </IconStyle>
        <LabelStyle>
          <scale>0</scale>
        </LabelStyle>
        <BalloonStyle>
          <text><![CDATA[<h3>$[name]</h3>]]></text>
        </BalloonStyle>
      </Style>
      <Style id="icon-123-nodesc-highlight">
        <IconStyle>
          <scale>1.1</scale>
          <Icon>
            <href>http://www.gstatic.com/mapspro/images/stock/123-red-dot.png</href>
          </Icon>
          <hotSpot x="16" xunits="pixels" y="32" yunits="insetPixels"/>
        </IconStyle>
        <LabelStyle>
          <scale>1.1</scale>
        </LabelStyle>
        <BalloonStyle>
          <text><![CDATA[<h3>$[name]</h3>]]></text>
        </BalloonStyle>
      </Style>
      <StyleMap id="icon-123-nodesc">
        <Pair>
          <key>normal</key>
          <styleUrl>#icon-123-nodesc-normal</styleUrl>
        </Pair>
        <Pair>
          <key>highlight</key>
          <styleUrl>#icon-123-nodesc-highlight</styleUrl>
        </Pair>
      </StyleMap>
      <Style id="icon-61-nodesc-normal">
        <IconStyle>
          <scale>1.1</scale>
          <Icon>
            <href>http://www.gstatic.com/mapspro/images/stock/61-green-dot.png</href>
          </Icon>
          <hotSpot x="16" xunits="pixels" y="32" yunits="insetPixels"/>
        </IconStyle>
        <LabelStyle>
          <scale>0</scale>
        </LabelStyle>
        <BalloonStyle>
          <text><![CDATA[<h3>$[name]</h3>]]></text>
        </BalloonStyle>
      </Style>
      <Style id="icon-61-nodesc-highlight">
        <IconStyle>
          <scale>1.1</scale>
          <Icon>
            <href>http://www.gstatic.com/mapspro/images/stock/61-green-dot.png</href>
          </Icon>
          <hotSpot x="16" xunits="pixels" y="32" yunits="insetPixels"/>
        </IconStyle>
        <LabelStyle>
          <scale>1.1</scale>
        </LabelStyle>
        <BalloonStyle>
          <text><![CDATA[<h3>$[name]</h3>]]></text>
        </BalloonStyle>
      </Style>
      <StyleMap id="icon-61-nodesc">
        <Pair>
          <key>normal</key>
          <styleUrl>#icon-61-nodesc-normal</styleUrl>
        </Pair>
        <Pair>
          <key>highlight</key>
          <styleUrl>#icon-61-nodesc-highlight</styleUrl>
        </Pair>
      </StyleMap>
      <Style id="line-0288D1-5000-normal">
        <LineStyle>
          <color>ffd18802</color>
          <width>5</width>
        </LineStyle>
      </Style>
      <Style id="line-0288D1-5000-highlight">
        <LineStyle>
          <color>ffd18802</color>
          <width>7.5</width>
        </LineStyle>
      </Style>
      <StyleMap id="line-0288D1-5000">
        <Pair>
          <key>normal</key>
          <styleUrl>#line-0288D1-5000-normal</styleUrl>
        </Pair>
        <Pair>
          <key>highlight</key>
          <styleUrl>#line-0288D1-5000-highlight</styleUrl>
        </Pair>
      </StyleMap>
      <Placemark>
        <name>Start</name>
        <styleUrl>#icon-61-nodesc</styleUrl>
        <Point>
          <coordinates>
            ${startCoordinate}
          </coordinates>
        </Point>
      </Placemark>
      <Placemark>
        <name>End</name>
        <styleUrl>#icon-123-nodesc</styleUrl>
        <Point>
          <coordinates>
            ${endCoordinate}
          </coordinates>
        </Point>
      </Placemark>
      <Placemark>
        <name>${name}</name>
        <styleUrl>#line-0288D1-5000</styleUrl>
        <LineString>
          <coordinates>
${coordinates}
          </coordinates>
        </LineString>
      </Placemark>
    </Document>
  </kml>
  `;
}

export default generateKmlFile;
