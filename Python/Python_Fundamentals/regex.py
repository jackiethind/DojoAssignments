#!/usr/bin/env python
# -*- coding: utf-8 -*-
# All words that contain a “v” = v
# All words that contain a double-“s” = ss
# All words that end with an “e” = e$
# All words that contain an “b”, any character, then another “b” = b.b
# All words that contain an “b”, at least one character, then another “b” = b.+b
# All words that contain an “b”, any number of characters (including zero), then another “b” = b.*b
# All words that include all five vowels in order = a.*e.*i.*o.*u.*
# All words that only use the letters in “regular expression” (each letter can appear any number of times) = "[regular expression]"
# All words that contain a double letter = r"([a-zA-Z])\1"

import re
def get_matching_words(regex):
    words = ["aimlessness", "assassin", "baby", "beekeeper", "belladonna", "cannonball", "crybaby", "denver", "embraceable", "facetious", "flashbulb", "gaslight", "hobgoblin", "iconoclast", "issue", "kebab", "kilo", "laundered", "mattress",
    "millennia", "natural", "obsessive", "paranoia", "queen", "rabble", "reabsorb", "sacrilegious", "schoolroom", "tabby", "tabloid", "unbearable", "union", "videotape" ,"aeiou"]
    matches = []
    for word in words:
    	if re.search(regex,word):
    		matches.append(word)
    print matches
    return matches

get_matching_words("[regular expression]")
