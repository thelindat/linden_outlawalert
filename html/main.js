$('document').ready(function() {
    alerts = {};
    
    window.addEventListener('message', function (event) {
        ShowNotif(event.data);
    });

    function ShowNotif(data) {
            var $notification = CreateNotification(data);
            var $height = '75px';
            $('.notif-container').prepend($notification.animate({width: '350px', height: ''+ $height +'', 'line-height':'1.5em', fontSize: '12px', margin:'0 0 4px 0', opacity:'1'}));
            setTimeout(function() {
                $.when($notification.animate({width: '0', height:'0', fontSize: '0', margin:'5px 5px 5px 350px', opacity:'0'})).done(function() {
                    $notification.remove()
                });
            }, data.length != null ? data.length : 2500);
    }

    function CreateNotification(data) {
       var $notification = $(document.createElement('div'));
       if (data.info.isImportant === 1) {
            $notification.addClass('notification').addClass('officer-down');
       } else {
            $notification.addClass('notification').addClass(data.job);
       }
       $notification.html('\
       <div class="content">\
       <div id="code">' + data.info.displayCode + '</div>\
       <div id="alert-name">' + data.info.dispatchMessage + '</div>\
       <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
       <div id="alert-info"><i class="fas fa-globe-europe"></i>' + data.info.street + '</div>\
       </div>');
       $notification.fadeIn();
       if (data.style !== undefined) {
           Object.keys(data.style).forEach(function(css) {
               $notification.css(css, data.style[css])
           });
       }
       return $notification;
    }
});

//       <div id="alert-info"><i class="fas fa-globe-europe"></i>' + data.info["loc"] + '</div>\