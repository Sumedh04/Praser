library(RCurl)
library(XML)
library(rvest)
library(httr)

set_config(use_proxy(url= "10.3.100.207",port = 8080))

#Easy: Part 1
#Read html webpage

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"
webpage <- readLines(url)

# Getting the species name
species_name <- grep('species=',webpage)
raw_species <- webpage[species_name]

# Cleaning data species names for Output
species_name_clean <- sub(".*?<i>(.*?)</i>.*", "\\1", raw_species)
species_name_clean
