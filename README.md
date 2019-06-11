### lftp--mirror--files--alone | Create  directories  the  same  as  file names and get the files into them instead of current                        directory.

#### Script USAGE: 
"For MAN page use -m [help command]"  
./lftp_files_alone.sh -u Username -p 'Password' -h Host -d Domain.com -f path_to_remotefile.txt"

#### LFTP USAGE:
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
