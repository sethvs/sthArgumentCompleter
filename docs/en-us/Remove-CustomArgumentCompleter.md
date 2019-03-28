---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Remove-CustomArgumentCompleter

## SYNOPSIS

Removes specified registered custom argument completers.

## SYNTAX

```
Remove-CustomArgumentCompleter [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION

The command removes specified custom argument completers, registered in the current session by the Register-ArgumentCompleter command.

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
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## EXAMPLES

### Example 1: Remove specified custom argument completer

```powershell
Remove-CustomArgumentCompleter -Name Get-Something:Name
```

The command removes specified custom argument completer.

### Example 2: Remove custom argument completer using the pipeline

```powershell
Get-CustomArgumentCompleter -Name Do-Something:Action | Remove-CustomArgumentCompleter
```

The command removes custom argument completer sent through the pipeline.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
