---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Remove-CustomArgumentCompleter

## SYNOPSIS

Команда удаляет указанные механизмы завершения аргументов типа Custom.

## SYNTAX

```
Remove-CustomArgumentCompleter [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Команда удаляет указанные механизмы завершения аргументов типа Custom, зарегистрированные в текущей сессии при помощи команды Register-ArgumentCompleter.

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
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## EXAMPLES

### Example 1: Удаление указанного механизма завершения аргументов типа Custom

```powershell
Remove-CustomArgumentCompleter -Name Get-Something:Name
```

Команда удаляет указанный механизм завершения аргументов типа Custom.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
