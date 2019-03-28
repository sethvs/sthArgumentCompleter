Remove-Module -Name sthArgumentCompleter -Force -ErrorAction 'SilentlyContinue'
Import-Module "$PSScriptRoot\..\sthArgumentCompleter.psd1"

function inCreateTestEnvironment
{
    Register-ArgumentCompleter -CommandName CommandOne -ParameterName ParameterOne -ScriptBlock { 'Testing-11.' }
    Register-ArgumentCompleter -CommandName CommandOne -ParameterName ParameterTwo -ScriptBlock { 'Testing-12.' }
    Register-ArgumentCompleter -CommandName CommandTwo -ParameterName ParameterOne -ScriptBlock { 'Testing-21.' }
    Register-ArgumentCompleter -CommandName CommandTwo -ParameterName ParameterTwo -ScriptBlock { 'Testing-22.' }

    Register-ArgumentCompleter -ParameterName ParameterThree -ScriptBlock { 'Testing-3.' }

    Register-ArgumentCompleter -CommandName CommandThree -ScriptBlock { 'Testing-30.' }
    Register-ArgumentCompleter -CommandName CommandFour -ScriptBlock { 'Testing-40.' }
    Register-ArgumentCompleter -CommandName CommandFive -ScriptBlock { 'Testing-50.' }
}

function inClearArgumentCompleters
{
    Clear-CustomArgumentCompleters
    Clear-NativeArgumentCompleters
}

Describe "sthArgumentCompleter" {

    BeforeAll {
        inClearArgumentCompleters
        inCreateTestEnvironment
    }

    AfterAll {
        inClearArgumentCompleters
    }

    Context "Get-CustomArgumentCompleter" {

        It "Should get all Custom Argument Completers" {
            $CustomArgumentCompleters = Get-CustomArgumentCompleter
            $CustomArgumentCompleters | Should -HaveCount 5
        }

        It "Should get Custom Argument Completers by Name" {
            $CustomArgumentCompleters = Get-CustomArgumentCompleter -Name CommandOne:ParameterOne, CommandTwo:ParameterTwo, ParameterThree
            $CustomArgumentCompleters | Should -HaveCount 3
        }

        It "Should add type name when ExpandScriptBlocks used" {
            $CustomArgumentCompleters = Get-CustomArgumentCompleter -Name CommandOne:ParameterOne -ExpandScriptBlocks
            $CustomArgumentCompleters.pstypenames[0] | Should -BeExactly 'sth.CustomArgumentCompleter#Expand'
        }
    }

    Context "Get-NativeArgumentCompleter" {

        It "Should get all Native Argument Completers" {
            $NativeArgumentCompleters = Get-NativeArgumentCompleter
            $NativeArgumentCompleters | Should -HaveCount 3
        }

        It "Should get Native Argument Completers by Name" {
            $CustomArgumentCompleters = Get-NativeArgumentCompleter -Name CommandThree, CommandFour
            $CustomArgumentCompleters | Should -HaveCount 2
        }

        It "Should add type name when ExpandScriptBlocks used" {
            $CustomArgumentCompleters = Get-NativeArgumentCompleter -Name CommandThree -ExpandScriptBlocks
            $CustomArgumentCompleters.pstypenames[0] | Should -BeExactly 'sth.NativeArgumentCompleter#Expand'
        }
    }

    Context "Get-CustomArgumentCompleterScriptBlock" {

        It "Should get Custom Argument Completer ScriptBlock" {
            $ScriptBlock = Get-CustomArgumentCompleterScriptBlock -Name CommandOne:ParameterOne
            $ScriptBlock.ToString() | Should -BeExactly " 'Testing-11.' "
        }

        It "Should accept Custom Argument Completers from the pipeline" {
            $ScriptBlock = Get-CustomArgumentCompleter -Name CommandOne:ParameterTwo | Get-CustomArgumentCompleterScriptBlock
            $ScriptBlock.ToString() | Should -BeExactly " 'Testing-12.' "
        }

        It "Should return an error when Custom Argument Completer doesn't exist" {
            { Get-CustomArgumentCompleterScriptBlock -Name nonexistentArgumentCompleter -ErrorAction Stop } | Should -Throw -ErrorId 'ArgumentError'
        }
    }

    Context "Get-NativeArgumentCompleterScriptBlock" {
        
        It "Should get Native Argument Completer ScriptBlock" {
            $ScriptBlock = Get-NativeArgumentCompleterScriptBlock -Name CommandThree
            $ScriptBlock.ToString() | Should -BeExactly " 'Testing-30.' "
        }

        It "Should accept Native Argument Completers from the pipeline" {
            $ScriptBlock = Get-NativeArgumentCompleter -Name CommandFour | Get-NativeArgumentCompleterScriptBlock
            $ScriptBlock.ToString() | Should -BeExactly " 'Testing-40.' "
        }

        It "Should return an error when Native Argument Completer doesn't exist" {
            { Get-NativeArgumentCompleterScriptBlock -Name nonexistentArgumentCompleter -ErrorAction Stop } | Should -Throw -ErrorId 'ArgumentError'
        }
    }

    Context "Remove-CustomArgumentCompleter" {

        It "Should remove Custom Argument Completer by name" {
            Remove-CustomArgumentCompleter -Name CommandOne:ParameterOne
            Get-CustomArgumentCompleter | Should -HaveCount 4
        }

        It "Should accept Custom Argument Completers to delete from the pipeline" {
            Get-CustomArgumentCompleter -Name CommandOne:ParameterTwo | Remove-CustomArgumentCompleter
            Get-CustomArgumentCompleter -Name CommandOne:ParameterTwo | Should -BeNullOrEmpty
            Get-CustomArgumentCompleter | Should -HaveCount 3
        }

        It "Should return an error when Custom Argument Completer doesn't exist" {
            { Remove-CustomArgumentCompleter -Name CommandOne:ParameterOne -ErrorAction Stop } | Should -Throw -ErrorId 'ArgumentError'
        }
    }

    Context "Remove-NativeArgumentCompleter" {

        It "Should remove Native Argument Completer by name" {
            Remove-NativeArgumentCompleter -Name CommandThree
            Get-NativeArgumentCompleter | Should -HaveCount 2
        }

        It "Should accept Native Argument Completers to delete from the pipeline" {
            Get-NativeArgumentCompleter -Name CommandFour | Remove-NativeArgumentCompleter
            Get-NativeArgumentCompleter -Name CommandFour | Should -BeNullOrEmpty
            Get-NativeArgumentCompleter | Should -HaveCount 1
        }

        It "Should return an error when Native Argument Completer doesn't exist" {
            { Remove-NativeArgumentCompleter -Name CommandThree -ErrorAction Stop } | Should -Throw -ErrorId 'ArgumentError'
        }
    }

    Context "Clear-CustomArgumentCompleters" {

        It "Should clear Custom Argument Completers" {
            Clear-CustomArgumentCompleters
            Get-CustomArgumentCompleter | Should -BeNullOrEmpty
        }
    }

    Context "Clear-NativeArgumentCompleters" {

        It "Should clear Native Argument Completers" {
            Clear-NativeArgumentCompleters
            Get-NativeArgumentCompleter | Should -BeNullOrEmpty
        }
    }
}

