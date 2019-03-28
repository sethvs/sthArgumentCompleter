---
external help file: sthArgumentCompleter.help.xml
Module Name: sthArgumentCompleter
online version:
schema: 2.0.0
---

# Remove-NativeArgumentCompleter

## SYNOPSIS

Команда удаляет указанные механизмы завершения аргументов типа Native.

## SYNTAX

```
Remove-NativeArgumentCompleter [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Команда удаляет указанные механизмы завершения аргументов типа Native, зарегистрированные в текущей сессии при помощи команды Register-ArgumentCompleter.

## PARAMETERS

### -Name

Имя механизма завершения аргументов типа Native.

Имя механизма завершения аргументов типа Native соответствует имени команды.

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

### Пример 1: Удаление указанного механизма завершения аргументов типа Native

```powershell
Remove-NativeArgumentCompleter -Name somecommand
```

Команда удаляет указанный механизм завершения аргументов типа Native.

### Пример 2: Удаление механизма завершения аргументов типа Native, переданного через конвейер

```powershell
Get-NativeArgumentCompleter -Name anothercommand | Remove-NativeArgumentCompleter
```

Команда удаляет переданный по конвейеру механизм завершения аргументов типа Native.

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
