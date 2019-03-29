# sthArgumentCompleter

**sthArgumentCompleter** - это модуль для работы с механизмами завершения аргументов, зарегистрированными при помощи команды Register-ArgumentCompleter.

В модуль входят следующие функции:

[**Get-CustomArgumentCompleter**](#get-customargumentcompleter) - Получает механизмы завершения аргументов типа Custom.

[**Get-NativeArgumentCompleter**](#get-nativeargumentcompleter) - Получает механизмы завершения аргументов типа Native.

[**Get-CustomArgumentCompleterScriptBlock**](#get-customargumentcompleterscriptblock) - Получает блок сценария механизма завершения аргументов типа Custom.

[**Get-NativeArgumentCompleterScriptBlock**](#get-nativeargumentcompleterscriptblock) - Получает блок сценария механизма завершения аргументов типа Native.

[**Remove-CustomArgumentCompleter**](#remove-customargumentcompleter) - Удаляет указанные механизмы завершения аргументов типа Custom.

[**Remove-NativeArgumentCompleter**](#remove-nativeargumentcompleter) - Удаляет указанные механизмы завершения аргументов типа Native.

[**Clear-CustomArgumentCompleters**](#clear-customargumentcompleters) - Удаляет все зарегистрированные механизмы завершения аргументов типа Custom.

[**Clear-NativeArgumentCompleters**](#clear-nativeargumentcompleters) - Удаляет все зарегистрированные механизмы завершения аргументов типа Native.

## Как его установить?

Вы можете установить модуль sthArgumentCompleter из PowerShell Gallery:

```
Install-Module sthArgumentCompleter
```

## Как с ним работать?

### Get-CustomArgumentCompleter

#### Пример 1: Получение всех механизмов завершения аргументов типа Custom

Команда получает все механизмы завершения аргументов типа Custom, зарегистрированные в текущей сессии.

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

#### Пример 2: Получение указанных механизмов завершения аргументов типа Custom

Команда получает указанный механизм завершения аргументов типа Custom.

```powershell
Get-CustomArgumentCompleter -Name Get-Something:Name
```

```
CommandName   ParameterName ScriptBlock
-----------   ------------- -----------
Get-Something Name          …
```

---

#### Пример 3: Получение механизмов завершения аргументов типа Custom и отображение их блоков сценария в развернутом виде

Команда получает указанный механизм завершения аргументов типа Custom, отображая его блок сценария в развернутом виде.

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

#### Пример 1: Получение всех механизмов завершения аргументов типа Native

Команда получает все механизмы завершения аргументов типа Native, зарегистрированные в текущей сессии.

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

#### Пример 2: Получение указанных механизмов завершения аргументов типа Native

Команда получает указанный механизм завершения аргументов типа Native.

```powershell
Get-NativeArgumentCompleter -Name somecommand
```

```
CommandName ScriptBlock
----------- -----------
somecommand …
```

---

#### Пример 3: Получение механизмов завершения аргументов типа Native и отображение их блоков сценария в развернутом виде

Команда получает указанный механизм завершения аргументов типа Native, отображая его блок сценария в развернутом виде.

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

#### Пример 1: Получение блока сценария указанного механизма завершения аргументов типа Custom

Команда получает блок сценария указанного механизма завершения аргументов типа Custom.

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

#### Пример 2: Получение блока сценария механизма завершения аргументов типа Custom, переданного через конвейер

Команда получает блок сценария переданного по конвейеру механизма завершения аргументов типа Custom.

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

#### Пример 1: Получение блока сценария указанного механизма завершения аргументов типа Native

Команда получает блок сценария указанного механизма завершения аргументов типа Native.

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

#### Пример 2: Получение блока сценария механизма завершения аргументов типа Native, переданного через конвейер

Команда получает блок сценария переданного по конвейеру механизма завершения аргументов типа Native.

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

#### Пример 1: Удаление указанного механизма завершения аргументов типа Custom

Команда удаляет указанный механизм завершения аргументов типа Custom.

```powershell
Remove-CustomArgumentCompleter -Name Get-Something:Name
```

---

#### Пример 2: Удаление механизма завершения аргументов типа Custom, переданного через конвейер

Команда удаляет переданный по конвейеру механизм завершения аргументов типа Custom.

```powershell
Get-CustomArgumentCompleter -Name Do-Something:Action | Remove-CustomArgumentCompleter
```

### Remove-NativeArgumentCompleter

#### Пример 1: Удаление указанного механизма завершения аргументов типа Native

Команда удаляет указанный механизм завершения аргументов типа Native.

```powershell
Remove-NativeArgumentCompleter -Name somecommand
```

---

#### Пример 2: Удаление механизма завершения аргументов типа Native, переданного через конвейер

Команда удаляет переданный по конвейеру механизм завершения аргументов типа Native.

```powershell
Get-NativeArgumentCompleter -Name anothercommand | Remove-NativeArgumentCompleter
```

### Clear-CustomArgumentCompleters

#### Пример 1: Удаление всех зарегистрированных механизмов завершения аргументов типа Custom

Команда удаляет все зарегистрированные механизмы завершения аргументов типа Custom.

```powershell
Clear-CustomArgumentCompleters
```

### Clear-NativeArgumentCompleters

#### Пример 1: Удаление всех зарегистрированных механизмов завершения аргументов типа Native

Команда удаляет все зарегистрированные механизмы завершения аргументов типа Native.

```powershell
Clear-NativeArgumentCompleters
```
