# <img src="https://cdn.jsdelivr.net/gh/brunoyb/chocolatey-packages@ef3e7280d17af850e074ec9c47629076719b81dc/haskell-stack/icon.png" width="48" height="48" /> [Haskell Stack](https://chocolatey.org/packages/haskell-stack)


Stack is a cross-platform build tool for Haskell that handles management of the toolchain (including the GHC compiler and MSYS2 on Windows), building and registering libraries, and more.

## Features

* Installing GHC automatically, in an isolated location.
* Installing packages needed for your project.
* Building your project.
* Testing your project.
* Benchmarking your project.

The links provided with the package are related to The Haskell Tool Stack, if you're looking for help learning Haskell itself, start with the [Documentation](https://www.haskell.org/documentation).

## Package parameters

The following package parameters can be set:

* `NoLocalBinOnPath` - this disables putting %APPDATA%\local\bin on Path. You usually want this if you configure your local-bin-path to other than the default.
* `NoStackRoot` - this disables setting STACK_ROOT to %SystemDrive%\sr (e.g. C:\sr) to workaround issues with long paths. It is recommended that you leave this enabled.

These parameters can be passed to the installer with the use of `-params`.
For example: `-params '"/NoLocalBinOnPath /NoStackRoot"'`.
