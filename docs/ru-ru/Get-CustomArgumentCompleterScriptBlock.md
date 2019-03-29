---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Get-CustomArgumentCompleterScriptBlock

## SYNOPSIS

Команда получает блок сценария механизма завершения аргументов типа Custom.

## SYNTAX

```
Get-CustomArgumentCompleterScriptBlock [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION

Команда получает блок сценария указанного механизма завершения аргументов типа Custom, зарегистрированного в текущей сессии при помощи команды Register-ArgumentCompleter.

## PARAMETERS

### -Name

Имя механизма завершения аргументов типа Custom.

Формат имени механизма завершения аргументов типа Custom следующий - "ИмяКоманды:ИмяПараметра".

Если при регистрации имя команды указано не было, имя механизма завершения будет соответствовать имени параметра без двоеточия.

Параметр поддерживает завершение значений при нажатии клавиши Tab.

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

### Пример 1: Получение блока сценария указанного механизма завершения аргументов типа Custom

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

Команда получает блок сценария указанного механизма завершения аргументов типа Custom.

### Пример 2: Получение блока сценария механизма завершения аргументов типа Custom, переданного через конвейер

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

Команда получает блок сценария переданного по конвейеру механизма завершения аргументов типа Custom.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
