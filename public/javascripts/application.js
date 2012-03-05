function remove_field(element, item) {
  element.up(item).remove();
}

jQuery(function($) {
    $("select#lecture_category_id").change(function() {
		if($(this).val() == "Nova"){
			$(this).hide()
			$("#new_category_text").show()
		}
    });

	$("#lecture_category_back").click(function() {
		$('#new_category_text').hide()
		$("select#lecture_category_id option:first").attr("selected", true);
		$("select#lecture_category_id").show()
	});
	
	$("#lecture_category_submit").click(function() {
		if($("#lecture_category_text").val() != ""){
			jQuery.get('insert_category_select/' + $("#lecture_category_text").val(), function(data){
				$("select#lecture_category_id").html(data);
				$("#new_category_text").hide()
				$("select#lecture_category_id").show()
			})
		} else {
			$("#lecture_category_text").focus()
		}
    });

	$("select#lecture_place_id").change(function() {
		if($(this).val() == "Novo"){
			$(this).hide()
			$("#new_place_text").show()
		}
    });

	$("#lecture_place_back").click(function() {
		$('#new_place_text').hide()
		$("select#lecture_place_id option:first").attr("selected", true);
		$("select#lecture_place_id").show()
	});

	$("#lecture_place_submit").click(function() {
		if($("#lecture_place_text").val() != ""){
			jQuery.get('insert_place_select/' + $("#lecture_place_text").val(), function(data){
				$("select#lecture_place_id").html(data);
				$("#new_place_text").hide()
				$("select#lecture_place_id").show()
			})
		} else {
			$("#lecture_place_text").focus()
		}
    });

	$("select#sponsor_sponsor_type_id").change(function() {
		if($(this).val() == "Novo"){
			$(this).hide()
			$("#new_sponsor_type_text").show()
		}
    });

	$("#sponsor_sponsor_type_back").click(function() {
		$('#new_sponsor_type_text').hide()
		$("select#sponsor_sponsor_type_id option:first").attr("selected", true);
		$("select#sponsor_sponsor_type_id").show()
	});

	$("#sponsor_sponsor_type_submit").click(function() {
		if($("#sponsor_sponsor_type_text").val() != ""){
			jQuery.get('insert_sponsor_type_select/' + $("#sponsor_sponsor_type_text").val(), function(data){
				$("select#sponsor_sponsor_type_id").html(data);
				$("#new_sponsor_type_text").hide()
				$("select#sponsor_sponsor_type_id").show()
			})
		} else {
			$("#sponsor_sponsor_type_text").focus()
		}
    });
})
