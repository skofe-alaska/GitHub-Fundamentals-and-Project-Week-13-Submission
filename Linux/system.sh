#!/bin/bash

#prints amount of free memory on the system and saves it

free -h >> ~/backups/freemem/free_mem.txt

#prints disk usage and saves it

du -h >> ~/backups/diskuse/disk_usage.txt

#list all open files and saves it

lsof >> ~/backups/openlist/open_list.txt

#prints file system disk space statistics and save it

df -h >> ~/backups/freedisk/free_disk.txt
