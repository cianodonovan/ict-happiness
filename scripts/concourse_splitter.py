#Python script for taking a CSV of concourse items and creating LaTeX files per item
# Takes two columns, a concourse item text col, and a filename col.

#Setting the relative path
import os

#Accessing a text file - www.101computing.net/mp3-playlist/
file = open("concourse.txt","rU")

#Repeat for each song in the text file
for line in file:
  
	#Let's split the line into an array called "fields" using the ";" as a separator:
	line = line.rstrip('\r\n')
	fields = line.split(";")
  
	#and let's extract the data:
	itemtext = fields[0]
	newfilename = fields[1]

	# get the current script path
	here = os.path.dirname(os.path.realpath(__file__))
	subdir = "concourse_items"
	newfilenametex = newfilename+".tex"
	filepath = os.path.join(here, subdir, newfilenametex)
	# write to the new file in the new directory
	with open(filepath, 'w') as f:
	    f.write(itemtext)
	#END the MAGIC writing
	print("Writing: /" + subdir + "/" + newfilenametex)
	

#It is good practice to close the file at the end to free up resources   
file.close()

