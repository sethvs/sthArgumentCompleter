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

        $values = @()
        [System.Collections.Generic.List[String]]$valuesToExclude = $null

        $commandParameterAst = $commandAst.Find({$args[0].GetType().Name -eq 'CommandParameterAst' -and $args[0].ParameterName -eq $parameterName}, $false)
        $i = $commandAst.CommandElements.IndexOf($commandParameterAst)

        if (($parameterValueAst = $commandAst.CommandElements[$i+1]))
        {
            if ($parameterValueAst.GetType().Name -eq 'ArrayLiteralAst')
            {
                $values = $parameterValueAst.Elements
            }
            elseif ($parameterValueAst.GetType().Name -eq 'ErrorExpressionAst')
            {
                $values = $parameterValueAst.NestedAst
            }

            if ($values)
            {
                $valuesToExclude = $values |
                Where-Object { $_.GetType().Name -eq 'StringConstantExpressionAst' } |
                ForEach-Object { $_.SafeGetValue() }

                if ($wordToComplete)
                {
                    $valuesToExclude.Remove($wordToComplete) | Out-Null
                }
            }
        }

        foreach ($key in $argumentCompleters.Keys)
        {
            if ($key -like "$wordToComplete*" -and $key -notin $valuesToExclude)
            {
                $result.Add([System.Management.Automation.CompletionResult]::new($key))
            }
        }

        return $result
    }
}
