function participant_list(add_another, token){
	var parent_name =  $('#parent_name').val()
	var parent_card = $('#parent_card').val()
	var kid_name = $('#kid_name').val()
	$.post("save_kid.js", {parent_name: parent_name, parent_card: parent_card, kid_name: kid_name, add_another: add_another, token: token})
}

function load_update(kid_id, parent_card, parent_name, token){
	$.redirect("update",{ 	kid_id: kid_id,
							parent_name: parent_name, 
							parent_card: parent_card,
							authenticity_token: token 
							}); 
}