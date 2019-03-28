---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Remove-NativeArgumentCompleter

## SYNOPSIS

Removes specified registered native argument completers.

## SYNTAX

```
Remove-NativeArgumentCompleter [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION

The command removes specified native argument completers, registered in the current session by the Register-ArgumentCompleter command.

## PARAMETERS

### -Name

Name of the native argument completer.

The name of the native argument completer equals to the command name.

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

### Example 1: Remove specified native argument completer

```powershell
Remove-NativeArgumentCompleter -Name somecommand
```

The command removes specified native argument completer.

### Example 2: Remove native argument completer using the pipeline

```powershell
Get-NativeArgumentCompleter -Name anothercommand | Remove-NativeArgumentCompleter
```

The command removes native argument completer sent through the pipeline.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
