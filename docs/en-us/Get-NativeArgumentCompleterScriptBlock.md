---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-NativeArgumentCompleterScriptBlock

## SYNOPSIS

Gets scriptblock of the registered native argument completer.

## SYNTAX

```
Get-NativeArgumentCompleterScriptBlock [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION

The command gets scriptblock of the specified native argument completer, registered in the current session by the Register-ArgumentCompleter command.

## PARAMETERS

### -Name

Name of the native argument completer.

The name of the native argument completer equals to the command name.

Parameter supports Tab completion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## EXAMPLES

### Example 1: Get scriptblock of the specified native argument completer

```powershell
Get-NativeArgumentCompleterScriptBlock -Name somecommand
```

```
$arguments = 'ArgumentOne', 'ArgumentTwo', 'ArgumentThree'

foreach ($argument in $arguments)
{
    if ($argument -like "$wordToComplete*")
    {
        [System.Management.Automation.CompletionResult]::new($argument)
    }
}
```

The command gets scriptblock of the specified native argument completer.

### Example 2: Get scriptblock of native argument completer using the pipeline

```powershell
Get-NativeArgumentCompleter -Name anothercommand | Get-NativeArgumentCompleterScriptBlock
```

```
$arguments = 'ArgumentOne', 'ArgumentTwo'

foreach ($argument in $arguments)
{
    if ($argument -like "$wordToComplete*")
    {
        [System.Management.Automation.CompletionResult]::new($argument)
    }
}
```

The command gets scriptblock of the native argument completer sent through the pipeline.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
