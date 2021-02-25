#-------------------------------------------------------------------------------
# A report on the SILC data for Belgium ----------------------------------------
#-------------------------------------------------------------------------------

## The data--------------------------------------------------------------------

# We use `read.delim` to read in data here, but recall `read_sav` in the `haven` 
# package, and `read_xlsx` in the `readxl`` package. 

### Reading in data

library(lubridate) # For handling dates 

silc_p <- read.delim("BE_2013p_EUSILC.csv", sep=";")

# The data is the SILC data for Belgium
# It contains data on Statistics on Income and Living Conditions

summary(silc_p)

## Some tables------------------------------------------------------------------

# We shall tabulate data by sex, marital status and year of birth. 

# First, we want to group year of birth into intervals

silc_p$YEAR_OF_BIRTH <- cut( silc_p$PB140
                             , breaks = seq( from = 1930, to = 2010, by=20)
                             , right = F
                             , labels = c("1930-49", "1950-69", "1970-89","1990-2009"))

# We want a more informative format on Sex and marital status

silc_p$SEX <- factor( silc_p$PB150, levels = c(1,2), labels = c("Male", "Female"))

silc_p$MARITAL_STATUS = factor( silc_p$PB190, 
                                levels = 1:5,
                                labels = c( "Never married","Married","Separated","Widowed","Divorced")
)

# Basic tables are functional but somewhat lacking. 

table( silc_p$YEAR_OF_BIRTH, silc_p$SEX) 

# For a more powerful, if syntactically heavy approach, the `tables` package is an 
# option. See `vignette(tables)`

library(tables)

# Syntax that makes a table
tab <- tabular( 
  1 + YEAR_OF_BIRTH + MARITAL_STATUS ~ 
    SEX*( (N=1) + Percent("col")*Format(digits=1))
  , data = silc_p
)

tab

# Some descriptive plots of year of birth by sex -------------------------------

library(ggplot2)

fig1 <- ggplot( data = silc_p
        , aes( x = PB140)) + 
  geom_histogram( aes( y =..density.. )) + 
  geom_density( col = "magenta") +
  facet_wrap( ~ SEX) + 
  xlab( "Year of birth" )

fig1


# That's nice, but it's not standard. We use a theme to make it standard, 
# and set the colours to DST standard 

source("DST_ggplot2.R")

ggplot( data = silc_p
               , aes( x = PB140)) + 
  geom_histogram( aes( y =..density.. ),
                  binwidth = 5,
                  fill = dst_lblå[1]) + 
  geom_density( col = dst_rød[1], size = 1) +
  facet_wrap( ~ SEX) + 
  xlab( "Year of birth" ) + dst_theme


