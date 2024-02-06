from smbus import SMBus
from time import sleep,time

addr = 0x08
blocksize = 16

bus = SMBus(1)
bustime = time()
busdelay = 0.1


#numb = 1

def i2cwriteval(addr,com,chan,val):
	global bustime,busdelay
	while(time() < bustime + busdelay):
		pass
	#data = [ord(com),chan]
	bus.write_byte(addr,ord(com))
	bus.write_byte(addr,chan)
	for ch in str(val):
		#data.append(ord(ch))
		bus.write_byte(addr,ord(ch))
		#print(ch)
	#while(len(data) < 15):
	#	data.append(ord(' '))
	#data.append(ord('\n'))
	bus.write_byte(addr,ord('\n'))
	#print(data)
	#bus.write_i2c_block_data(addr,0,data)
	bustime = time()

def i2creadval(addr):
	global bustime,busdelay
	while(time() < bustime + busdelay):
		pass
	#data = bus.read_i2c_block_data(addr,0,blocksize)
	#return(''.join(map(chr,data)))
	
	ch = ''
	s = ''
	while(True):
		ch = chr(bus.read_byte(addr))
		if(ch == '\n'):
			break
		#print(ch)
		s += ch		
	bustime = time()
	return(s)
	

def showdata():
	print("Set point")
	i2cwriteval(addr,'s',0,0)
	#sleep(0.1)
	print(i2creadval(addr))
	print("Location")
	#sleep(0.1)
	i2cwriteval(addr,'p',0,0)
	#sleep(0.1)
	print(i2creadval(addr))
	#sleep(0.1)
	print("Moving")
	i2cwriteval(addr,'m',0,0)
	#sleep(0.1)
	print(i2creadval(addr))
	#sleep(0.1)
	#pass

i2cwriteval(addr,'T',0,70)
for i in range(2):
	n = 50000*(2*(i%2) -1) 
	print('Going to %d' % n)
	i2cwriteval(addr,'G',0,n)
	sleep(0.5)
	while(True):
		showdata()
		i2cwriteval(addr,'m',0,0)
		if(int(i2creadval(addr)) == 0):
			break
		sleep(0.5)
	showdata()
	


