// id="comments_areaにをrenderで指定した部分テンプレートに更新
$("#comments_area").html("<%= j(render 'comments/item_comment', item: @item, comment: @comment) %>");
// フォームを送信したあとにフォームの値を空にする
$("textarea").val('');