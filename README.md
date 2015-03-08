# raspberry-scripts

My Raspberry Pi initialization script. Beware, Linux noob.

Clone in home folder on your Raspberry Pi

```
git clone https://github.com/davidvidmar/raspberry-scripts.git
```

Add execute permissions and run:

```
chmod +x RPi-init.sh
./RPi-init.sh
```

And do not forget! Before running add wifi.txt with content like:
```
network={
  ssid="WifiForPi"
  psk="WifiForPi"
}
```
