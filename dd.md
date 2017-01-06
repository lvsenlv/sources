#Command of "dd"

把指定的输入文件拷贝到指定的输出文件，拷贝的过程中可以格式转换  

###**Grammar:　dd　if=path/　of=path/　[options]**

---
###Selective parameters：

if =输入文件(或设备名称)。  
of =输出文件(或设备名称)。  
ibs = bytes 一次读取bytes字节，即读入缓冲区的字节数。  
skip = blocks 跳过读入缓冲区开头的ibs*blocks块。  
obs = bytes 一次写入bytes字节，即写 入缓冲区的字节数。  
bs = bytes 同时设置读/写缓冲区的字节数(等于设置obs和obs)。  
cbs = bytes 一次转换bytes字节。  
count = blocks 只拷贝输入的blocks块。  
conv = ASCII 把EBCDIC码转换为ASCII码。  
conv = ebcdic 把ASCII码转换为EBCDIC码。  
conv = ibm 把ASCII码转换为alternate EBCDIC码。  
conv = blick 把变动位转换成固定字符。  
conv = ublock 把固定们转换成变动位。  
conv = ucase 把字母由小写变为大写。  
conv = lcase 把字母由大写变为小写。  
conv = notrunc 不截短输出文件。  
conv = swab 交换每一对输入字节。  
conv = noerror 出错时不停止处理。  
conv = sync 把每个输入记录的大小都调到ibs的大小(用ibs填充)。

###Examples:

  
