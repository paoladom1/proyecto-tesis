const alertPersonalizado = (message, type, icon, cont=0) => {
    const alertPlaceholder = document.getElementById('liveAlertPlaceholder')
    const wrapper = document.createElement('div')
    var icon_f;
    if (icon == 2) {
        icon_f = `   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>`  
    } else if(icon == 1){
        icon_f = '   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>'
    }
    wrapper.innerHTML = 
        `<div class="alert alert${cont} alert-${type} d-flex align-items-center" role="alert">`+
        icon_f+
        `   <div>${message}</div>`+
        '</div>';
        window.setTimeout(function() {
            $(`.alert${cont}`).fadeTo(500, 0).slideUp(500, function(){
                $(this).remove(); 
            });
        }, 2000);
        alertPlaceholder.append(wrapper)
}