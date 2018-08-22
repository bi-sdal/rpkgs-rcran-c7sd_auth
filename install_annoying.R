install.packages('udunits2', type = 'source', repo = 'cran.rstudio.com', configure.args = '--with-udunits2-include=/usr/include/udunits2 --with-udunits2-lib=/usr/local/lib')

fury <- c(
    'sf',
    'tigris',
    'tmap',
    'mapview'
)

tryCatch({
    install.packages(fury)
}, error = function(e) {
    stop('R is not being nice')
    quit(save = "no", status = 1)
})

print("Finished Installing")

for (p in fury){
    print(sprintf('Loading: %s', p))
    tryCatch({
        library(p, character.only = TRUE)
    }, error = function(e) {
        stop('R is not being nice')
        quit(save = "no", status = 1)
    })
}
