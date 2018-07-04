
function Import-Assembly {
    <#
    	.SYNOPSIS
        Loads a given assembly by a more friendly name, while still using the strong 
        binding characteristics of Assembly.Load.
        
        .DESCRIPTION
        Assembly.LoadWithPartialName has been deprecated, as it binds only by display 
        name.  It's a convenient shortcut, but opens your application and script, and 
        environment  to all sorts of reliability issues, including: 
        backwards incompatibility, forwards incompatibility, breaking changes, 
        and subtle assembly dependency problems. 

        
        .PARAMETER Name
        Short name of Assembly to be loaded.  Can be one of the following:
            Forms
            Web
        
        .Example
        Import-Assembly Web

        .NOTES
        Author: Peter Wawa

    #>

    param (
            [Parameter(
                Mandatory=$true,
                Position=0
            )]
            [ValidateSet(
                "Web",
                "Forms"
            )]
            [String]
        $Name
    )

    ## Our assembly name shortcuts 
    $assemblyMappings = (
        ("Forms", "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"), 
        ("Web", "System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a") 
    )


    ## Load the assembly they request 
    ## This fails with an error message if this specific assembly version can't 
    ## be loaded. 
    foreach ($assembly in $assemblyMappings) { 
        if ($Name -eq $assembly[0]) { 
            [void] [Reflection.Assembly]::Load($assembly[1]) 
        } 
    }
}