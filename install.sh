# install
sudo apt-get update && sudo apt-get install -y python python-pip
sudo -H pip install shadowsocks

# config
cd ~
config_file='shadowsocks/config.json'
config_file_path=`dirname $config_file`
mkdir -p $config_file_path && echo \
'{\n'                                   \
'    "server":"0.0.0.0",\n'             \
'    "server_port":6666,\n'             \
'    "local_address":"127.0.0.1",\n'    \
'    "local_port":1080,\n'              \
'    "password":"lzmhaha",\n'           \
'    "timeout":300,\n'                  \
'    "method":"aes-256-cfb",\n'         \
'    "fast_open":false\n'               \
'}\n'                                   \
 > $config_file

# start(https://stackoverflow.com/questions/12996397/command-not-found-when-using-sudo)
echo 'sudo -E env "PATH=$PATH" ssserver -c ~/'$config_file' -d start' > $config_file_path/start.sh
