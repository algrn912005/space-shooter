extends Node

const HIGHSCORE_DATA = "user://highscores.data"

var world = null
var score = 0

var highscore = [
    ["ANON", 0],
    ["ANON", 0],
    ["ANON", 0],
    ["ANON", 0],
    ["ANON", 0]
]


func add_child_to_world(inst) -> void:
    """
    Adds a child node to the world base node
    Makes sure the world is set first before actually adding
    """
    if world != null:
        world.add_child(inst)          


func load_high_scores() -> Array:
    var in_file = File.new()
    if in_file.file_exists(HIGHSCORE_DATA):
        in_file.open(HIGHSCORE_DATA, File.READ)
        var hs_data = parse_json(in_file.get_as_text())
        highscore = hs_data
    in_file.close()
    
    return highscore


func store_high_score() -> void:
    var out_file = File.new()
    out_file.open(HIGHSCORE_DATA, File.WRITE)
    out_file.store_line(to_json(highscore))
    out_file.close()
    

func process_high_score(name: ="") -> void:
    highscore.append(["Alvin", score])
    highscore.sort_custom(HighScoreSorter, "sort")           
    highscore.pop_back()


class HighScoreSorter:
    static func sort(a, b) -> bool:
        if a[1] > b[1]:
            return true
        return false
