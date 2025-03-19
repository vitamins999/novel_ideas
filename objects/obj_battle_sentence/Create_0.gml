textStrFormatted = string_replace_all(textStr, "\n ", "\n");

global.lastWordRight = 0;
global.lastWordTop = 0;

var _fullSentence = instance_create_depth(x + 10, y + 5, depth - 10, obj_battle_sentence_full);
variable_instance_set(_fullSentence, "textStr", textStrFormatted);