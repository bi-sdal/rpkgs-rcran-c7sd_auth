gis_pkgs <- c(
    'rgdal',
    'rgeos',
    'osmar',
    'tmaptools',
    'sp',
    'ggmap'
)

tidy_pkgs <- c(
    'magrittr',
    'tidyverse',
    'lubridate'
)

shiny_pkgs <- c(
    'shiny',
    'shinydashboard',
    'flexdashboard',
    'DT',
    'leaflet',
    'highcharter',
    'plotly',
    'ggvis'
)

io_pkgs <- c(
    'DBI',
    'RPostgreSQL',
    'curl',
    'httr',
    'rio',
    'bigmemory',
    'biganalytics',
    'data.table',
    'sqldf',
    'RJSONIO'
)

ml_pkgs <- c(
    'glmnet',
    'useful',
    'coefplot',
    'rpart.plot',
    'randomForest',
    'tidytext',
    'rstan'
)

the_rest <- c(
    'ggthemes',
    'rmarkdown',
    'devtools',
    'dygraphs',
    'GGally',
    'PKI',
    'packrat',
    'rsconnect',
    'rsvg',
    'data.tree',
    'networkD3',
    'tidycensus'
)

cran_pkgs <- c(gis_pkgs, tidy_pkgs, shiny_pkgs, io_pkgs, ml_pkgs, the_rest)

install_error_message <- 
    "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!                                    !!!!!!!!!!
     !!!!!!!!!! A PACKAGE DID NOT INSTALL PROPERLY !!!!!!!!!!
     !!!!!!!!!!                                    !!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    "

tryCatch({
    install.packages(cran_pkgs)
}, error = function(e) {
    stop(install_error_message)
    Sys.sleep(10)
    quit(save = "no", status = 1)
})

print("Finished Installing")

for (p in cran_pkgs){
    print(sprintf('Loading: %s', p))
    tryCatch({
        library(p, character.only = TRUE)
    }, error = function(e) {
        stop(install_error_message)
        Sys.sleep(10)
        quit(save = "no", status = 1)
    })
}
