import SockJS from 'sockjs-client';
import Stomp from 'webstomp-client';
// import   { Client  }   from '@stomp/stompjs';



export const useSocket = () => {

  const stompClient = ref(null);
  const message = ref({});
  const content = ref('')

  const connect = (url,sub,res) => { 

    if (url.startsWith('http://')) {
      url = url.replace('http://', 'https://');
    }
    const socket = new SockJS(url);
    
      stompClient.value = Stomp.over(socket);
      stompClient.value.connect({}, () => {
        console.log('Web Socket is connected');
        stompClient.value.subscribe(sub, (newMessage) => {
          
          res.value = JSON.parse(newMessage.body);
          
        });
      });
  }

  const disconnect = () => {  
  if(stompClient != null ) {
    stompClient.value.disconnect();
    stompClient.value = null
    console.log("Disconnected");
  }else {
    console.log("null");
  }
  }

  const sendMessage = (destination,data) =>{
    console.log('use socket');
  if(stompClient.value != null){
          stompClient.value.send(destination, JSON.stringify(data));
      // console.log(data)
  } else {
    alert('vui long kết nối lại')
    }
  }
  return{
    stompClient,
    message,
    content,
    connect,
    disconnect,
    sendMessage
  }
}




