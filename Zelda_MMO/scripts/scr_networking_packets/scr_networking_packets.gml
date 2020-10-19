function Packet(socket) constructor {
	data = [];
	sock = socket;
	
	static add = function(newData) {
		data[array_length(data)] = newData;
		return self;
	}
	
	static set = function(newData, index) {
		data[index] = newData;
		return self;
	}
	
	
	//serialization
	static serialize = function() {
		var buff = buffer_create(1,buffer_grow,1);
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
	
}

function SerializedPacket(buffer, socket) constructor {
	buff = buffer;
	sock = socket;
	
	static send = function() {
		network_send_packet(sock,buff,buffer_tell(buff));
	}
	
	static deserialize = function() {
		var deserialized = new Packet(sock);
		buffer_seek(buff,buffer_seek_end,0);
		var buffer_end = buffer_tell(buff);
		buffer_seek(buff,buffer_seek_start,0);
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