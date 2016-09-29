function participant_list(add_another){
	var parent_name =  $('#parent_name').val()
	var parent_card = $('#parent_card').val()
	var kid_name = $('#kid_name').val()
	$.post("save_kid.js", {parent_name: parent_name, parent_card: parent_card, kid_name: kid_name, add_another: add_another})
}
