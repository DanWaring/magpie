# |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# --------------------------------------------------------
# description: calculate and store new yield calib factors for realizations of factor costs (land conversion cost calibration factors are only calculated if needed)
# --------------------------------------------------------

library(magpie4)
library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

#start MAgPIE run
source("config/default.cfg")

realizations<-c("sticky_feb18","mixed_feb17","fixed_per_ton_mar18") #"sticky_labor" is very similar to sticky_feb18. No extra calibration needed.
type<-NULL


for(r in realizations){

    type<-if (r=="sticky_feb18" | r=="sticky_labor") c("free","dynamic") else "_"

    for(t in type){

      cfg$results_folder <- "output/:title:"
      cfg$recalibrate <- TRUE
      cfg$recalibrate_landconversion_cost <- "ifneeded"
      cfg$title <- paste("calib_run",r,t,sep="_")
      cfg$output <- c("rds_report","validation_short")
      cfg$force_replace <- TRUE

      cfg$gms$factor_costs     <-   r
      cfg$gms$c38_sticky_mode  <-   t

      if (t=="dynamic"){
      cfg$gms$c17_prod_init <- "off"
      }


      start_run(cfg)
      magpie4::submitCalibration(paste("H12",r,t,sep="_"))
    }
}
