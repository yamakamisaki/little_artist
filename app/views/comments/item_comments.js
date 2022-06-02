
$(".comments_area").html("<%= j(render 'comments/item_comment',  locals: {item: @item, comment: @comment}) %>");

$("textarea").val('');
