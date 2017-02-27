#Command of "sed"

是一个编辑器，是一个强大的文件处理工具,用来替换、删除，更新文件中的内容  

###Grammar:　sed [options] 'command' file  

---

###Essential parameters:

-i: 直接修改文件，终端不输出结果  
-n:  sed默认会将数据输出到终端上。但如果加上-n参数后，只有经过sed特殊处理的那一行才被列出来  
-e: 命令模式上进行sed的动作编辑。sed -e '...' -e '...' -e '...'  
-f: 指定sed脚本的文件名  
-r: sed动作支持的是延伸型正规表示法的语法。（默认是基础正规表示法语法）  

###Selective parameters:

a:新增，在当前行的下一行追加一行文本  
i:插入，在当前行的上一行插入一行文本  
c:替换，以行为单位进行替换，c的后面可以跟字符串，用这些字符串取代n1,n2之间的行  
d:删除，从模式空间删除一行  
p:打印，打印模式空间的行。通常p会与参数【-n】一起使用  
s:替换，通常s命令可以搭配正则表达式

###Character
^  
锚定行的开始 如：/^test/ 匹配所有以test开头的行  
  
$  
锚定行的结束 如：/test$/ 匹配所有以test结尾的行  

.  
匹配一个非换行符的字符 如：/s.d/匹配s后接一个任意字符，然后是d  

`*`  
匹配零或多个字符 如：/*test/匹配一个或多个空格后紧跟test的行  
`.` 与 `*` 经常连用，如： `s/te.*/rs/` 将te关键字及其后所有内容全部替换为rs   

[] 
匹配一个指定范围内的字符，如/[Tt]est/匹配Test和test  

[^] 
匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头，紧跟ed的行  

\(..\) 
保存匹配的字符，如s/\(love\)able/\1rs，loveable被替换成lovers  
如s/\(love\)able/rs，或s/\(love\)able/\rs，loveable被替换成rsable 

& 
保存搜索字符用来替换其他字符，如`s/love/**&**/`，love换成**love**  

\<  
锚定单词的开始，如:/\<love/匹配包含以love开头的单词的行   

\>  
锚定单词的结束，如/love\>/匹配包含以love结尾的单词的行  

x\{m\}  
重复字符x，m次，如：/0\{5\}/匹配包含5个0的行  

x\{m,\}  
重复字符x,至少m次，如：/o\{5,\}/匹配至少有5个0的行  

x\{m,n\}  
重复字符x，至少m次，不多于n次，如：/o\{5,10\}/匹配5--10个0的行  

###Examples:

test.txt 中内容如下：

greeter-session=unity-greeter  
user-session=ubuntu  
greeter-show-manual-login=true  
allow-guest=false  
autologin-user=root  
autologin-user-timeout=0  

1. 查找greeter关键字，并在终端上只显示经过sed处理的内容，文档不修改  
`   sed -n '/greeter/p' test/.txt   `  
显示结果为：  
greeter-session=unity-greeter  
greeter-show-manual-login=true  

2. 将每行中第一个greeter关键字替换为test，文档不修改  
`   sed -n 's/greeter/test/p' test.txt    `    
显示结果为：  
test-session=unity-greeter  
test-show-manual-login=true  

3. 将每行中所有greeter关键字替换为test，修改文档  
`   sed -i 's/greeter/test/g' test.txt    `  
`   cat test.txt   `  
执行结果为：  
test-session=unity-test  
user-session=ubuntu  
test-show-manual-login=true  
allow-guest=false  
autologin-user=root  
autologin-user-timeout=0

4. 将auto关键字所在行替换为test，修改文档  
`   sed -i '/auto/c test` test.txt
`   cat test.txt   `  
执行结果为：  
test-session=unity-test  
user-session=ubuntu  
test-show-manual-login=true  
allow-guest=false  
test  
test  

5. 将root关键字所在行删除，修改文档  
`   sed -i '/root/d' test.txt   `  
`   cat test.txt   `  
执行结果为：  
test-session=unity-test  
user-session=ubuntu  
test-show-manual-login=true  
allow-guest=false  
autologin-user-timeout=0

###Advanced:  
test.txt 中内容如下：  
tancer_desktop2.0_dev=Tancer_desktop.2.0.0.1202  

test.sh 脚本内容如下：

		#！/bin/bash
		
		BRANCH=tancer_desktop2.0_dev
		VERSION_NUM=Tancer_desktop.2.1.2.1213
		
		#将BRANCH关键字及其后所有内容替换为指定内容
		sed -i 's/^'"$BRANCH"'.*/'"&BRANCH=$VERSION_NUM"'/g' test.txt
		
		cat test.txt
		
		#将BRANCH关键字及其后所有内容替换为指定内容
		sed -i 's/\('"$BRANCH"'\).*/'"$VERSION_NUM"'/g' test.txt
		
		cat test.txt

		#将BRANCH关键字其后所有内容替换为指定内容		
		sed -i 's/\('"$BRANCH"'\).*/\1='"$VERSION_NUM"'/g' test.txt
		
		cat test.txt
		
		#在BRANCH后插入制定内容
		sed -i 's/\('"$BRANCH"'\)/\1='"$VERSION_NUM"'/g' test.txt
		
		cat test.txt
		
		#将BRANCH关键字替换为指定内容
		sed -i 's/\('"$BRANCH"'\)/'"$VERSION_NUM"'/g' test.txt
		cat test.txt
		#等价于
		sed -i 's/'"$BRANCH"'/'"$VERSION_NUM"'/g' test.txt
		cat test.txt
		
###Extra
test.txt 存在如下内容：  
latest_version=BETA.2017.0224.014243 base_version=beta_14.12.0  
		
		sed -n 's/latest_version/temp/p' test.txt
		//输出：temp=BETA.2017.0224.014243 base_version=beta_14.12.0
		
		sed -n 's/latest_version=.*/temp/p' test.txt
		//输出：temp

		sed -n 's/latest_version.* /temp /p' test.txt
		//输出：temp base_version=beta_14.12.0

		sed -n 's/latest_version=[^ ]*/temp/p' test.txt
		//输出：temp base_version=beta_14.12.0


