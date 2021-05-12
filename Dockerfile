FROM mysql
COPY ./clothshopscript ./clothshopscript
ENV  MYSQL_ROOT_PASSWORD=PDM069096126pdm
EXPOSE 3306:3306