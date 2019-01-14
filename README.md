# Citations
<!--
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://oxinabox.github.io/Citations.jl/stable)
[![Latest](https://img.shields.io/badge/docs-latest-blue.svg)](https://oxinabox.github.io/Citations.jl/latest)
[![Build Status](https://travis-ci.com/oxinabox/Citations.jl.svg?branch=master)](https://travis-ci.com/oxinabox/Citations.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/oxinabox/Citations.jl?svg=true)](https://ci.appveyor.com/project/oxinabox/Citations-jl)
[![Codecov](https://codecov.io/gh/oxinabox/Citations.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/oxinabox/Citations.jl)
[![Coveralls](https://coveralls.io/repos/github/oxinabox/Citations.jl/badge.svg?branch=master)](https://coveralls.io/github/oxinabox/Citations.jl?branch=master)
-->

## Retrieving citations

To find the citation for a thing, e.g. function, type, or module.
use the `cite(thing)` command.

### Declaring citations

#### Function

To declare a citation for a function attach it as a trait on the type of the function.
This is done
```
function thing()
#...
end

Citations.cite(::typeof(thing) = "2001, Jane Doe, Considerations of a Thing"
```

Or you can use the helper macro `@declare_citation`:

```
@declare_citation thing,  "2001, Jane Doe, Considerations of a Thing"
```

#### Module (e.g. package)
To declare a citation for a module,
declare a `cite` trait for the modules `eval` function.

```
Citation.cite(::typeof(MyModule.eval)) = "2019, Author, Package"
```

Or use the `@declare_citation` macro, with only one argument.
```
@declare_citation "2019, Author, Package"
```

## Using Citations.jl in your packages
Suppose you are Jane Doe, the maintainer of SomeCoolPackage.jl and you want your users to be able to cite your package as well as your two functions, `awesomefunction1` and `awesomefunction2`. You can import Citations.jl into your package and export  citation methods as follows
```julia
module SomeCoolPackage

using Citations 
using Citations: cite 

awesomefunction1(x) = "do cool stuff"
awesomefunction2(x) = "do other cool stuff"

@declare_citation SomeCoolPackage, "2019, Jane Doe, SomeCoolPackage.jl"
Citations.cite(::typeof(awesomefunction1)) = "2019, Jane Doe, awesomefunction1, SomeCoolPackage.jl"
Citations.cite(::typeof(awesomefunction2)) = "2019, Jane Doe, awesomefunction2, SomeCoolPackage.jl"
               

export cite, awesomefunction1, awesomefunction2

end
```
Your users can then easily generate citation info at the REPL
```julia
julia> using SomeCoolPackage

julia> cite(SomeCoolPackage)
(Main.SomeCoolPackage, "2019, Jane Doe, SomeCoolPackage.jl")

julia> cite(awesomefunction1)
"2019, Jane Doe, awesomefunction1, SomeCoolPackage.jl"

julia> cite(awesomefunction2)
"2019, Jane Doe, awesomefunction2, SomeCoolPackage.jl"
```
