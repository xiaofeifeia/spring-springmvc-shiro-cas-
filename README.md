# spring-springmvc-shiro-cas-
spring+springmvc+shiro+cas单点登录实例

springmvc+spring+shiro+cas单点登录实例  加入了登录验证码认证，修改了下首页样式，不过样式没有弄好，很丑的，有空自己再弄下
说明：cas-server是单点登录服务端，用的是maven项目，但是WEB-INF里面的lib目录下面有很多jar包需要导入到工程。服务端启动就用windows版本的tomcat吧，tomcat添加cas-server就好，端口自定
spring-node-1 和spring-node-1 是cas客户端，这两个直接用maven-tomcat7的插件启动，在pom.xml中配置好了，端口也在配置了。然后clean install tomcat7:run 就能跑起来，注意要修改node1和node2里的shiro.properties配置文件，要配置登录成功成功返回的路径
我的访问的分别是： 服务端： http://localhost:8050/cas-server
                  客户端：http://127.0.0.1:8081/node1/shiro-cas
                http://127.0.0.1:8082/node2/shiro-cas
下载地址 github ：https://github.com/xiaofeifeia/spring-springmvc-shiro-cas-.git
