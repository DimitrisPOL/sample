sudo docker build -t web:0.1 .
sudo docker run --name redis -v /home/ubuntu/todolist/data:/data -d redis redis-server --appendonly yes
sudo docker run --name web -p 8000:8000 --link=redis -d web:0.1