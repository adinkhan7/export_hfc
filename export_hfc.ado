*! version 1.1 
*! Author: Adin Khan (Upgraded by Mushy)
*! Standalone utility to export data to Excel with 'Variable: Label' headers.

capture program drop export_hfc
program define export_hfc
    * Made varlist optional. If left blank, it defaults to all variables.
    syntax [varlist] using/ , sheet(string)

    preserve
        * Loop ONLY over the requested variables, not the whole bloody dataset
        foreach v of local varlist {
            local lbl : variable label `v'
            if "`lbl'" != "" {
                label variable `v' "`v': `lbl'"
            }
            else {
                label variable `v' "`v'"
            }
        }

        * Export only the requested variables
        export excel `varlist' using `"`using'"', ///
            sheet("`sheet'") sheetreplace firstrow(varlabels)
    restore
end
