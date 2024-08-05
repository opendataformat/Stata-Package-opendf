{smcl}
{* *! version 1.2 (30 July 2024)}{...}
{vieweralsosee "opendf_read" "help opendf_read"}{...}
{vieweralsosee "opendf_write" "help opendf_write"}{...}
{vieweralsosee "opendf_docu" "help opendf_docu"}{...}
{vieweralsosee "opendf_csv2dta" "help opendf_csv2dta"}{...}
{vieweralsosee "opendf_csv2zip" "help opendf_csv2zip"}{...}
{viewerjumpto "Syntax" "xml2csv##syntax"}{...}
{viewerjumpto "Description" "xml2csv##description"}{...}
{viewerjumpto "Options" "xml2csv##options"}{...}
{viewerjumpto "Examples" "xml2csv##examples"}{...}
help for {cmd:opendf csv2zip (xml2csv)}{right:version 1.2 (30 July 2024)}

{hline}

xml2csv
{title:Title}

{phang}
{bf:xml2csv} {hline 2} generates vour csvs from an opendf-format zip-file containing data meta data for survey data. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:xml2csv}, 
{opt input_zip()} {opt output_dir()} {opt languages()} [{opt verbose}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt input_zip(string)}}(Path and) Name to the odf-zip-file. {p_end}
{synopt :{opt output_dir(string)}}Indicates the output directory for the csvs. {p_end}
{synopt :{opt languages(string)}}Chooses, which languages to keep. Default is all. Default is "all" {p_end}
{synopt :{opt verbose}}More warnings are displayed. {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:xml2csv} Transforms survey data from an odf zip-file to four csvs several csv files into dta-format including metadata saved in labels and characteristics. {p_end}

{pstd}{opt input_zip} is the (path and) name of the ODF zip-folder.{p_end}
{pstd}{opt output_dir} is the path to the folder where 4 csvs will be written to. {p_end}
{pstd}{opt languages(string)}} Indicates for which languages the metadata should be written to the csv files. By default all metadata in all available languages is written.(languages("all"))
{{pstd}The option {opt verbose}}indicates whether more warnings should be displayed. {p_end}


{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Builds and saves four csv-files in the C:\Documents\csv_files-folder from the datafile testdata.zip {p_end}
{phang}{cmd:.  xml2csv, input_zip("C:\documents\testdata.zip"), output_dir("C:\Documents\csv_files") languages("all")}{p_end}




{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":hartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf_read}, {help opendf_write}, {help opendf_docu}, {help opendf_csv2dta}, {help opendf_csv2zip}{p_end}