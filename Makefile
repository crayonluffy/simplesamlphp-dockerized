#registry := registry.starter-us-east-1.openshift.com

project := lib-simplesamlphp
image := simplesamlphp
tag := latest
repo_or_dir := $$PWD

runtime_image := simplesamlphp

# Prepare the S2I builder and runtime images
.PHONY: s2i
s2i:
	docker build -t ${project}/${runtime_image}:${tag} -f s2i/Dockerfile s2i

# Create a runnable docker image
.PHONY: runnable-image
runnable-image:
	s2i build \
		${repo_or_dir} \
		${project}/${runtime_image}:${tag} \
		${project}/${image}:${tag}

.PHONY: publish
publish:
	docker tag  ${project}/${image}:${tag} ${registry}/${project}/${image}:${tag}
	docker push ${registry}/${project}/${image}:${tag}
