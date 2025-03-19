if (textStr != -1)
{
	scribbleObject = scribble(textStr);
	typist.in(typewriteSpeed, 0);
	scribbleObject.starting_format("fnt_battle_sentence", c_black);
	scribbleObject.draw(x, y, typist);
};