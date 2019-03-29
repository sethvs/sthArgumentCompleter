class sthArgumentCompleter : System.Management.Automation.IArgumentCompleter
{
    [System.Collections.Generic.IEnumerable[System.Management.Automation.CompletionResult]] CompleteArgument(
        [string] $commandName,
        [string] $parameterName,
        [string] $wordToComplete,
        [System.Management.Automation.Language.CommandAst] $commandAst,
        [System.Collections.IDictionary] $fakeBoundParameters
    )
    {
        $result = New-Object -TypeName "System.Collections.Generic.List[System.Management.Automation.CompletionResult]"

        $type = 'Custom'
        if ($commandName.Contains('Native'))
        {
            $type = 'Native'
        }

        $argumentCompleters = inGetArgumentCompleter -Type $type

        foreach ($key in $argumentCompleters.Keys)
        {
            if ($wordToComplete)
            {
                if ($key -like "$wordToComplete*" -and $key -notin ($fakeBoundParameters.$parameterName | Where-Object {$_ -ne $wordToComplete} ))
                {
                    $result.Add([System.Management.Automation.CompletionResult]::new($key))
                }
            }
            else
            {
                $commandParameterAst = $commandAst.Find({$args[0].GetType().Name -eq 'CommandParameterAst' -and $args[0].ParameterName -eq $parameterName}, $false)
                $i = $commandAst.CommandElements.IndexOf($commandParameterAst)
                if (($parameterValueAst = $commandAst.CommandElements[$i+1]) -and ($parameterValueAst.GetType().Name -eq 'ErrorExpressionAst'))
                {
                    $values = $parameterValueAst.NestedAst | 
                        Where-Object { $_.GetType().Name -eq 'StringConstantExpressionAst' } |
                        ForEach-Object { $_.SafeGetValue() }

                    if ($key -notin $values)
                    {
                        $result.Add([System.Management.Automation.CompletionResult]::new($key))
                    }
                }
                else
                {
                    $result.Add([System.Management.Automation.CompletionResult]::new($key))
                }
            }
        }

        return $result
    }
}
<# 
class sthNativeArgumentCompleter : System.Management.Automation.IArgumentCompleter
{
    [System.Collections.Generic.IEnumerable[System.Management.Automation.CompletionResult]] CompleteArgument(
        [string] $commandName,
        [string] $parameterName,
        [string] $wordToComplete,
        [System.Management.Automation.Language.CommandAst] $commandAst,
        [System.Collections.IDictionary] $fakeBoundParameters
    )
    {
        $result = New-Object -TypeName "System.Collections.Generic.List[System.Management.Automation.CompletionResult]"

        $argumentCompleters = inGetArgumentCompleter -Type Native

        foreach ($key in $argumentCompleters.Keys)
        {
            if ($key -like "$wordToComplete*")
            {
                $result.Add([System.Management.Automation.CompletionResult]::new($key))
            }
        }

        return $result
    }
}
 #>
