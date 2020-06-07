app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$uploadFile(gene1 = "mygene.txt", wait_=FALSE, values_=FALSE) # <-- This should be the path to the file, relative to the app's tests/ directory
app$snapshot()
app$setInputs(pileup = "click", timeout_=10000)
app$snapshot()
app$setInputs(Gene_name = "POLG",wait_=FALSE, values_=FALSE)
app$setInputs(tabSet = "UCSC gene", wait_=FALSE, values_=FALSE)
app$setInputs(button1 = "click", timeout_=1000000)
app$snapshot()
