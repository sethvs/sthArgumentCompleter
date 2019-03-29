# sthArgumentCompleter
[![Build Status](https://dev.azure.com/sethv/seth/_apis/build/status/sthArgumentCompleter?branchName=master)](https://dev.azure.com/sethv/seth/_build/latest?definitionId=8&branchName=master)

**sthArgumentCompleter** - is a module for working with argument completers registered by Register-ArgumentCompleter cmdlet.

It contains following functions:

[**Get-CustomArgumentCompleter**](#get-customargumentcompleter) - Gets registered custom argument completers.

[**Get-NativeArgumentCompleter**](#get-nativeargumentcompleter) - Gets registered native argument completers.

[**Get-CustomArgumentCompleterScriptBlock**](#get-customargumentcompleterscriptblock) - Gets scriptblock of the registered custom argument completer.

[**Get-NativeArgumentCompleterScriptBlock**](#get-nativeargumentcompleterscriptblock) - Gets scriptblock of the registered native argument completer.

[**Remove-CustomArgumentCompleter**](#remove-customargumentcompleter) - Removes specified registered custom argument completers.

[**Remove-NativeArgumentCompleter**](#remove-nativeargumentcompleter) - Removes specified registered native argument completers.

[**Clear-CustomArgumentCompleters**](#clear-customargumentcompleters) - Clears all of the registered custom argument completers.

[**Clear-NativeArgumentCompleters**](#clear-nativeargumentcompleters) - Clears all of the registered native argument completers.

## How to install it?

You can install sthArgumentCompleter module from PowerShell Gallery:

```
Install-Module sthArgumentCompleter
```

## How to use it?

### Get-CustomArgumentCompleter

#### Example 1: Get all custom argument completers

The command gets all custom argument completers registered in the current session.

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

---

#### Example 2: Get specified custom argument completers

The command gets specified custom argument completer.

```powershell
Get-CustomArgumentCompleter -Name Get-Something:Name
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name          …
```

---

#### Example 3: Get custom argument completers and expand scriptblocks

The command gets specified custom argument completer and expands its scriptblock.

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

### Get-NativeArgumentCompleter

#### Example 1: Get all native argument completers

The command gets all native argument completers registered in the current session.

```powershell
Get-NativeArgumentCompleter
```

```
CommandName    ScriptBlock
-----------    -----------
somecommand    …
anothercommand …
```

---

#### Example 2: Get specified native argument completers

The command gets specified native argument completer.

```powershell
Get-NativeArgumentCompleter -Name somecommand
```

```
CommandName ScriptBlock
----------- -----------
somecommand …
```

---

#### Example 3: Get native argument completers and expand scriptblocks

The command gets specified native argument completer and expands its scriptblock.

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

### Get-CustomArgumentCompleterScriptBlock

#### Example 1: Get scriptblock of the specified custom argument completer

The command gets scriptblock of the specified custom argument completer.

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

---

#### Example 2: Get scriptblock of custom argument completer using the pipeline

The command gets scriptblock of the custom argument completer sent through the pipeline.

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

### Get-NativeArgumentCompleterScriptBlock

#### Example 1: Get scriptblock of the specified native argument completer

The command gets scriptblock of the specified native argument completer.

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

---

#### Example 2: Get scriptblock of native argument completer using the pipeline

The command gets scriptblock of the native argument completer sent through the pipeline.

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

### Remove-CustomArgumentCompleter

#### Example 1: Remove specified custom argument completer

The command removes specified custom argument completer.

```powershell
Remove-CustomArgumentCompleter -Name Get-Something:Name
```

---

#### Example 2: Remove custom argument completer using the pipeline

The command removes custom argument completer sent through the pipeline.

```powershell
Get-CustomArgumentCompleter -Name Do-Something:Action | Remove-CustomArgumentCompleter
```

### Remove-NativeArgumentCompleter

#### Example 1: Remove specified native argument completer

The command removes specified native argument completer.

```powershell
Remove-NativeArgumentCompleter -Name somecommand
```

---

#### Example 2: Remove native argument completer using the pipeline

The command removes native argument completer sent through the pipeline.

```powershell
Get-NativeArgumentCompleter -Name anothercommand | Remove-NativeArgumentCompleter
```

### Clear-CustomArgumentCompleters

#### Example 1: Clear all of the registered custom argument completers

The command clears all of the registered custom argument completers.

```powershell
Clear-CustomArgumentCompleters
```

### Clear-NativeArgumentCompleters

#### Example 1: Clear all of the registered native argument completers

The command clears all of the registered native argument completers.

```powershell
Clear-NativeArgumentCompleters
```
