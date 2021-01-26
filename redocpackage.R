library(redoc)
print(basename(redoc_example_docx()))
dedoc(redoc_example_docx())


############################################################
#                                                          #
#                        work flow                         ####
#                                                          #
############################################################

# 1. write my own rmd use redoc package to convert it to docx
# 2. share docx to coauthors
# 3. coauthors send back with docx file commented or modified
# 4. convert modified docx back to rmd with redoc
dedoc("filefromcoauthor.docx", track_changes = "all", overwrite = TRUE) # worked
# 5. compare diff between rmd　# to view the changes within Rstudio (under Ubuntu)
redoc_diff("filefromecoauthor.docx")
# 6. make changes according to the comments in rmd or docx?