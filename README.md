GOFORMAT
========================

NAME
----
goformat - Alternative to gofmt with configurable formatting style (indentation, etc.)

SYNOPSIS
--------

    goformat [options]            # read from stdin; code fragment allowed
    goformat [options] file ...   # single file; must be a complete source file
    goformat [options] dir ...    # recursive directory traversal (only files with ".go" extension)

DESCRIPTION
-----------
goformat is a code auto-formatter/indenter/pretty-printer/beautifier like gofmt. If used with the same command line arguments, it will produce the exact same output as gofmt. However unlike gofmt it allows you to customize the style (in particular the indentation) it uses to format code.

OPTIONS
--------

###  -cpuprofile file
Write CPU profile to this file (for performance analysis with go tool pprof).
        
###  -d
Output diff between original and reformatted code to stdout. May be combined with -w, so that the reformatted code is written to the original file and the diff to stdout.

###  -e
Report all parse errors. By default only the first 10 errors on different lines are reported.

###  -fragment
When operating on files/directories, goformat by default expects them to be complete go source files (with package keyword etc.) and reports incomplete code as errors. With this switch, goformat accepts partial code fragments, e.g. a single function or if-block. The code still needs to be "somewhat" complete. If you could paste the fragment either after the package line or into a function of a proper Go source file, then the fragment is acceptable.

When processing a code fragment, goformat will attempt to add back the initial indentation of the code fragment after doing its formatting, so that a code block cut from a larger piece of code can be formatted and then pasted at the original position and the indentation will fit.

This operation mode is default when processing input from stdin.

###  -l
List files whose formatting differs from goformat's on stdout. May be combined with -w so that the reformatted code is written to the original file and then list of changed files is printed to stdout.

###  -r rule
Apply rewrite rule to code. See section below for explanation of rewrite rules.
        
###  -s
Simplify code without changing its semantics. This

### -style file
### -style "code"
Change the formatting rules. You can pass either the path of a file containing the style description or the style description itself. In the latter case make sure you use appropriate shell quoting to escape whitespace. See the section below for a description of the style language.

###  -w
Overwrite source file(s) with formatted result instead of printing the code to standard output. Files with parse errors (in particular files that are not actually Go source code) will not be modified. Note that when traversing directories goformat will only look at files with ".go" extension.

REWRITE RULES
-------------
rewrite rule (e.g., 'a[b:len(a)] -> a[b:]')

CODE SIMPLIFICATION
-------------------
When the -s option is used, the following simplifications will be performed on the code:

An array, slice, or map composite literal of the form:

    []T{T{}, T{}}

will be simplified to:

    []T{{}, {}}

A slice expression of the form:

    s[a:len(s)]

will be simplified to:

    s[a:]

A range of the form:

    for x, _ = range v {...}
    
will be simplified to:

    for x = range v {...}

A range of the form:

    for _ = range v {...}

will be simplified to:
    
    for range v {...}

*This may result in changes that are incompatible with earlier versions of Go.*

STYLE LANGUAGE
--------------

AUTHOR
------
The Go Authors (original gofmt code goformat is based on)
Matthias S. Benkmann, <msb@winterdrache.de> (style configurability)
