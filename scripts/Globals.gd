extends Node

var world = null
var score = 0

var highscore = [
    ["", 0],
    ["", 0],
    ["", 0],
    ["", 0],
    ["", 0]
]


func add_child_to_world(inst) -> void:
    """
    Adds a child node to the world base node
    Makes sure the world is set first before actually adding
    """
    if world != null:
        world.add_child(inst)          


func load_high_scores() -> void:
    var in_file = File.new()
    in_file.open("user://highscores.data", File.READ)
    var hs_data = parse_json(in_file.get_as_text())
    highscore = hs_data
    in_file.close()


func store_high_score() -> void:
    var out_file = File.new()
    out_file.open("user://highscores.data", File.WRITE)
    out_file.store_line(to_json(highscore))
    out_file.close()
    

func process_high_score(name: ="") -> void:
    highscore.append(["", score])
    highscore.sort_custom(HighScoreSorter, "sort")           
    highscore.pop_back()


class HighScoreSorter:
    static func sort(a, b) -> bool:
        if a[1] > b[1]:
            return true
        return false


