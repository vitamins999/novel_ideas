function FormatTextWithLineBreaks(_unformattedString, _maxWidth)
{
	var _formattedString = "";
	
	_unformattedString = string_replace_all(_unformattedString, "  ", " "); // Remove double spaces
	
	// Convert string into an array of the words
	var _stringArr = string_split(_unformattedString, " ");
	// Loop through array
	for (var _i = 0; _i < array_length(_stringArr); _i++)
	{
		// Each loop, add word to formatted string
		_formattedString += _stringArr[_i] + " ";
		
		// Check length of entire string
		var _scribbleObject = scribble(_formattedString);
		var _currentStringWidth = _scribbleObject.get_width();
		
		if (_currentStringWidth >= _maxWidth)
		{
			// Loop backwards each character until space
			for (var _j = string_length(_formattedString) - 1; _j >= 1; _j--)
			{
				if (string_char_at(_formattedString, _j) == " ")
				{
					_formattedString = string_insert(" \n", _formattedString, _j)
					break;
				}
			}
		}
	}
	
	return string_trim(_formattedString);
}

function isPunctuation(ch) {
    return (ch == "." || ch == "?" || ch == "!" || ch == "\"" || ch == "'" || ch == "," || ch == ";" || ch == ":" || ch == "(" || ch == ")" || ch == "\"");
}

function CovertStringToFormattedArrayOfWords(_string)
{
	// Create an empty array for tokens.
    var tokens = [];
    var token = "";
    var len = string_length(_string);
    
    // Loop over each character in the string.
    for (var i = 1; i <= len; i++) {
        var ch = string_char_at(_string, i);
        
        // If the character is a space, then finish the current token.
        if (ch == " ") {
            if (token != "") {
                tokens[array_length(tokens)] = token;
                token = "";
            }
			// Add the space as its own token.
            tokens[array_length(tokens)] = " ";
        }
        // If it’s punctuation, push any current token, then the punctuation as its own token.
        else if (isPunctuation(ch)) {
            if (token != "") {
                tokens[array_length(tokens)] = token;
                token = "";
            }
            tokens[array_length(tokens)] = ch;
        }
        // Otherwise, accumulate the character into the current token.
        else {
            token += ch;
        }
    }
    
    // If there's a token left at the end of the loop, add it to the array.
    if (token != "") {
        tokens[array_length(tokens)] = token;
    }
    
    return tokens;
}