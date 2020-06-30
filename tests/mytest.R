app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$uploadFile(gene1 = "mygene.txt", wait_=FALSE, values_=FALSE) # <-- This should be the path to the file, relative to the app's tests/ directory
Sys.sleep(30)
app$snapshot()
app$setInputs(pileup = "click", wait_=FALSE, values_=FALSE)
Sys.sleep(30)
app$snapshot()
