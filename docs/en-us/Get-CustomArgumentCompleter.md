---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-CustomArgumentCompleter

## SYNOPSIS

Gets registered custom argument completers.

## SYNTAX

```
Get-CustomArgumentCompleter [[-Name] <String[]>] [-ExpandScriptBlocks]
```

## DESCRIPTION

The command gets custom argument completers, registered in the current session by the Register-ArgumentCompleter command.

## PARAMETERS

### -Name

Name of the custom argument completer.

If not specified, the command returns all registered custom argument completers.

The custom argument completer name format is following - "CommandName:ParameterName".

If during registration the name of the command was omitted, the name of the registered custom argument completer equals to parameter name without colon.

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

### Example 1: Get all custom argument completers

```powershell
Get-CustomArgumentCompleter
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name          …
Do-Something  Action        …
              SomeParameter …
```

The command gets all custom argument completers registered in the current session.

### Example 2: Get specified custom argument completers

```powershell
Get-CustomArgumentCompleter -Name Get-Something:Name
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name          …
```

The command gets specified custom argument completer.

### Example 3: Get custom argument completers and expand scriptblocks

```powershell
Get-CustomArgumentCompleter -Name Get-Something:Name -ExpandScriptBlocks
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name
                            $names = 'NameOne', 'NameTwo', 'NameThree'

                            foreach ($name in $names)
                            {
                                if ($name -like "$wordToComplete*")
                                {
                                    [System.Management.Automation.CompletionResult]::new($name)
                                }
                            }
```

The command gets specified custom argument completer and expands its scriptblock.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
