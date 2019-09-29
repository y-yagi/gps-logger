// generateKmlFile("test", "139.526305,35.695418,0", "139.488012,35.655025,0", "139.526305,35.695418,0\n139.526339,35.695272,0")
function generateKmlFile(name, startCoordinate, endCoordinate, coordinates) {
  return `
  <?xml version="1.0" encoding="UTF-8"?>
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
