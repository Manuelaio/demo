This repository is home of unCOVERApp, a web application for clinical assessment and annotation of coverage gaps in target genes. 
Read more about unCOVERApp on [biorxiv](https://www.biorxiv.org/content/10.1101/2020.02.10.939769v1)

[![DOI](https://zenodo.org/badge/254597958.svg)](https://zenodo.org/badge/latestdoi/254597958)



# Table of content

* [Prerequisites](#Prerequisites)
* [Installation](#Installation)
* [Introduction](#Introduction)
* [Download_annotation_files](#Download_annotation_files)
* [Input](#Input)
* [Usage](#Usage)


## Prerequisites


This app requires following dependencies:


- R >= 3.5.1 and run [Rscript](https://github.com/Manuelaio/test_dependence/blob/master/dependencies.R)
to set up the environment. 
Major informations about unCOVERApp R dependences are 
[here](https://github.com/Manuelaio/test_dependence). [![Build Status](https://travis-ci.com/Manuelaio/test_dependence.svg?branch=master)](https://travis-ci.com/Manuelaio/test_dependence)


- java installed 

- annotation files (`sorted.bed.gz` and `sorted.bed.gz.tbi`) that can be 
downloaded on Zenodo at the following 
link https://zenodo.org/record/3747448#.XpBmnVMzbOR and stored in a user folder. 

## Installation

To run locally, you can clone or download this repository. 

``` {r}

git clone https://github.com/Manuelaio/unCOVERApp.git

``` 


## Introduction


The rapid spread of NGS-technology has been coupled since its beginning with 
development of bioinformatic tools for data analysis and interpretation. 
However, despite increasing accuracy of available approaches, the need to 
assess sequencing quality of the analysis targets at the base-pair resolution 
poses growing challenges especially in the clinical settings.  
In diagnostics indeed, meticulous investigation of every single target base is 
often required to exclude that pathogenic events across the gene of interest 
may be missed due to uneven sequence coverage.


unCOVERApp is an interactive web-application 
for graphical inspection of sequence coverage within gene regions.


unCOVERApp highlights low coverage genomic positions, according to the coverage
threshold specified by the user, providing *dbNSFP-based annotation*s for 
clinical assessment of low coverage regions. 
It implements basic statistical tools such as binomial probability calculation 
that genomic positions are adequately 
covered, and 
[maximum credible allele frequency](http://cardiodb.org/allelefrequencyapp/). 


# Download_annotation_files

To associate low-coverage sites with functional and clinical annotations, 
unCOVERApp uses [dbNSFP](https://sites.google.com/site/jpopgen/dbNSFP) 
version 4.0 stored in two file:


* `sorted.bed.gz`: a genomically-sorted, TABIX-indexed, BGZipped BED file 
containing selected columns from dbNSFP version  v4.0. 


* `sorted.bed.gz.tbi`: TABIX-indexed file.

Those files are stored on Zenodo at following
[link](https://zenodo.org/record/3747448#.XpBmnVMzbOR) for downloading. 
*sorted.bed.gz* encloses prediction scores (MutationAssessor, SIFT, CADD, 
M-CAP, Polyphen2-HVAR), allele frequencies observed in 
gnomAD data, dbsnp accession number, HGVS notations and clinical annotation 
information from ClinVar and OMIM. Loading *sorted.bed.gz* allows the annotation 
of each low coverage genomic position user-defined. . 
Annotation files must be downloaded and located in unCOVERpp folder. 
The final tree of directory unCOVERpp is shown following:

``` {r}
├── CONTACTS.md
├── LICENSE.md
├── README.html
├── README.md
├── intro.md
├── preprocessing.md
├── script
│   ├── POLG.example.bed
│   ├── Rpreprocessing.R
│   ├── contact.png
│   ├── example_POLG.bam
│   ├── example_POLG.bam.bai
│   └── script.js
├── server-annotation.R
├── server-binomial.R
├── server-maxAF.R
├── server-plots.R
├── server-preprocess.R
├── server-reactiveDF.R
├── server-tables.R
├── sorted.bed.gz
├── sorted.bed.gz.tbi
└── uncoverApp.R
``` 

# Input

As input file unCOVERApp takes:

- a text file, with .txt extension, containing HGNC official gene name one per 
row. 

- a text file, with .list extension, containing absolute paths to BAM files
(one per row). In the output file, the first written bam file correspond to
sample 1 and so forth.


# Usage

Load `shiny` library and set up R environment. 

``` {r}
 library(shiny) 
 runApp(’uncoverApp.R’)

``` 

We provide a bam file to reproduce an executable example, please view the [Documentation.pdf](https://github.com/Manuelaio/unCOVERApp/blob/master/Documentation.pdf) on Github. 
