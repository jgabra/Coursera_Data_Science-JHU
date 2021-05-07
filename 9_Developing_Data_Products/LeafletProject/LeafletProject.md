---
title: "Leaflet Project"
author: "JN Gabra"
date: "May 7, 2021"
output: 
      html_document:
            keep_md: true
---
# The Titanic Ship Wreck
This is location of the Titanic ship wreck. The Titanic started at Southampton, England and was supposed to dock in New York, New York.


```r
library(leaflet)

titanic<-data.frame(lat=c(50.9097,41.726931,40.748801),
                    lng=c(-1.4044,-49.948253,-74.009978)
                    )
titanic %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(popup=c("The Titanic's Starting Point","Titanic Ship Wreck","The Titanic's Desired Destination"))
```

```{=html}
<div id="htmlwidget-8f746b4d1d90b84ab5a8" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-8f746b4d1d90b84ab5a8">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[50.9097,41.726931,40.748801],[-1.4044,-49.948253,-74.009978],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["The Titanic's Starting Point","Titanic Ship Wreck","The Titanic's Desired Destination"],null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[40.748801,50.9097],"lng":[-74.009978,-1.4044]}},"evals":[],"jsHooks":[]}</script>
```

