# lftp-file-mirror

`lftp -f script_file`

```
mget [-c] [-d] [-a] [-E] [-e] [-P N] [-O base] files

       Gets selected files with expanded wildcards.

            -c          continue, reget.
            -d          create  directories  the  same  as  file names and get the files into them instead of current
                        directory.

            -E          delete source files after successful transfer
            -e          delete target file before the transfer
            -a          use ascii mode (binary is the default)
            -P N        download N files in parallel
            -O <base>   specifies base directory or URL where files should be placed
```
