---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-NativeArgumentCompleter

## SYNOPSIS

Gets registered native argument completers.

## SYNTAX

```
Get-NativeArgumentCompleter [[-Name] <String[]>] [-ExpandScriptBlocks]
```

## DESCRIPTION

The command gets native argument completers, registered in the current session by the Register-ArgumentCompleter command.

## PARAMETERS

### -Name

Name of the native argument completer.

If not specified, the command returns all registered native argument completers.

The name of the native argument completer equals to the command name.

Parameter supports wildcards and Tab completion.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExpandScriptBlocks

Specfies, that scriptblocks should be expanded in the output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## EXAMPLES

### Example 1: Get all native argument completers

```powershell
Get-NativeArgumentCompleter
```

```
CommandName    ScriptBlock
-----------    -----------
somecommand    …
anothercommand …
```

The command gets all native argument completers registered in the current session.

### Example 2: Get specified native argument completers

```powershell
Get-NativeArgumentCompleter -Name somecommand
```

```
CommandName ScriptBlock
----------- -----------
somecommand …
```

The command gets specified native argument completer.

### Example 3: Get native argument completers and expand scriptblocks

```powershell
Get-NativeArgumentCompleter -Name somecommand -ExpandScriptBlocks
```

```
CommandName ScriptBlock
----------- -----------
somecommand
            $arguments = 'ArgumentOne', 'ArgumentTwo', 'ArgumentThree'

            foreach ($argument in $arguments)
            {
                if ($argument -like "$wordToComplete*")
                {
                    [System.Management.Automation.CompletionResult]::new($argument)
                }
            }
```

The command gets specified native argument completer and expands its scriptblock.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
