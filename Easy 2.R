#Easy: List out all the species from the list [https://www.abdb-africa.org/genus/Papilio]

library(RCurl)
library(XML)
library(rvest)
library(httr)

set_config(use_proxy(url= "10.3.100.207",port = 8080))

#Easy: Part 1
#Read html webpage

url <- "https://www.abdb-africa.org/genus/Papilio"
webpage <- readLines(url)

# Getting the genus name
species_name <- grep('species=',webpage)
raw_species <- webpage[species_name]

# Cleaning data genus names for Output
species_name_clean <- sub(".*?<i>(.*?)</i>.*", "\\1", raw_species)
species_name_clean
