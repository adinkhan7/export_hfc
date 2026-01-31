syntax: 
			export excel using `"`using'"', ///
				sheet("`sheet'") sheetreplace firstrow(varlabels)
Example:
export_hfc using "file.xlsx", sheet("sheet1")
