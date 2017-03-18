# Test case - Hard 1: Read a text file and convert it into csv 

# ---- Reading of text file ----
taxo <- read.csv("taxo01.txt", sep = "\t" , header = FALSE)
taxo <- as.data.frame(taxo)

# Creating a repository of all states

states <- c("Kerala","Nadu", "Bengal", "Karnataka", "Maharashtra","Odisha","Pradesh", "Pondicherry", "Jharkhand", "Meghalaya", "Goa", "Bihar","Andaman", "Uttarakhand")
pointer_up <- c()

# Getting the all the rows which have the details of Distribution of states
for(i in 1:length(states))
{
  pointer <- grep(states[i],taxo[,1])
  pointer_up <- c(pointer_up,pointer)
}
pointer_up <- sort(pointer_up)
pointer_up <- unique(pointer_up)

numbered_rows <- grep("^[0-9]", taxo[,1])

name_dist <- sort(c(numbered_rows,pointer_up))

total <- 1:nrow(taxo)
Family_location <- setdiff(total,name_dist)
family_names <- taxo[Family_location,1]

#To get how many times different species of a family are in the data
numbers <- c()
for(i in 1:(length(family_names)-1))
{
  numbers[i] <- length(grep("^[0-9]", taxo[Family_location[i]:Family_location[i+1],]))
  if(i == (length(family_names)-1))
  {
    i = i +1
    numbers[i] = length(grep("^[0-9]", taxo[Family_location[i]:nrow(taxo),]))
  }
}

#Creating a vector of Family name
Family <- rep(family_names,numbers)

# Getting all the scinames and creating a vector to store them
numbered_rows <- grep("^[0-9]", taxo_data)
sci_names <- taxo_data[numbered_rows]
sci_names <- gsub("^[0-9]+. ", "", sci_names)


#Getting the distribution of all states and merging states in two rows if any
Distribution <- c()
j <- 1
i <- 1
while (i < 30)
{
  if((pointer_up[i+1] - pointer_up[i]) != 1)
  {
    Distribution[j] <- paste(taxo[pointer_up[i],])
    j = j + 1
    i = i + 1
  }
  if((pointer_up[i+1] - pointer_up[i]) == 1)
  {
   Distribution[j] <- paste(taxo[pointer_up[i],],taxo[pointer_up[i+1],], sep = "")
    j = j + 1
    i = i + 2
  }
}
Distribution[length(Family)] <- paste(taxo[length(taxo),])

#removing the word 'distribution' from the Distribution column
Distribution <- gsub("Distribution: ", "", Distribution)

#Creating the data frame of desired output
Final <- cbind(as.data.frame(Family),as.data.frame(sci_names),as.data.frame(Distribution))

# Writing the result into an csv file
write.csv(Final, file = "taxo_out01.csv", row.names = F)

