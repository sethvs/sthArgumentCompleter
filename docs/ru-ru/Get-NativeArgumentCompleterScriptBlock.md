---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-NativeArgumentCompleterScriptBlock

## SYNOPSIS

Команда получает блок сценария механизма завершения аргументов типа Native.

## SYNTAX

```
Get-NativeArgumentCompleterScriptBlock [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION

Команда получает блок сценария указанного механизма завершения аргументов типа Native, зарегистрированного в текущей сессии при помощи команды Register-ArgumentCompleter.

## PARAMETERS

### -Name

Имя механизма завершения аргументов типа Native.

Имя механизма завершения аргументов типа Native соответствует имени команды.

Параметр поддерживает завершение значений при нажатии клавиши Tab.

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

### Пример 1: Получение блока сценария указанного механизма завершения аргументов типа Native

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

Команда получает блок сценария указанного механизма завершения аргументов типа Native.

### Пример 2: Получение блока сценария механизма завершения аргументов типа Native, переданного через конвейер

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

Команда получает блок сценария переданного по конвейеру механизма завершения аргументов типа Native.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
