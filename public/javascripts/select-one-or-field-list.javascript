// select-one-or-field-list
(function() {
    function selectChanged(el) {
        if(el.value) {
            $(el).siblings().each(function(elc) {
                $(elc).setStyle({display: 'none'});
            });
            $(el).adjacent('input,select,textarea,button').each(function(elc) {
                elc.disabled = true;
            });
        } else {
            $(el).siblings().each(function(elc) {
                // FIXME: assumption of block display
                $(elc).setStyle({display: 'block'});
            });
            // FIXME: maybe some inputs were previously disabled
            $(el).adjacent('input,select,textarea,button').each(function(elc) {
                elc.disabled = false;
            });
        }
    }
    
    new HoboBehavior("div.select-one-or-field-list", {
        events: {
            "> select.select-one-or-field-list-select": {
                ":change": 'eventSelectChanged'
            }
        },
        
        eventSelectChanged: function(ev, el) {
            Event.stop(ev);
            selectChanged(el);
        }
    });
    
    document.observe("dom:loaded", function() {
        $$("select.select-one-or-field-list-select").each(function(el) {
            selectChanged(el);
        });
    });
})();
