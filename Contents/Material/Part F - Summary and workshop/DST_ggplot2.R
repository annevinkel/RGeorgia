## indledende tjek af pakker
list.of.packages <- c("extrafont", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

## NB: For at kunne anvende Arial Narrow skal R importere denne font -- skal kun gøres en gang
if ('extrafont' %in% new.packages) library(extrafont)
if ('extrafont' %in% new.packages) loadfonts(device = 'win')



#######################################################
##  Danmarks Statistik - Farvepalette - Design 2013  ##
#######################################################
## Lilla
dst_lilla <- c(
  rgb(68,38,104,maxColorValue=255),
  rgb(98,71,130,maxColorValue=255),
  rgb(131,112,160,maxColorValue=255),
  rgb(171,159,194,maxColorValue=255),
  rgb(212,209,228,maxColorValue=255)
)

## Mørk blå
dst_mblå <- c(
  rgb(16,45,105,maxColorValue=255),
  rgb(54,71,128,maxColorValue=255),
  rgb(89,103,154,maxColorValue=255),
  rgb(132,142,184,maxColorValue=255),
  rgb(175,184,213,maxColorValue=255)
)

## Lys blå
dst_lblå <- c(
  rgb(0,145,212,maxColorValue=255),
  rgb(38,163,221,maxColorValue=255),
  rgb(117,182,229,maxColorValue=255),
  rgb(163,204,238,maxColorValue=255),
  rgb(207,226,246,maxColorValue=255)
)

## Lys grøn
dst_mgrøn <- c(
  rgb(0,134,59,maxColorValue=255),
  rgb(71,150,81,maxColorValue=255),
  rgb(118,170,113,maxColorValue=255),
  rgb(163,193,149,maxColorValue=255),
  rgb(198,215,182,maxColorValue=255)
)

## Mørk grøn
dst_lgrøn <- c(
  rgb(108,115,24,maxColorValue=255),
  rgb(130,135,54,maxColorValue=255),
  rgb(156,158,91,maxColorValue=255),
  rgb(182,181,127,maxColorValue=255),
  rgb(210,209,171,maxColorValue=255)
)

## Rød 
dst_rød <- c(
  rgb(139,12,32,maxColorValue=255),
  rgb(161,52,58,maxColorValue=255),
  rgb(180,91,89,maxColorValue=255),
  rgb(201,130,127,maxColorValue=255),
  rgb(222,174,171,maxColorValue=255)
)

## Orange
dst_orange <- c(
  rgb(238,114,3,maxColorValue=255),
  rgb(243,148,51,maxColorValue=255),
  rgb(247,171,96,maxColorValue=255),
  rgb(250,193,138,maxColorValue=255),
  rgb(253,218,176,maxColorValue=255)
)

## Grå
dst_grå <- c(
  rgb(111,109,92,maxColorValue=255),
  rgb(144,142,126,maxColorValue=255),
  rgb(174,172,157,maxColorValue=255),
  rgb(202,201,189,maxColorValue=255),
  rgb(229,228,222,maxColorValue=255)
)



#################
##  DST_THEME  ##
#################
## loader ggplot
library(ggplot2)
library(extrafont)

dst_theme <-  theme(
  ## general
  legend.position = 'right',
  rect = element_blank(),
  axis.ticks = element_blank(),
  text = element_text(colour=rgb(111,109,92,maxColorValue=255), family="Arial Narrow", size = 10),
  ## legend
  legend.key.size = unit(1,"cm"),
  legend.spacing = unit(0.1,"cm"),
  ## grid
  panel.grid.minor.x = element_blank(),  
  panel.grid.major.x = element_blank(),  
  panel.grid.minor.y = element_blank(), 
  panel.grid.major.y = element_line(color = rgb(111,109,92,maxColorValue=255), size = 0.25), 
  ## axis text
  axis.title   = element_text(face = 'bold', angle = 0, vjust = 0.5)
)
