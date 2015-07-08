Heroku buildpack: lwan
=======================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for lwan.
The lwan is build using the source form [lwan.ws](http://lwan.ws).
Built binary is cached to speedup future builds.

Usage
-----

Example usage:

    $ ls -R *
    conf:
    lwan.conf.erb

    wwwroot:
    index.html

    $ heroku create --buildpack https://github.com/bherrera/heroku-buildpack-lwan
    $ heroku buildpacks:add --index 1 [https://github.com/ddollar/heroku-buildpack-apt](https://github.com/ddollar/heroku-buildpack-apt)
    ...

    $ git push heroku master
    ...
     -----> Fetching custom git buildpack... done
     -----> Multipack app detected
     =====> Downloading Buildpack: https://github.com/ddollar/heroku-buildpack-apt
     =====> Detected Framework: Apt
     -----> Updating apt caches
            Ign http://archive.ubuntu.com trusty InRelease
            Ign http://archive.ubuntu.com trusty-security InRelease
            Ign http://archive.ubuntu.com trusty-updates InRelease
            Get:1 http://archive.ubuntu.com trusty Release.gpg [933 B]
            Get:2 http://archive.ubuntu.com trusty-security Release.gpg [933 B]
            Get:3 http://archive.ubuntu.com trusty-updates Release.gpg [933 B]
            Get:4 http://archive.ubuntu.com trusty Release [58.5 kB]
            Get:5 http://archive.ubuntu.com trusty-security Release [63.5 kB]
            Get:6 http://archive.ubuntu.com trusty-updates Release [63.5 kB]
            Get:7 http://archive.ubuntu.com trusty/main amd64 Packages [1,350 kB]
            Get:8 http://archive.ubuntu.com trusty/universe amd64 Packages [5,859 kB]
            Get:9 http://archive.ubuntu.com trusty/main Translation-en [762 kB]
            Get:10 http://archive.ubuntu.com trusty/universe Translation-en [4,089 kB]
            Get:11 http://archive.ubuntu.com trusty-security/main amd64 Packages [309 kB]
            Get:12 http://archive.ubuntu.com trusty-security/main Translation-en [163 kB]
            Get:13 http://archive.ubuntu.com trusty-updates/main amd64 Packages [568 kB]
            Get:14 http://archive.ubuntu.com trusty-updates/main Translation-en [274 kB]
            Ign http://archive.ubuntu.com trusty/main Translation-en_US
            Ign http://archive.ubuntu.com trusty/universe Translation-en_US
            Fetched 13.6 MB in 7s (1,879 kB/s)
            Reading package lists...
     -----> Fetching .debs for cmake
            Reading package lists...
            Building dependency tree...
            The following extra packages will be installed:
              cmake-data libarchive13 libnettle4
            Suggested packages:
              codeblocks eclipse lrzip
            The following NEW packages will be installed:
              cmake cmake-data libarchive13 libnettle4
            0 upgraded, 4 newly installed, 0 to remove and 77 not upgraded.
            Need to get 3,674 kB of archives.
            After this operation, 17.7 MB of additional disk space will be used.
            Get:1 http://archive.ubuntu.com/ubuntu/ trusty/main libnettle4 amd64 2.7.1-1 [121 kB]
            Get:2 http://archive.ubuntu.com/ubuntu/ trusty-security/main libarchive13 amd64 3.1.2-7ubuntu2.1 [259 kB]
            Get:3 http://archive.ubuntu.com/ubuntu/ trusty/main cmake-data all 2.8.12.2-0ubuntu3 [676 kB]
            Get:4 http://archive.ubuntu.com/ubuntu/ trusty/main cmake amd64 2.8.12.2-0ubuntu3 [2,618 kB]
            Fetched 3,674 kB in 0s (8,473 kB/s)
            Download complete and in download only mode
     -----> Installing cmake_2.8.12.2-0ubuntu3_amd64.deb
     -----> Installing cmake-data_2.8.12.2-0ubuntu3_all.deb
     -----> Installing libarchive13_3.1.2-7ubuntu2.1_amd64.deb
     -----> Installing libnettle4_2.7.1-1_amd64.deb
     -----> Writing profile script
     =====> Downloading Buildpack: https://github.com/bherrera/heroku-buildpack-lwan.git
     =====> Detected Framework: Lwan

            PRO TIP: You can specify a lwan version in _lwan.cfg
            See https://github.com/bherrera/heroku-buildpack-lwan

            Defaulting to version master
            lwan version changed since last build; rebuilding.
            Cleaning cached lwan version...
            Downloading lwan master...
            Cloning into 'lwan-master'...

     -----> Compiling lwan...

     -----> CMAKE Configuring
            -- The C compiler identification is GNU 4.8.2
            -- Check for working C compiler: /usr/bin/cc
            -- Check for working C compiler: /usr/bin/cc -- works
            -- Detecting C compiler ABI info
            -- Detecting C compiler ABI info - done
            -- Found ZLIB: /usr/lib/x86_64-linux-gnu/libz.so (found version "1.2.8")
            -- Looking for include file pthread.h
            -- Looking for include file pthread.h - found
            -- Looking for pthread_create
            -- Looking for pthread_create - not found
            -- Looking for pthread_create in pthreads
            -- Looking for pthread_create in pthreads - not found
            -- Looking for pthread_create in pthread
            -- Looking for pthread_create in pthread - found
            -- Found Threads: TRUE
            -- Performing Test HAVE_BUILTIN_CPU_INIT
            -- Performing Test HAVE_BUILTIN_CPU_INIT - Success
            -- Performing Test HAVE_BUILTIN_UMULL_OVERFLOW
            -- Performing Test HAVE_BUILTIN_UMULL_OVERFLOW - Failed
            -- Performing Test HAVE_STATIC_ASSERT
            -- Performing Test HAVE_STATIC_ASSERT - Success
            -- Looking for clock_gettime
            -- Looking for clock_gettime - found
            -- libc has clock_gettime(). Good.
            -- jemalloc and tcmalloc were not found, using system malloc
            -- Performing Test HAS_LTO
            -- Performing Test HAS_LTO - Success
            -- Performing Test HAS_FAT_LTO_OBJECTS
            -- Performing Test HAS_FAT_LTO_OBJECTS - Success
            -- Performing Test HAVE_BUILTIN_IA32_CRC32
            -- Performing Test HAVE_BUILTIN_IA32_CRC32 - Success
            -- Valgrind headers not found -- disabling valgrind support
            -- Found PkgConfig: /usr/bin/pkg-config (found version "0.26")
            -- checking for modules 'luajit>=2.0;luajit<=2.0.9999'
            --   package 'luajit>=2.0' not found
            --   package 'luajit<=2.0.9999' not found
            -- checking for modules 'lua>=5.1.0;lua<=5.1.999'
            --   package 'lua>=5.1.0' not found
            --   package 'lua<=5.1.999' not found
            -- checking for modules 'lua>=5.1.0;lua<=5.1.999'
            --   package 'lua>=5.1.0' not found
            --   package 'lua<=5.1.999' not found
            -- checking for modules 'lua51>=5.1.0;lua51<=5.1.999'
            --   package 'lua51>=5.1.0' not found
            --   package 'lua51<=5.1.999' not found
            -- checking for modules 'lua5.1>=5.1.0;lua5.1<=5.1.999'
            --   package 'lua5.1>=5.1.0' not found
            --   package 'lua5.1<=5.1.999' not found
            -- checking for modules 'lua-5.1>=5.1.0;lua-5.1<=5.1.999'
            --   package 'lua-5.1>=5.1.0' not found
            --   package 'lua-5.1<=5.1.999' not found
            -- Disabling Lua support
            -- Found PythonInterp: /usr/bin/python (found version "2.7.6")
            -- checking for module 'sqlite3>=3.6.20'
            --   package 'sqlite3>=3.6.20' not found
            -- Freegeoip sample application not being built: SQLite not found
            -- checking for module 'sqlite3>=3.6.20'
            --   package 'sqlite3>=3.6.20' not found
            -- Not building benchmark suite: database libraries not found.
            -- Configuring done
            -- Generating done
            -- Build files have been written to: /tmp/build_7369c16ca93730475c4d426e5b76d071/lwan-master

     -----> Compiling with Make
            Scanning dependencies of target generate_mime_types_table
            [  3%] Generating ../mime-types.h
            [  3%] Built target generate_mime_types_table
            Scanning dependencies of target lwan-common
            [  7%] Building C object common/CMakeFiles/lwan-common.dir/base64.c.o
            [ 10%] Building C object common/CMakeFiles/lwan-common.dir/hash.c.o
            [ 14%] Building C object common/CMakeFiles/lwan-common.dir/int-to-str.c.o
            [ 17%] Building C object common/CMakeFiles/lwan-common.dir/list.c.o
            [ 21%] Building C object common/CMakeFiles/lwan-common.dir/lwan.c.o
            [ 25%] Building C object common/CMakeFiles/lwan-common.dir/lwan-cache.c.o
            [ 28%] Building C object common/CMakeFiles/lwan-common.dir/lwan-config.c.o
            [ 32%] Building C object common/CMakeFiles/lwan-common.dir/lwan-coro.c.o
            [ 35%] Building C object common/CMakeFiles/lwan-common.dir/lwan-http-authorize.c.o
            [ 39%] Building C object common/CMakeFiles/lwan-common.dir/lwan-io-wrappers.c.o
            [ 42%] Building C object common/CMakeFiles/lwan-common.dir/lwan-job.c.o
            [ 46%] Building C object common/CMakeFiles/lwan-common.dir/lwan-redirect.c.o
            [ 50%] Building C object common/CMakeFiles/lwan-common.dir/lwan-request.c.o
            [ 53%] Building C object common/CMakeFiles/lwan-common.dir/lwan-response.c.o
            [ 57%] Building C object common/CMakeFiles/lwan-common.dir/lwan-serve-files.c.o
            [ 60%] Building C object common/CMakeFiles/lwan-common.dir/lwan-socket.c.o
            [ 64%] Building C object common/CMakeFiles/lwan-common.dir/lwan-status.c.o
            [ 67%] Building C object common/CMakeFiles/lwan-common.dir/lwan-tables.c.o
            [ 71%] Building C object common/CMakeFiles/lwan-common.dir/lwan-template.c.o
            [ 75%] Building C object common/CMakeFiles/lwan-common.dir/lwan-thread.c.o
            [ 78%] Building C object common/CMakeFiles/lwan-common.dir/lwan-trie.c.o
            [ 82%] Building C object common/CMakeFiles/lwan-common.dir/realpathat.c.o
            [ 85%] Building C object common/CMakeFiles/lwan-common.dir/sd-daemon.c.o
            [ 89%] Building C object common/CMakeFiles/lwan-common.dir/strbuf.c.o
            [ 92%] Building C object common/CMakeFiles/lwan-common.dir/murmur3.c.o
            [ 96%] Building C object common/CMakeFiles/lwan-common.dir/reallocarray.c.o
            Linking C static library liblwan-common.a
            [ 96%] Built target lwan-common
            Scanning dependencies of target lwan
            [100%] Building C object lwan/CMakeFiles/lwan.dir/main.c.o
            Linking C executable lwan
            [100%] Built target lwan

     -----> Moving generated binary
            lwan was Installed at: /tmp/build_7369c16ca93730475c4d426e5b76d071/vendor/lwan
            Cleaning up lwan source files...
            Caching lwan binaries...
     -----> Creating startup script... done
     -----> Creating Procfile... done
            Building runtime environment
     Using release configuration from last framework (Lwan).
     -----> Discovering process types
    ...

The buildpack will detect your app as lwan if it has the file
`lwan.conf.erb` in the `conf` directory. You must define all `listener`
directives as `listener *:<%= ENV["PORT"] %>` in order for this buildpack to
work correctly.

To start the server run `bin/start_lwan`.
If no `Procfile` is present buildpack will create one with `web: bin/start_lwan`


Example
-------
Check out this app [lwan-test-app](https://github.com/bherrera/lwan-test-app)

Hacking
-------

To modify this buildpack, fork it on Github. Push up changes to your fork, then
create a test app with `--buildpack <your-github-url>` and push to it.
