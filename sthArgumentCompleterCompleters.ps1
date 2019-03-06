class sthCustomArgumentCompleter : System.Management.Automation.IArgumentCompleter
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

        $argumentCompleters = inGetArgumentCompleter -Type Custom

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

