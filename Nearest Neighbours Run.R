rm(list = ls(all = TRUE))
## This runs the script for running the nearest neieghbours script

## Clear workspace and set directory

setwd(
  paste0(
    "Q:/ASCT/P005 Homelessness/007 Stat homeless/Data and stats development project/",
    "002 Deliverables/024 Automation/HomelessNearestNeighbours"
  )
)

# Run code
source("Code/Load input data.R")
source("Code/Nearest neighbours calculation.R")

