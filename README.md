# [The Land and Water Conservation Fund](https://loweas.github.io/lwcf/)
This dashboard is to represent a survey conducted by Outdoor Recreation Roundtable (ORR) and is in hopes to create a list of outstanding LWCF-eligible recreation projects for FY22-FY25 from businesses and partners around the country. This list will complement the recent passage of the Great American Outdoors Act by showcasing the outstanding potential for recreation projects to support rural development and access and equity in diverse communities around the country, and will be used to help inform future priorities for the outdoor recreation economy and to educate Congress and the administration.

## Process
1. Download Qualtric survey
2. Run through R to Clean data.
    - This will clean columns rows.
    - Merge on centeroids on County
    - If no county, then merge on State centeroids.
    - Clean up unneeded strings in column.
    - Write lwcf.csv file
    - Write lwcf.geojson file
4. Push new assets to github
5. Done!

## Libraries
#### Map
[MapBox](www.mapbox.com)

[Leaflet](https://leafletjs.com/)

[Leaflet Sidebar](https://github.com/Turbo87/leaflet-sidebar)

[Leaflet Cluster](https://github.com/Leaflet/Leaflet.markercluster)

#### Font
[Google font](https://fonts.google.com/)

#### Data & Charts
[D3.js](https://d3js.org/)

[C3.js](https://c3js.org/)

[Rstudio](https://rstudio.com/)

#### Responsive Layout
[bootstrap.js](https://getbootstrap.com/)

[chroma.js](https://gka.github.io/chroma.js/)

[Font Awesome](https://fontawesome.com/)
