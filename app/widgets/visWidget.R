# Example widget: a function from package dataLove

visWidget <- function (.data) {
  require(ggplot2)
  require(dataLove)
  require(dplyr)
  require(ggvis)
  clustered_data <- dataLove::findClusters(.data)
  
  dataLove::visCluster(clustered_data)
}
