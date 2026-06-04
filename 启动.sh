后端启动：
sudo service mysql start;sudo service redis-server start;
cd ruoyi-admin;mvn spring-boot:run;


前端启动（新终端）：
cd ruoyi-ui;npm run dev;



云端最终一键同步命令:
git pull
./clear-db.sh
./import-db.sh