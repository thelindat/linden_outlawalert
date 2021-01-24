$('document').ready(function() {
    alerts = {};
    
    window.addEventListener('message', function (event) {
        ShowNotif(event.data);
    });

    function ShowNotif(data) {
            var $notification = CreateNotification(data);
            var $height = $notification.height;
            $('.notif-container').prepend($notification.animate({width: '360px', height: ''+ $height +'', 'line-height':'1.5em', fontSize: '12px', margin:'0 0 4px 0', opacity:'1'}));
            setTimeout(function() {
                $.when($notification.animate({width: '0', height:'0', fontSize: '0', margin:'5px 5px 5px 350px', opacity:'0'})).done(function() {
                    $notification.remove()
                });
            }, data.length != null ? data.length : 2500);
    }

    function truncate($str, $chars, $end = '...') {
        if (strlen($str) <= $chars) return $str;
        $new = substr($str, 0, $chars + 1);
        return substr($new, 0, strrpos($new, ' ')) . $end;
    }
    
    function CreateNotification(data) {
       var $notification = $(document.createElement('div'));
       if (data.info.isImportant === 1) {
            $notification.addClass('notification').addClass('officer-down');
       } else {
            $notification.addClass('notification').addClass(data.job);
       }
       if (data.info.info !== undefined) {
        data.info.info = data.info.info.substring(0,102);
        var length = data.info.info.length
        if (length >= 52) {
            data.info.info2 = ''
        }

        if(!/^[A-Za-z0-9]/.test(data.info.info)) {
            var right = data.info.info.search("\\]");
            data.info.info = '<span id="descbanner">' + data.info.info.substring(1, right) + '</span> ' + data.info.info.slice(right+2) + ''
        }

           if (data.info.info2 !== undefined) {
                $notification.html('\
                <div class="content">\
                <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
                <div id="code">' + data.info.displayCode + '</div>\
                <div id="alert-name">' + data.info.dispatchMessage + '</div>\
                <div id="alert-info"><i class="fas ' + data.info.infoM + '"></i>' + data.info.info + '<br><i class="fas ' + data.info.infoM2 + '"></i>' + data.info.info2 + '<br><span style="text-verflow: hidden; white-space: nowrap;"><i class="fas fa-globe-europe"></i>' + data.info.street + '</span></div>\
                </div>');
                $notification.height = '93px'
            } else {
                $notification.html('\
                <div class="content">\
                <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
                <div id="code">' + data.info.displayCode + '</div>\
                <div id="alert-name">' + data.info.dispatchMessage + '</div>\
                <div id="alert-info"><i class="fas ' + data.info.infoM + '"></i>' + data.info.info + '<br><span style="text-verflow: hidden; white-space: nowrap;"><i class="fas fa-globe-europe"></i>' + data.info.street + '</span></div>\
                </div>');
                $notification.height = '73px'
            }
       } else {
            $notification.html('\
            <div class="content">\
            <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
            <div id="code">' + data.info.displayCode + '</div>\
            <div id="alert-name">' + data.info.dispatchMessage + '</div>\
            <div id="alert-info"><span style="text-verflow: hidden; white-space: nowrap;"><i class="fas fa-globe-europe"></i>' + data.info.street + '</span></div>\
            </div>');
            $notification.height = '53px'
       }
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
//       <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\