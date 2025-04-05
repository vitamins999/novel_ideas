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

/// @function checkStringType(inputStr)
/// @param inputStr The input string to check.
/// @returns "blank" if the first character is "&", "player" if it is "^",
///          "enemy" if it is "~", and "none" otherwise.
function checkStringType(inputStr) {
    // Ensure the string has at least one character.
    if (string_length(inputStr) < 1) {
        return OWNER.NONE;
    }
    
    // Get the first character of the string.
    var firstChar = string_copy(inputStr, 1, 1);
    
    // Determine the return value based on the first character.
    if (firstChar == "&") {
        return OWNER.BLANK;
    } else if (firstChar == "^") {
        return OWNER.PLAYER;
    } else if (firstChar == "~") {
        return OWNER.ENEMY;
    } else {
        return OWNER.NONE;
    }
}

function RemoveOwnerFormatting(inputStr) {
    // Ensure the string has at least one character.
    if (string_length(inputStr) < 1) {
        return inputStr;
    }
    
    // Get the first character.
    var firstChar = string_copy(inputStr, 1, 1);
    
    // Check if it's one of the special characters.
    if (firstChar == "&" || firstChar == "^" || firstChar == "~") {
        // Return the string without the first character.
        return string_copy(inputStr, 2, string_length(inputStr) - 1);
    }
    
    // If no special character, return the string as is.
    return inputStr;
}

function RemoveFormattingFromSentence(sentence) {
    // Split the sentence into an array of words using space as the delimiter.
    var words = string_split(sentence, " ");
    
    // Loop through each word and remove formatting if necessary.
    for (var i = 0; i < array_length(words); i++) {
        words[i] = RemoveOwnerFormatting(words[i]);
    }
    
    // Reconstruct the sentence by joining the words with spaces.
    var result = "";
    for (var i = 0; i < array_length(words); i++) {
        result += words[i];
        if (i < array_length(words) - 1) {
            result += " ";
        }
    }
    
    return result;
}