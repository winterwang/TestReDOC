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
dedoc("Diabetes_CA_paper_LP.docx", track_changes = "all", overwrite = TRUE) # worked
# 5. compare diff between rmd
redoc_diff("Diabetes_CA_paper_LP.docx")
