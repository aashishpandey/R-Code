# Write.table function 
write.table(cars,"cars.txt",sep=",")
write.table(cars,file.choose(),sep=",")
write.table(cars,"clipboard",sep=",")


### Saving print output/any class function result 

s1 = capture.output(summary(cars)) # assign whatever you want to save

zz <- file("cars_summary.txt", "w") # create file

cat("\n", file = zz) # Go to new line(line2 in file)
cat("################################# \n", file = zz) #print multiple hash # and go to next line 
cat("Summary for Cars data from datasets package  \n", file = zz) # print "Summary..." and go to new line
cat("\n", file = zz) # go to next line
cat(s1, file = zz, sep = "\n", append = TRUE) # print your object and go to next line
close(zz) # Close the file

# Saving graphical objects in jpeg format
jpeg(file = "cars_plot.jpeg", pointsize = 12,  width = 800, height = 800)
plot(cars) 
dev.off()

# Saving graphical objects in pdf format
pdf("cars_plot.pdf")
plot(cars)
dev.off()