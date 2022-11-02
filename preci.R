
library(raster)
library(ncdf4)
nc.pre <- nc_open("cru_ts4.06.1901.2021.pre.dat.nc")
print(nc.pre)
pre <- brick("cru_ts4.06.1901.2021.pre.dat.nc", varname="pre")
pre
samples <- read.csv("C:/samples.csv", header=TRUE, row.names="site", fileEncoding = "UTF-8-BOM", sep=",")
plot(pre$X1901.01.16)
pre.sites <- data.frame(extract(pre, samples, ncol=2)) # Precipitation
row.names(pre.sites) <- row.names(samples)
write.csv(pre.sites, file="Precipitation Data.csv")
years <- 1901:2021
month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(pre.sites) <- paste(rep(years, each=12), rep(month, times=116), sep="_")
write.csv(pre.sites, file="Precipitation Data in to csv.csv")
install.packages('rmarkdown')