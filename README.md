# lgeo

[![][lgeo-logo]][lgeo-logo-large]

[lgeo-logo]: resources/images/lgeo-250x.png
[lgeo-logo-large]: resources/images/lgeo-1000x.png

*LFE/Erlang GIS Bindings for GDAL/OGR*

#### Table of Contents

* [Introduction](#introduction-)
* [Installation](#installation-)
  * [Linux/BSD](#linuxbsd-)
  * [Windows](#on-windows-)
* [Configuration](#configuration-)
* [Examples](#examples-)
* [Documentation](#documentation-)
* [License](#license-)


**NOTICE**: Work in progress; partial OGR support; no GDAL support


## Introduction [&#x219F;](#table-of-contents)

This project is an experiment for solving GIS problems on the Erlang VM, particularly, doing so in LFE.

It is based on the work originally done by @caroman in his [erlogr](https://github.com/caroman/erlogr) project. Unfortunately, that code base was written for Erlang R13 and hasn't been updated for 18.x (neither, it seems, does it work on 15.x). The erloger project focused entirely upon OGR, the vector part of GDAL. I'm still trying to sort out the Erlang C ports for OGR, but I have a greater interest in the raster side of things (e.g., satellite data), so I'm going to be putting most of my efforts into getting a few bits of GDAL-proper up and runnnig.

The only functions from the erlogr project that were written in Erlang were NIF wrappers. In lgeo, these have been rewritten in LFE (essentially one line of code, each). Additionally, though, lgeo is providing NIF wrappers organized along the same lines as the [Python bindings](http://gdal.org/python/), and to a lesser extent, the [C++ library](http://gdal.org/1.11/annotated.html). LFE/Erlang doesn't have namespaces, though, so this is "faked" though a dotted file/module naming convention, such as ``gdal.dataset`` and functions like ``gdal.dataset:open``.

There are three main "namespaces" for the lgeo project:

* ``lgeo``/``lgeo.*`` - top-level modules and function that relate specifically to
  the lgeo project
* ``gdal``/``gdal.*`` - modules and function from GDAL (specifically, ``gdal.h``)
  the lgeo project
* ``ogr``/``ogr.*`` - modules and function from GDAL (specifically, ``ogr_api.h``)
  the lgeo project

Note that it may become necessary in the future to include a fourth: a namespace for
the PROJ4 library.


## Installation [&#x219F;](#table-of-contents)


### Linux/BSD [&#x219F;](#table-of-contents)

Build it with:

```bash
$ make
```

Run tests with:

```bash
$ make check
```


### On Windows [&#x219F;](#table-of-contents)

You need to have GDAL installed, let's say it was installed to `C:\cygwin\opt\gdal`.

Open a shell which has all compilers and the MSVC environment set up (e.g. the
Windows SDK 7.1 Command Prompt).

Now set it up so that GDAL and Erlang can be found:

```cmd
SET INCLUDE=%INCLUDE%;C:\cygwin\opt\gdal\include;C:\cygwin\opt\gdal\include\gdal
SET LIB=%LIB%;C:\cygwin\opt\gdal\lib
SET PATH=%PATH%;C:\cygwin\opt\gdal\bin;C:\erl5.9.1\bin
```

And finally compile the whole thing:

```bash
$ make
```


## Configuration [&#x219F;](#table-of-contents)

TBD


## Examples [&#x219F;](#table-of-contents)

For more examples and API docs, see the [Documentation](#documentation-).

Here's an example session in the LFE REPL:

```bash
$ make repl

Erlang/OTP 17 [erts-6.2] [source] [64-bit] [smp:4:4] [async-threads:10] ...

LFE Shell V6.2 (abort with ^G)
>
```

Project versions:

```cl
> (lgeo:version)
(#(erlang "18")
 #(emulator "7.1")
 #(driver-version "3.2")
 #(lfe "0.10.1")
 #(lutil "0.7.0")
 #(gdal/ogr "1.11.2")
 #(lgeo "0.2.0-dev"))
```

GDAL metadata:

```cl
> (gdal:version)
"1.11.2"
> (gdal:release-date)
"20150210"
> (gdal:version-str)
"GDAL 1.11.2, released 2015/02/10"
> (gdal:format-build-info)
PAM_ENABLED=YES
OGR_ENABLED=YES
ok
> (gdal:format-license)

GDAL/OGR
--------
GDAL/OGR is released under the MIT/X license.
The LICENSE.TXT distributed with GDAL/OGR should
contain additional details.


lgeo
----
Apache License, Version 2.0

ok
```

OGR operations:

```cl
> (set driver (ogr.driver:get 0))

> (ogr.driver:get-name driver)

```

Old Erlang example:

```erlang
    1> Driver = erlogr:get_driver(0),
    1> erlogr:dr_get_name(Driver).
    "ESRI Shapefile"

    2> Driver = erlogr:get_driver_by_name("ESRI Shapefile"),
    2> erlogr:dr_get_name(Driver).
    "ESRI Shapefile"

    3> DataSource = erlogr:open("test/polygon.shp"),
    3> Layer = erlogr:ds_get_layer(DataSource, 0),
    3> Feature = erlogr:l_get_feature(Layer, 0),
    3> Geometry = erlogr:f_get_geometry_ref(Feature),
    3> Wkt = erlogr:g_export_to_wkt(Geometry).
    "POLYGON ((0.351988636363636 -0.969460227272728,2.058238636363636 0.086505681818182,2.690625 -1.524289772727273,0.0 -2.0015625,-0.304261363636364 -1.828551136363636,0.351988636363636 -0.969460227272728))"

    4> Wkb = erlogr:g_export_to_wkb(Geometry).
    <<1,3,0,0,0,1,0,0,0,6,0,0,0,136,181,111,88,251,134,214,63,
      72,23,93,116,209,5,239,191,...>>
```


## Documentation [&#x219F;](#table-of-contents)

* [API docs]()
* [Usage docs]()


## License [&#x219F;](#table-of-contents)

```
Copyright © 2012 Carlos Roman
Copyright © 2016 Duncan McGreggor

Distributed under the Apache License Version 2.0.
```
