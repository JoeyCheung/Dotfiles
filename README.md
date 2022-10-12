# Dotfiles

![2018-09-19_144842_1920x1080](https://user-images.githubusercontent.com/30446022/45889706-1ed44180-bd8f-11e8-9a9e-07ef7399dd8b.png)

# How to install

- git clone 
- cd into folder
- Run source install.sh
- After installation run source remove.sh (This gets rid of all of the dotfiles that were created. Don't worry you'll be replacing it with the ones that I have in this repo)
- Run source symlinks.sh (This will run all the dotfiles and connect them to the system)

When running all of these, make sure that all of the dotfiles are moved into the home directory, that autoload is placed into .vim folder then run "vim +PluginInstall +qall", and that you cd into .vim/bundle/YouCompleteMe and type this command "python install.py" to fix "YCM error. The ycmd server SHUT DOWN (restart wit…the instructions in the" error or some commands might not work properly

# Issues
- Make a cron job to automatically update package manager (sudo pacman -Syu)
- Make zsh automated to become the default shell.
- Make vim the default text editor in ranger
- possible kbd folder in roots directory that handles keyboard shortcuts (This is for dvorak layout) https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration#Keymaps
- Add keybindings in .vimrc file to run terminal commands inside of vim such as switching between qwerty and dvorak or running python code
- Also add keybindings for ranger which should be in rc.conf folder https://github.com/ranger/ranger/wiki/Keybindings

# Frequently Asked Questions

Q: Why is Wifi/Connect alias commands not working? 

A: If you are wired in through an ethernet, it will not show wifi connections. Or just use nmtui command

Q: How come vim can't read ctags?

A: You have to go to the ctags-5.8 directory and type the command sudo make install

# Prerequisites 

- There needs to be specific versions of kustomize, kubectl, and minikube in order for this to work so make sure that those 3 are completely uninstalled from your environment. The install.sh script will install the correct versions
- You also need to have another user since you can't run systemctl start docker as root. You can add another user with the following: 
``` 
adduser (username)
sudo usermod -aG sudo (username)
sudo usermod -aG docker (username) && newgrp docker
sudo passwd (username) #enter password for user here
su (username) 
- Re-Login or Restart the Server
```
- When trying to run Kubeflow, it may need a certain amount of resources or it won't work. This specifically worked for me minikube start --cpus 8 --memory 64000 but it could work with less 

# installation

- Run source install.sh (cpu size) (memory size)
- That's it 

# Useful commands 

- Check that everything is up and running or else Kubeflow won't work. You can do that with: 
```
kubectl get pods -n cert-manager
kubectl get pods -n istio-system
kubectl get pods -n auth
kubectl get pods -n knative-eventing
kubectl get pods -n knative-serving
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
```
- Once everything is up and running you can run kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80 and go to http://localhost:8080

# Testing examples 

Training files have already been included in here

- kubectl apply -f random.yaml for hyper parameter tuning
- kubectl apply -f simple.yaml for model training

You can check and monitor these with 

- kubectl -n kubeflow-user-example-com get experiment random -o yaml
- kubectl -n kubeflow get tfjob tfjob-simple -o yaml 

To serve a model and make an API out of it you can run the following: 

- kubectl create namespace kserve-test
- kubectl apply -f sklearn.yaml -n kserve-test (sklearn.yaml has already been included) 
- kubectl get inferenceservices sklearn-iris -n kserve-test
- kubectl get svc istio-ingressgateway -n istio-system
- 
```
# GKE
export INGRESS_HOST=worker-node-address
# Minikube
export INGRESS_HOST=$(minikube ip)
# Other environment(On Prem)
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
```
- iris-input.json has the request body to be sent in. Make sure to add your session cookie for authservice_session. You can find it through your cookies then copy and paste that into the placeholder 
```
#Example request
SERVICE_HOSTNAME=$(kubectl get inferenceservice sklearn-iris -n kserve-test -o jsonpath='{.status.url}' | cut -d "/" -f 3)
curl -v -L -H "Host: ${SERVICE_HOSTNAME}" -H "Cookie: authservice_session=add_authservice_session_cookie_value_from_browser" http://${INGRESS_HOST}:${INGRESS_PORT}/v1/models/sklearn-iris:predict -d @./iris-input.json
```

Result should look like 
```
*   Trying 10.152.183.241...
* TCP_NODELAY set
* Connected to 10.152.183.241 (10.152.183.241) port 80 (#0)
> POST /v1/models/sklearn-iris:predict HTTP/1.1
> Host: sklearn-iris.admin.example.com
> User-Agent: curl/7.58.0
> Accept: */*
> Cookie: authservice_session=MTU4OTI5NDAzMHxOd3dBTkVveldFUlRWa3hJUVVKV1NrZE1WVWhCVmxSS05GRTFSMGhaVmtWR1JrUlhSRXRRUmtnMVRrTkpUekpOTTBOSFNGcElXRkU9fLgsofp8amFkZv4N4gnFUGjCePgaZPAU20ylfr8J-63T
> Content-Length: 76
> Content-Type: application/x-www-form-urlencoded
> 
* upload completely sent off: 76 out of 76 bytes
< HTTP/1.1 200 OK
< content-length: 23
< content-type: text/html; charset=UTF-8
< date: Tue, 12 May 2020 14:38:50 GMT
< server: istio-envoy
< x-envoy-upstream-service-time: 7307
< 
* Connection #0 to host 10.152.183.241 left intact
{"predictions": [1, 1]}
```

# Useful Resources 

- https://qiita.com/maxtaq/items/81c6d08250b03ef02dfd
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- https://minikube.sigs.k8s.io/docs/start/
- https://github.com/kubeflow/manifests#installation
- https://github.com/kserve/kserve/tree/master/docs/samples/istio-dex
- https://kserve.github.io/website/0.7/get_started/first_isvc/#run-your-first-inferenceservice
- https://kserve.github.io/website/0.9/get_started/first_isvc/#1-create-a-namespace
- https://v1-5-branch.kubeflow.org/docs/components/pipelines/
- https://v1-5-branch.kubeflow.org/docs/components/katib/overview/
- https://v1-5-branch.kubeflow.org/docs/components/training/
