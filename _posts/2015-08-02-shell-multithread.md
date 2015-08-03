---
layout: default
title: SHELL mulitpthread
---
## shell mulitpthread
```
	#!/bin/bash

	SEND_THREAD_NUM=13  #设置进程数量
	tmp_fifofile="/tmp/$$.fifo"
	mkfifo "$tmp_fifofile"
	exec 6<>"$tmp_fifofile"
	rm "$tmp_fifofile"
	for ((i=0;i<$SEND_THREAD_NUM;i++));do
	echo
	done >&6


	IFS_OLD=$IFS                              ## 备份分隔符
	IFS=$'\n'                                        ##设置分隔符
	URL=`cat url.txt`
	UA=`cat ua.txt`
	CO=0
	for i in $URL
 	 do
   	 for j in $UA
    	   do
     	    read -u6
		{
   	       /usr/bin/curl -A $j   $i
   	      echo >&6
   	    } &                                            #### 大括号内的代码就是放到子进程扔到后台执行
              CO=`expr $CO + 1`
              echo $CO >> co                ### 计数器
  	    done
 	 done
	IFS=$IFS_OLD                              ## 恢复分隔符
	wait
	exec 6>&-
	exit 0
```