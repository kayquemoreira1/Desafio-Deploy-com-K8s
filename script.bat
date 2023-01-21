echo "Criando as imagens..."

docker build -t denilsonbonatti/projeto-backend:1.0 backend/ .
docker build -t denilsonbonatti/projeto-database:1.0/ .

echo "Realizando o push das imagens..."

docker push denilsonbonatti/projeto-backend:1.0
docker push denilsonbonatti/projeto-database:1.0

echo "Criando os serviços no Cluster KB8s"

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployments.yml