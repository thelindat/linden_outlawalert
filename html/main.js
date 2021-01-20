$('document').ready(function() {
    alerts = {};

    $(".notification").fadeIn();

    window.addEventListener('message', function (event) {
        if (event.data.action == "display") {
            ShowNotif(event.data);
        } else if (event.data.action == "log"){
            $(".notification").hide();
        }  else {
            $(".notification").fadeIn();
        }
    });

    function ShowNotif(data) {
        var $notification = CreateNotification(data);
        var $notifHeight = $notification.height
        $('.notif-container').prepend($notification.animate({width: '350px', height: ''+ $notifHeight +'', 'line-height':'1.5em', fontSize: '12px', margin:'0 0 4px 0', opacity:'1'}));
        setTimeout(function() {
            $.when($notification.animate({width: '0px', height:'0px', fontSize: '0px', margin:'0 0 0 350px', opacity:'0'})).done(function() {
                $notification.remove()
            });
        }, data.length != null ? data.length : 4500);
}

    function CreateNotification(data) {
        var $notification = $(document.createElement('div'));
        $notification.addClass('notification').addClass(data.info["style"]);
        if (data.info["desc"] == undefined) {
            $notification.html('\
                <div class="content">\
                <div id="code">' + data.info["code"] + '</div>\
                <div id="alert-name">' + data.info["name"] + '</div>\
                <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
                <div id="alert-info"><i class="fas fa-globe"></i>' + data.info["loc"] + '</div>\
                </div>');
                $notification.height = '50px';
        } else {
            var desc = data.info["desc"];
            if(!/^[A-Za-z0-9]/.test(desc)) {
                var right = desc.search("\\]");
                desc = '<span id="descbanner">' + desc.substring(1, right) + '</span> ' + desc.slice(right+2) + ''
            }
            if (data.info["desc2"] == undefined) {
                $notification.html('\
                <div class="content">\
                <div id="code">' + data.info["code"] + '</div>\
                <div id="alert-name">' + data.info["name"] + '</div>\
                <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
                <div id="alert-info"><i class="fas fa-info-circle"></i>' + desc + '</br>\
                <i class="fas fa-globe"></i>' + data.info["loc"] + '</div>\
                </div>');
                $notification.height = '68px';
            } else {
                var desc2 = data.info["desc2"];
                $notification.html('\
                <div class="content">\
                <div id="code">' + data.info["code"] + '</div>\
                <div id="alert-name">' + data.info["name"] + '</div>\
                <div id="marker"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></div>\
                <div id="alert-info"><i class="fas fa-info-circle"></i>' + desc + '</br>\
                ' + desc2 + '<br>\
                <i class="fas fa-globe"></i>' + data.info["loc"] + '</div>\
                </div>');
                $notification.height = '90px';
            }
        }       

        $notification.fadeIn();
        if (data.info["style"] !== undefined) {
            Object.keys(data.info["style"]).forEach(function(css) {
                $notification.css(css, data.info["style"][css])
            });
        }
        return $notification;
    }

});

