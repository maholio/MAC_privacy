# MAC randomiser
This script will prevent some person to put your MACs in databases.

## What does it change?
- MAC in repeater mode
- Device MAC
- Radios MAC

### How to use it?

Run this commands on your host machine (NOT router):

```
nano mac_randomiser.sh
```

Paste code from above (or use v1 if you want) and save file.

```
scp -O -r mac_randomiser.sh root@192.168.8.1:/etc/init.d/
```

Enter password

```
ssh root@192.168.8.1
```

Enter password again

```
cd /etc/init.d/
```

```
chmod +x /etc/init.d/mac_randomiser.sh
```

```
/etc/init.d/mac_randomiser.sh enable
```

### 🇺🇦 Author stands with Ukraine 🇺🇦
If you want to thank me, please [donate to Ukrainian army](https://war.ukraine.ua)
