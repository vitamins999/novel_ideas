wordStrNew = RemoveOwnerFormatting(wordStr);
invisible = false;
scribbleObject = scribble(wordStrNew);
scribbleObject.starting_format("fnt_battle_sentence", c_black);
remainingWordsInSentence = [];