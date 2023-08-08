## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  warning = FALSE,
  message = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(EgoCor)

## -----------------------------------------------------------------------------
head(birth)

## ----fig1, fig.height = 4.5, fig.width = 6, fig.align = "center"--------------
coords.plot(birth)

## ----fig2, fig.height = 4.5, fig.width = 6, fig.align = "center"--------------
distance.info(birth)


## ----fig3, fig.height = 4.5, fig.width = 6, fig.align = "center"--------------
mod = vario.mod(birth, max.dist = c(1000,800,600), shinyresults = FALSE, windowplots = TRUE)

## -----------------------------------------------------------------------------
mod$infotable

## ----fig4, fig.height = 4.5, fig.width = 6, fig.align = "center"--------------
mod_2 = vario.mod(birth, max.dist = 800, nbins = c(11,12,13), 
                  shinyresults = FALSE, windowplots = TRUE)

## ----fig5, fig.height = 4.5, fig.width = 6, fig.align = "center"--------------
res <- lm(formula = birthweight ~ datediff + primiparous + bmi, data = birth)
v.prep = vario.reg.prep(res, data = birth)
models = vario.mod(v.prep, max.dist = c(800,600), shinyresults = FALSE, windowplots = TRUE)

## ---- warning = FALSE---------------------------------------------------------
unc = par.uncertainty(mod_2, mod.nr = 2, B = 100)

