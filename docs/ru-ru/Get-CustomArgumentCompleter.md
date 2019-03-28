---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-CustomArgumentCompleter

## SYNOPSIS

Команда получает механизмы завершения аргументов типа Custom.

## SYNTAX

```
Get-CustomArgumentCompleter [[-Name] <String[]>] [-ExpandScriptBlocks]
```

## DESCRIPTION

Команда получает механизмы завершения аргументов типа Custom, зарегистрированные в текущей сессии при помощи команды Register-ArgumentCompleter.

## PARAMETERS

### -Name

Имя механизма завершения аргументов типа Custom.

В случае, если имя не указано, команда получает все зарегистрированные механизмы завершения типа Custom.

Формат имени механизма завершения аргументов типа Custom следующий - "ИмяКоманды:ИмяПараметра".

Если при регистрации имя команды указано не было, имя механизма завершения будет соответствовать имени параметра без двоеточия.

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

### Пример 1: Получение всех механизмов завершения аргументов типа Custom

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

Команда получает все механизмы завершения аргументов типа Custom, зарегистрированные в текущей сессии.

### Пример 2: Получение указанных механизмов завершения аргументов типа Custom

```powershell
Get-CustomArgumentCompleter -Name Get-Something:Name
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name          …
```

Команда получает указанный механизм завершения аргументов типа Custom.

### Пример 3: Получение механизмов завершения аргументов типа Custom и отображение их блоков сценария в развернутом виде

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

Команда получает указанный механизм завершения аргументов типа Custom, отображая его блок сценария в развернутом виде.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