Describe "ArgumentCompleterCompleters" {

    BeforeAll {
        inClearArgumentCompleters
        inCreateTestEnvironment
    }

    AfterAll {
        inClearArgumentCompleters
    }

    Context "Get-CustomArgumentCompleter" {

        It "Should complete Custom Argument Completer Name" {

            $command = 'Get-CustomArgumentCompleter -Name p'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'ParameterThree'
        }
    }

    Context "Get-CustomArgumentCompleterScriptBlock" {

        It "Should complete Custom Argument Completer Name" {

            $command = 'Get-CustomArgumentCompleterScriptBlock -Name p'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'ParameterThree'
        }
    }

    Context "Remove-CustomArgumentCompleter" {

        It "Should complete Custom Argument Completer Name" {

            $command = 'Remove-CustomArgumentCompleter -Name p'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'ParameterThree'
        }
    }

    Context "Get-NativeArgumentCompleter" {

        It "Should complete Native Argument Completer Name" {

            $command = 'Get-NativeArgumentCompleter -Name commandfi'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'CommandFive'
        }
    }

    Context "Get-NativeArgumentCompleterScriptBlock" {

        It "Should complete Native Argument Completer Name" {

            $command = 'Get-NativeArgumentCompleterScriptBlock -Name commandfi'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'CommandFive'
        }
    }

    Context "Remove-NativeArgumentCompleter" {

        It "Should complete Native Argument Completer Name" {

            $command = 'Remove-NativeArgumentCompleter -Name commandfi'
            $result = TabExpansion2 -inputScript $command -cursorColumn $command.Length
            $result.CompletionMatches.CompletionText | Should -BeExactly 'CommandFive'
        }
    }
}
