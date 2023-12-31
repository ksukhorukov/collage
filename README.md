# COLLAGE


**collage** is a commande line tool that removes all metadata (geolocation, phone model, etc.) from the pictures in custom folder and also
normalize names of the files, in other words massivelly renames all files using only number in ascending order

## Requirements

* exiftool 12.6 or higher
* Ruby 3.0 or higher

## Usage 

```
% ./collage.rb ./images 

[+] processed 5 pictures
```

Results:

```
 % ls -la ./images
total 22008
drwxr-xr-x   8 user  staff   256B Nov 26 08:18 .
drwxr-xr-x  11 user  staff   352B Nov 26 08:18 ..
-rw-r--r--@  1 user  staff   2.1M Nov 26 06:02 1.jpeg
-rw-r--r--@  1 user  staff   3.1M Nov 26 06:02 2.jpeg
-rw-r--r--@  1 user  staff   2.8M Nov 26 06:02 3.jpeg
-rw-r--r--@  1 user  staff   2.6M Nov 26 06:02 4.jpeg
-rw-r--r--@  1 user  staff   175K Nov 26 06:02 5.jpg
```

## HELP

You can see the reference using ``help`` command

But let's suppose that you also have the directory with the name ``help`` in your local directory that you want to process:

```
% time ./collage.rb help                                   

You have 'help' or 'usage__' directories in local directory or even both.
Maybe you wanted to get some help? Here it is...

Execute programm without any params to proccess local folder:

Example: ./collage.rb


Pass absolute or relative path of a directory with images:

Example: ./collage.rb /var/www/щерево/fotki


HELP command alternative: ./collage.rb usage__


[+] Processed 20 pictures

./collage.rb help  2.14s user 0.21s system 94% cpu 2.507 total

```

As you can see it is also possible.
