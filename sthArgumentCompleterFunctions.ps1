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
        [string[]]$Name
    )

    $argumentCompleters = inGetArgumentCompleter -Type Custom

    foreach ($n in $Name)
    {
        if (!$argumentCompleters.Remove($n))
        {
            Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument
        }
    }
}

function Remove-NativeArgumentCompleter
{
    Param (
        [Parameter(Mandatory)]
        [ArgumentCompleter([sthNativeArgumentCompleter])]
        [string[]]$Name
    )

    $argumentCompleters = inGetArgumentCompleter -Type Native

    foreach ($n in $Name)
    {
        if (!$argumentCompleters.Remove($n))
        {
            Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument
        }
    }
}

function Clear-CustomArgumentCompleters
{
    $argumentCompleters = inGetArgumentCompleter -Type Custom

    if ($argumentCompleters)
    {
        $argumentCompleters.Clear()
    }
}

function Clear-NativeArgumentCompleters
{
    $argumentCompleters = inGetArgumentCompleter -Type Native

    if ($argumentCompleters)
    {
        $argumentCompleters.Clear()
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
