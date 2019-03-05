#!/bin/bash
image_name='httpd'
image_tag='4'
function create_image()
{
	docker build -t $1:$2 -f Dockerfile .
}
function run_container()
{
	container_id=`docker run -it -d -p 8083:80 $1:$2`
	echo  Container ID: $container_id;

}
function stop_container()
{
	echo stopping Container $1
	docker stop $1
}
function start_container()
{
	echo Starting Container $1
	docker start $1
}
function copy()
{
	echo "copy function"
	docker cp check_service.sh $1:/tmp
	docker exec $1 "/tmp/check_service.sh"
}


create_image $image_name $image_tag

run_container $image_name $image_tag
#docker cp check_service.sh f9390d6359ed3ef12562faa41cf24bac0f8b210d4095a82fe635fe48f75721a4:/tmp
echo $container_id;

stop_container $container_id
start_container $container_id
copy $container_id
