extends Button
class_name SelectButton

var selection = null
var label = ""
var color : Color = Color.WHITE

func _ready():
	text = label
	add_style_box("normal", color)
	add_style_box("hover", color.darkened(0.2))
	add_style_box("pressed", color.darkened(0.4))

func add_style_box(style, color):
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = color
	style_box.corner_detail = 5
	add_theme_stylebox_override(style, style_box)
