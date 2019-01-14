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
Citation.cite(::typeof(MyModule.eval)) = "2019, Author, Package
```

Or use the `@declare_citation` macro, with only one argument.
```
@declare_citation "2019, Author, Package
```

