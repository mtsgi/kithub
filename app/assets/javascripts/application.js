//= require rails-ujs
//= require turbolinks
//= require_tree
function star(){
    document.cookie = "star=" + location.pathname;
}
function unstar(){
    document.cookie = "";
}