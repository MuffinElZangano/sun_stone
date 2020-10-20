function Packet(socket, isClient) constructor {
	data = [];
	sock = socket;
	header = "";
	isclient = isClient;
	
	static add = function(newData) {
		data[array_length(data)] = newData;
		return self;
	}
	
	static is_client = function() {
		return isclient;	
	}
	
	static head = function(newHeader) {
		header = newHeader;
		return self;
	}
	
	static set = function(newData, index) {
		data[index] = newData;
		return self;
	}
	
	//serialization
	static serialize = function() {
		var buff = buffer_create(1,buffer_grow,1);
		buffer_write(buff,buffer_string,header);
		buffer_write(buff,buffer_bool,is_client());
		for(var i = 0; i < array_length(data); i++) {
			var type = typeof(data[i]);
			buffer_write(buff,buffer_string,type);
			switch(type) {
				case "string":
					buffer_write(buff,buffer_string,data[i]);
					break;
				case "number":
					buffer_write(buff,buffer_f16,data[i]);
					break;
				case "int32":
				case "int64":
					buffer_write(buff,buffer_s32,data[i]);
					break;
				case "bool":
					buffer_write(buff,buffer_bool,data[i]);
					break;
			}
		}
		return new SerializedPacket(buff,sock);
	}
	
	static send_tcp = function() {
		serialize().send(false);	
	}
	
}

function SerializedPacket(buffer, socket) constructor {
	buff = buffer;
	sock = socket;
	
	static send = function() {
		network_send_packet(sock,buff,buffer_tell(buff));
	}
	
	static deserialize = function() {
		buffer_seek(buff,buffer_seek_end,0);
		var buffer_end = buffer_tell(buff);
		buffer_seek(buff,buffer_seek_start,0);
		var header = buffer_read(buff,buffer_string);
		var isclient = buffer_read(buff,buffer_bool);
		var deserialized = new Packet(sock, isclient);
		deserialized.head(header);
		while(buffer_tell(buff) != buffer_end) {
			var stype = buffer_read(buff,buffer_string);
			var type = buffer_f16;
			switch(stype) {
				case "bool":
					type = buffer_bool;
					break;
				case "int32":
				case "int64":
					type = buffer_s32;
					break;
				case "string":
					type = buffer_string;
					break;
			}
			deserialized.add(buffer_read(buff,type));
		}
		return deserialized;
	}
}

function SocketData(socket) constructor {
	sock = socket;
	static netid_m = 0;
	netid = netid_m++;
	object = noone;
}