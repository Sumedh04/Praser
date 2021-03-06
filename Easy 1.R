#Eaasy:Read the html from URL [http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/] and get the genus name

library(RCurl)
library(XML)
library(rvest)
library(httr)

set_config(use_proxy(url= "10.3.100.207",port = 8080))

#Easy: Part 1
#Read html webpage

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"
webpage <- readLines(url)

# Getting the genus name
genus_name <- grep('genus=',webpage)
raw_genus <- webpage[genus_name]

# Cleaning data genus names for Output
genus_name_clean <- sub(".*?<i>(.*?)</i>.*", "\\1", raw_genus)
genus_name_clean

