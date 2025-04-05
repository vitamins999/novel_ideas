wordStrNew = RemoveOwnerFormatting(wordStr);
invisible = true;
alarm[0] = 120;
scribbleObject = scribble(wordStrNew);
scribbleObject.starting_format("fnt_battle_sentence", c_black);
remainingWordsInSentence = [];