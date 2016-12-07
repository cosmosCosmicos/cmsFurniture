/**
 * Created by Mario Guiloff S on 02/12/2016.
 */
$(function() {
    $('.dropdown-toggle').on("click",function(){
        var elemento = $(this).parent().find("ul");
        elemento.html("");
        var text = $(this).text();
        $.ajax({
            url:"application/getPagesNav",
            cache: false,
            type:'GET',
            dataType:'json',
            data:{
                t: text
            }
        })
        .done(function(data) {
            $.each( data.result, function( i, item ) {
                elemento.append('<li><a href="">' +  item.title + '</a></li>');
            });

        })
        .fail(function() {
            alert( "error" );
        });
    });
});