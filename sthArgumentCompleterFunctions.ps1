# .externalhelp sthArgumentCompleter.help.xml
function Get-CustomArgumentCompleter
{
    Param (
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name,
        [switch]$ExpandScriptBlocks
    )

    $argumentCompleters = inGetArgumentCompleter -Type Custom

    foreach ($a in $($argumentCompleters.GetEnumerator()))
    {
        if ($Name)
        {
            foreach ($n in $Name)
            {
                if ($a.Key -like $n)
                {
                    inCreateArgumentCompleterCustomObject -argumentCompleter $a -expandScriptBlocks $ExpandScriptBlocks -type Custom
                    break
                }
            }
        }
        else
        {
            inCreateArgumentCompleterCustomObject -argumentCompleter $a -expandScriptBlocks $ExpandScriptBlocks -type Custom
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Get-NativeArgumentCompleter
{
    Param (
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name,
        [switch]$ExpandScriptBlocks
    )

    $argumentCompleters = inGetArgumentCompleter -Type Native

    foreach ($a in $($argumentCompleters.GetEnumerator()))
    {
        if ($Name)
        {
            foreach ($n in $Name)
            {
                if ($a.Key -like $n)
                {
                    inCreateArgumentCompleterCustomObject -argumentCompleter $a -expandScriptBlocks $ExpandScriptBlocks -type Native
                    break
                }
            }
        }
        else
        {
            inCreateArgumentCompleterCustomObject -argumentCompleter $a -expandScriptBlocks $ExpandScriptBlocks -type Native
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Get-CustomArgumentCompleterScriptBlock
{
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name
    )

    begin
    {
        $argumentCompleters = inGetArgumentCompleter -Type Custom
        [scriptblock]$scriptBlock = $null
    }

    process
    {
        foreach ($n in $Name)
        {
            if ($argumentCompleters.TryGetValue($n,[ref]$scriptBlock))
            {
                $scriptBlock
            }
            else
            {
                Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument 
            }
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Get-NativeArgumentCompleterScriptBlock
{
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name
    )

    begin
    {
        $argumentCompleters = inGetArgumentCompleter -Type Native
        [scriptblock]$scriptBlock = $null
    }

    process
    {
        foreach ($n in $Name)
        {        
            if ($argumentCompleters.TryGetValue($n,[ref]$scriptBlock))
            {
                $ScriptBlock
            }
            else
            {
                Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument
            }
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Remove-CustomArgumentCompleter
{
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name
    )

    begin
    {
        $argumentCompleters = inGetArgumentCompleter -Type Custom
    }

    process
    {
        foreach ($n in $Name)
        {
            if (!$argumentCompleters.Remove($n))
            {
                Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument
            }
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Remove-NativeArgumentCompleter
{
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter([sthArgumentCompleter])]
        [string[]]$Name
    )

    begin
    {
        $argumentCompleters = inGetArgumentCompleter -Type Native
    }

    process
    {
        foreach ($n in $Name)
        {
            if (!$argumentCompleters.Remove($n))
            {
                Write-Error -Message "There are no argument completer `"$n`"." -ErrorId "ArgumentError" -Category InvalidArgument
            }
        }
    }
}

# .externalhelp sthArgumentCompleter.help.xml
function Clear-CustomArgumentCompleters
{
    $argumentCompleters = inGetArgumentCompleter -Type Custom

    if ($argumentCompleters)
    {
        $argumentCompleters.Clear()
    }
}

# .externalhelp sthArgumentCompleter.help.xml
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

function inCreateArgumentCompleterCustomObject
{
    Param (
        $argumentCompleter,
        [Parameter(Mandatory)]
        [ValidateSet('Custom','Native')]
        $type,
        $ExpandScriptBlocks
    )

    if ($type -eq 'Custom')
    {
        if (($i = $argumentCompleter.Key.IndexOf(":")) -ge 0)
        {
            $commandName = $argumentCompleter.Key.Substring(0, $i)
            $parameterName = $argumentCompleter.Key.Substring($i + 1)
        }
        else
        {
            $commandName = $null
            $parameterName = $argumentCompleter.Key
        }

        $object = [PSCustomObject]@{
            Name = $argumentCompleter.Key
            CommandName = $commandName
            ParameterName = $parameterName
            ScriptBlock = $argumentCompleter.Value
        } | Add-Member -TypeName 'sth.CustomArgumentCompleter' -PassThru
    }
    else
    {
        $object = [PSCustomObject]@{
            Name = $argumentCompleter.Key
            CommandName = $argumentCompleter.Key
            ScriptBlock = $argumentCompleter.Value
        } | Add-Member -TypeName 'sth.NativeArgumentCompleter' -PassThru
    }

    if ($ExpandScriptBlocks)
    {
        $object | Add-Member -TypeName ($object.pstypenames[0] + '#Expand')
    }

    $object
}
