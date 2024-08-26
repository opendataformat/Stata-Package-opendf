# opendataformat 

## Overview

The `opendataformat` package is specifically designed to facilitate the seamless utilization of the Open Data Format. 
It offers functionality to import data from the Open Data Format into a Stata data frame, as well as export data from a Stata data frame (.dta) to the Open Data Format. 
Additionally, you can easily access comprehensive information about the dataset and variables. 
This user-friendly approach ensures convenient exploration and utilization of dataset information within your preferred environment.

## Installation

``` Stata
* At this point you can install the development version from github:
net install opendf, from (https://opendataformat.github.io/stata-package-opendf/) replace


```

## Getting started

The opendataformat package consists of three main functions:

- `opendf read` to read an Open Data Format file in Stata. This function takes an input parameter, which is the path to the Open Data Format ZIP file.

- `opendf docu` to explore the dataset information. You can display metadata for the whole dataset using `opendf docu` or an selected variable `opendf docu variable`. 

- `opendf write` to write the Stata data frame to an Open Data Format ZIP file. By specifying the dataframe input and providing the output directory path the function will generate a ZIP file containing the dataset stored in a "data.csv" and the metadata stored in a "metadata.xml".

``` Stata
* You can load a dataset in opendf-format with opendf_read by specifying the path to the zip-folder, (in this case, the testdataset from github):
opendf read "https://opendataformat.github.io/stata-package-opendf/data/testdata.zip", clear verbose

```

## Additional Functions

The opendataformat package provides further functions that might be helpful:

- `opendf installpython` will install a python version that enables the opendf-package to work. Some functions (`opendf read` and `opendf write`) need a working python version on your PC. If Stata is not able to find a working python version, you can use this command to copy a python (default v3.12) to the Stata ado/plus folder (where Stata packages are stored). You can also specify the python version you want to install and specify a location where the folder with the python version should be deployed. But than you have to tell Stata manually where the python.exe is located using "set python_exec".

- `opendf removepython` will remove python versions installed with `opendf installpython`. By default the the command will delete all python3 folders/installations from the Stata ado folder (the default folder where `opendf installpython` deploys the python installation). With the `version()`-option can also specify which python version to remove. With the `location()`-option you can indicate where to delete the python folders from.

- `opendf_csv2dta` to read data from four csvs containing data and metadata into Stata. 

- `opendf_csv2zip` to save data from four csvs containing data and metadata to a opendf-format (zip-folder containing data.csv and metadata.xml). The csvs consist of data.csv (raw data), dataset.csv (dataset metadata), varaibles.csv (variables metadata) and categories.csv (value labels for variables).



For data providers the `opendf_csv2dta` and `opendf_csv2dta` functions might be interesting to convert their data to the opendf format. 


### Multilingual Datasets

When working with a multilingual dataset, the `opendataformat` package provides the option to specify the language you want to work with for the main functions: `opendf read`, `opendf docu`, `opendf write`.
 
You can achieve this by using the `languages` argument and setting it to either `all` to include all languages, or by specifying the language code such as `de` for German or `en` for English. 
This allows you to easily select the desired language for your dataset operations. Metadata without a language tag will be assigned to the language `default`.
The language codes are defined by the [ISO 639-1](https://de.wikipedia.org/wiki/Liste_der_ISO-639-1-Codes).


## Further Information

For more comprehensive insights into the Open Data Format specification, please visit: [Open Data Format Specification](https://git.soep.de/opendata/specification). 
This resource provides detailed documentation and profiles illustrating the storage locations of attributes within the Open Data Format, as well as within the native formats to which they will be converted.

Additionally, you will have access to a practical example of [real data in the Open Data Format](https://git.soep.de/opendata/open-data-package).

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/opendataformat/stata-package-opendf/issues). 

