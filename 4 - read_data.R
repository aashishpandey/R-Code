data0 = read.csv(file.choose()) # read a csv file

head(data0) # Print top rows
tail(data0) # print last rows
summary(data0)

data1 = read.csv(file.choose(),header=T, sep="$") # read a csv file with $ delimiter

data2 = read.table(file.choose(),header=T)  # Read txt file
data3 = read.table("clipboard") # read from clipboard 
data4  = read.table("clipboard", header=T) # read from clipboard 

head(data4)
