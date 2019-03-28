---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-CustomArgumentCompleterScriptBlock

## SYNOPSIS

Gets scriptblock of the registered custom argument completer.

## SYNTAX

```
Get-CustomArgumentCompleterScriptBlock [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION

The command gets scriptblock of the specified custom argument completer, registered in the current session by the Register-ArgumentCompleter command.

## PARAMETERS

### -Name

Name of the custom argument completer.

The custom argument completer name format is following - "CommandName:ParameterName".

If during registration the name of the command was omitted, the name of the registered custom argument completer equals to parameter name without colon.

Parameter supports Tab completion.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## EXAMPLES

### Example 1: Get scriptblock of the specified custom argument completer

```powershell
Get-CustomArgumentCompleterScriptBlock -Name Get-Something:Name
```

```
$names = 'NameOne', 'NameTwo', 'NameThree'

foreach ($name in $names)
{
    if ($name -like "$wordToComplete*")
    {
        [System.Management.Automation.CompletionResult]::new($name)
    }
}
```

The command gets scriptblock of the specified custom argument completer.

### Example 2: Get scriptblock of custom argument completer using the pipeline

```powershell
Get-CustomArgumentCompleter -Name Do-Something:Action | Get-CustomArgumentCompleterScriptBlock
```

```
$actions = 'ActionOne', 'ActionTwo'

foreach ($action in $actions)
{
    if ($action -like "$wordToComplete*")
    {
        [System.Management.Automation.CompletionResult]::new($action)
    }
}
```

The command gets scriptblock of the custom argument completer sent through the pipeline.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
