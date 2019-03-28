---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-NativeArgumentCompleter

## SYNOPSIS

Команда получает механизмы завершения аргументов типа Native.

## SYNTAX

```
Get-NativeArgumentCompleter [[-Name] <String[]>] [-ExpandScriptBlocks]
```

## DESCRIPTION

Команда получает механизмы завершения аргументов типа Native, зарегистрированные в текущей сессии при помощи команды Register-ArgumentCompleter.

## PARAMETERS

### -Name

Имя механизма завершения аргументов типа Native.

В случае, если имя не указано, команда получает все зарегистрированные механизмы завершения типа Native.

Имя механизма завершения аргументов типа Native соответствует имени команды.

Параметр поддерживает использование символов подстановки и завершение значений при нажатии клавиши Tab.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpandScriptBlocks

Параметр указывает, что блоки сценария механизмов завершения аргументов при выводе должны быть развернуты.

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

### Пример 1: Получение всех механизмов завершения аргументов типа Native

```powershell
Get-NativeArgumentCompleter
```

```
CommandName    ScriptBlock
-----------    -----------
somecommand    …
anothercommand …
```

Команда получает все механизмы завершения аргументов типа Native, зарегистрированные в текущей сессии.

### Пример 2: Получение указанных механизмов завершения аргументов типа Native

```powershell
Get-NativeArgumentCompleter -Name somecommand
```

```
CommandName ScriptBlock
----------- -----------
somecommand …
```

Команда получает указанный механизм завершения аргументов типа Native.

### Пример 3: Получение механизмов завершения аргументов типа Native и отображение их блоков сценария в развернутом виде

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

Команда получает указанный механизм завершения аргументов типа Native, отображая его блок сценария в развернутом виде.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
