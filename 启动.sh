后端启动：
sudo service mysql start;
sudo service redis-server start;
cd ruoyi-admin;
mvn spring-boot:run;


前端启动（新终端）：
cd ruoyi-ui;
npm run dev;



云端最终一键同步命令:
git pull
./clear-db.sh
./import-db.sh


     首次拉取 数据库 / Redis / Maven / 前端依赖

# 安装 MySQL 和 启动 MySQL 服务
sudo apt update;
sudo apt install -y mysql-server;
sudo service mysql start;

#设置 root 密码 (分别写入)
sudo mysql;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;

#导入数据库和验证导入成功
CREATE DATABASE IF NOT EXISTS `ry-pro` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ry-pro`;
SOURCE /workspace/sql/ry-pro.sql;
SHOW TABLES;
EXIT;

#安装并启动 Redis
sudo apt install -y redis-server;
sudo service redis-server start;
redis-cli ping;

#编译并启动后端
# 安装 Maven（如果没有）/ 编译打包（跳过测试）/ 进入 admin 模块目录 / 运行后端（Spring Boot 方式）
sudo apt install -y maven;
mvn clean install -DskipTests;
cd ruoyi-admin;
mvn spring-boot:run;

#前端启动（新终端）：
cd ruoyi-ui;
npm install;
npm run dev;