console.log(Notification.permission);

Notification.requestPermission(
  function(status){
    console.log('Notification permission status:',status);
  }
);

function displayNotification(){
  if (Notification.permission === 'granted'){
    navigator.serviceWorker.getRegistration().then(function(reg){
      reg.showNotification("Mr. Health");
    });
  }
}

var options = {
  body: 'bora toma uma água!',
  icon: 'logo.png',
  vibrate: [100,50,100],
  // allows us to identify notification
  data: {primaryKey: 1 }
};

new Notification('Mr.health', options);
