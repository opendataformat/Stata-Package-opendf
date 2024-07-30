/*----------------------------------------------------------------------------------
  opendf_docu.ado: loads data from opendf format (zip) to stata
    Copyright (C) 2024  Tom Hartl (thartl@diw.de)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    For a copy of the GNU General Public License see <http://www.gnu.org/licenses/>.

-----------------------------------------------------------------------------------*/
*! opendf_docu.ado: displays metadata of variable or datasat
*! version 1.2 July, 30 2024 - Release


program define opendf_docu
	syntax [anything], [LANGUAGES(string)]

    local varname `anything'
    *args varname
    
    *get activated label language
    local _currentlanguage: char _dta[_lang_c]
    local _languages: char _dta[_lang_list]
    if (`"`languages'"' ==""){
        local _lang = "`_currentlanguage'"
    }
    else {
        if (`"`languages'"' =="all"){
            local _lang = "`_languages'"
        }
        else {
            local _lang = "`languages'"
            label language `_lang'
        }
    }
    *if varname is not empty, we assume that varname is a variable
    if (`"`varname'"' != "") {
        local _output = "variable"
        local _name = "`varname'"
        foreach l in `_lang'{
		    qui label language `l'
			capture local _label_`l' : variable label `varname'
			if _rc==111 {
				display as error "variable `varname' not found"
				display as error "Enter a valid variable name or execute opendf docu without an argument to display the dataset information."
				exit 111
			}
			local _descr_`l': char `varname'[description_`l']
			if `"`_descr_`l''"'=="" {
				local _descr_`l': char `varname'[description]
			}
			if `"`_descr_`l''"'=="" {
				local mylanguage=strupper("`l'")
				local _descr_`l': char `varname'[description_`mylanguage']
			}
				if `"`_descr_`l''"'=="" {
				local mylanguage=strlower("`l'")
				local _descr_`l': char `varname'[description_`mylanguage']
			}
		}
		
        
        local _url: char `varname'[url]
        local _type: char `varname'[type]
    }
    else {
        local _output "dataset"
       	local _study: char _dta[study]
	local _dataset: char _dta[dataset]
	local _name= "`_study': `_dataset'"
        foreach l in `_lang'{
		    qui label language `l'
		    local _label_`l' : data label
			local _descr_`l': char _dta[description_`l']
			if `"`_descr_`l''"'=="" {
				local _descr_`l': char _dta[description]
			}
			if `"`_descr_`l''"'=="" {
				local mylanguage=strupper("`l'")
				local _descr: char _dta[description_`mylanguage']
			}
			if `"`_descr_`l''"'=="" {
				local mylanguage=strlower("`l'")
				local _descr_`l': char _dta[description_`mylanguage']
			}
		}
		
        local _url: char _dta[url]
    }
    *if "`_output'"=="variable" display "{p}Variable: {text:`_name'}{p_end}"
    if "`_output'"=="dataset" display "{p}Dataset: {text:`_name'}{p_end}"
    foreach l in `_lang'{
	    if (`"`languages'"'=="all"){
		    local _l=" `l'"
		}
		else {
		    local _l=""
		}
	    display `"Label`_l': {text:`_label_`l''}"'
	}
    if "`_output'"=="dataset" display "{p}Languages: {text:`_languages'}{p_end}{p}{text:(currently set:} `_currentlanguage'{text:)}{p_end}"
	foreach l in `_lang'{
	    if (`"`languages'"'=="all"){
		    local _l=" `l'"
		}
		else {
		    local _l=""
		}
		display `"{p}Description`_l': {text:`_descr_`l''}{p_end}"'
	}
	if "`_url'" != "" {
        display `"{p}URL: {stata "view browse `_url'":`_url'}{p_end}"'
    }
    else di "URL: "
    if "`_output'"=="variable" display "{p}Variable Type: {text:`_type'}{p_end}"
    if "`_output'"=="variable"{
		capture local _lblname: value label `varname'
		if "`_lblname'"!= "" {
			display "Value Labels:"
			quietly label list `_lblname'
			forvalues _val=`r(min)'/`r(max)'{
				quietly local _lbl: label `_lblname' `_val'
				if ("`_lbl'" != "`_val'") {
					display `"{p}{text:`_val' :  `_lbl'}{p_end}"'
				}
			}
		}
	}
    qui label language `_currentlanguage'

end

