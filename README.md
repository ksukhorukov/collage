# COLLAGE


**collage** is a commande line tool that removes all metadata from the pictures in custom folder and also
normalize names of the files, in other words massivelly renames all files using only number in ascending order

## Requirements

* exiftool 12.6 or higher
* Ruby 3.0 or higher

## Usage 

```
% ./app.rb ./images 

[+] processed 5 pictures
```

Results:

```
 % ls -lah ./images
total 22008
drwxr-xr-x   8 user  staff   256B Nov 26 08:18 .
drwxr-xr-x  11 user  staff   352B Nov 26 08:18 ..
-rw-r--r--@  1 user  staff   6.0K Nov 26 08:09 .DS_Store
-rw-r--r--@  1 user  staff   2.1M Nov 26 06:02 1.jpeg
-rw-r--r--@  1 user  staff   3.1M Nov 26 06:02 2.jpeg
-rw-r--r--@  1 user  staff   2.8M Nov 26 06:02 3.jpeg
-rw-r--r--@  1 user  staff   2.6M Nov 26 06:02 4.jpeg
-rw-r--r--@  1 user  staff   175K Nov 26 06:02 5.jpg
```

## HELP



