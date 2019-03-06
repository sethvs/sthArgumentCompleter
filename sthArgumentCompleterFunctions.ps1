function Get-CustomArgumentCompleter
{
    [CmdletBinding(DefaultParameterSetName='Name')]

    Param (
        [ArgumentCompleter([sthCustomArgumentCompleter])]
        [string]$Name
    )

    $argumentCompleters = inGetArgumentCompleter -Type Custom

    if ($Name)
    {
        $argumentCompleters.$Name
    }
    else
    {
        $argumentCompleters
    }
}

function Get-NativeArgumentCompleter
{
    Param (
        [ArgumentCompleter([sthNativeArgumentCompleter])]
        [string]$Name
    )
    
    $argumentCompleters = inGetArgumentCompleter -Type Native

    if ($Name)
    {
        $argumentCompleters.$Name
    }
    else
    {
        $argumentCompleters
    }
}

function Remove-CustomArgumentCompleter
{
    Param (
        [Parameter(Mandatory)]
        [ArgumentCompleter([sthCustomArgumentCompleter])]
        [string]$Name
    )

    $argumentCompleters = inGetArgumentCompleter -Type Custom

    if (!$argumentCompleters.Remove($Name))
    {
        inArgumentCompleterNotExist -Value $Name
    }
}

function Remove-NativeArgumentCompleter
{
    Param (
        [Parameter(Mandatory)]
        [ArgumentCompleter([sthNativeArgumentCompleter])]
        [string]$Name
    )

    $argumentCompleters = inGetArgumentCompleter -Type Native

    if (!$argumentCompleters.Remove($Name))
    {
        inArgumentCompleterNotExist -Value $Name
    }
}



function inGetArgumentCompleter
{
    Param (
        [Parameter(Mandatory)]
        [ValidateSet('Custom','Native')]
        $Type
    )

    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $_context = $ExecutionContext.GetType().GetField('_context',$flags).GetValue($ExecutionContext)

    if ($Type -eq 'Custom')
    {
        $_context.GetType().GetProperty('CustomArgumentCompleters',$flags).GetValue($_context)
    }
    else
    {
        $_context.GetType().GetProperty('NativeArgumentCompleters',$flags).GetValue($_context)
    }
}

function inArgumentCompleterNotExist
{
    Param(
        [string]$Value
    )

    $Exception = [System.ArgumentException]::new("There are no argument completer `"$Value`".")
    $ErrorId = 'ArgumentError'
    $ErrorCategory = [System.Management.Automation.ErrorCategory]::InvalidArgument

    $ErrorRecord = [System.Management.Automation.ErrorRecord]::new($Exception, $ErrorId, $ErrorCategory, $null)

    throw $ErrorRecord
}
