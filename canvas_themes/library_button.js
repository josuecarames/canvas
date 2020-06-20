$( document ).ready(function() {
    function addMenuItem (linkText, linkhref, icon, target) {
      var iconHtml = '',
      itemHtml,
      linkId = linkText.split(' ').join('_'),
      newTab = '';
      if (typeof target !== 'undefined') {
        newTab = 'target="' + target + '"';
      }  else{
        window.open("linkhref","_self")
      }
      if (icon !== '') {
      iconHtml = '<i class="' + icon + '" style="display: block; width: 100%; height: 25px;"></i> ';
      }
      itemHtml = '<li class="ic-app-header__menu-list-item ">' +
      '  <a id="global_nav_' + linkId + '" href="' + linkhref + '" class="ic-app-header__menu-list-link" target="_new">' +
      ' <div class="menu-item__text">' + iconHtml + linkText + '</div>' +
      '  </a>' +
      '</li>';
      $('#menu li:eq(2)').after(itemHtml);
    }
    addMenuItem('Library', 'http://library.fuller.edu/', 'icon-collection','_self');
    
    if ($.inArray("admin", ENV.current_user_roles) == -1) {
         $('a.btn.button-sidebar-wide.delete_course_link').hide();
    }
    });