// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function open_dialog(_text){
	if (!instance_exists(obj_dialog_box)) {
		var _box = instance_create_layer(0, 0, "Instances_1", obj_dialog_box);
		with (_box) {
			_text_full = _text;
		}
	}
}