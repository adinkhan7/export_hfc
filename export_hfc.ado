*! version 1.0 31jan2026
*! Author: Adin Khan
*! Standalone utility to export data to Excel with 'Variable: Label' headers.

capture program drop export_hfc
program define export_hfc
    syntax using/, sheet(string)

    preserve
        * prepend variable name to its label
        foreach v of varlist _all {
            local lbl : variable label `v'
            if "`lbl'" != "" {
                label variable `v' "`v': `lbl'"
            }
            else {
                label variable `v' "`v'"
            }
        }

        export excel using `"`using'"', ///
            sheet("`sheet'") sheetreplace firstrow(varlabels)
    restore
end
	