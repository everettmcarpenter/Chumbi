//---------------------------------------------------------------------
// author: everett m. carpenter (but heavily taken from Ge Wang)
//---------------------------------------------------------------------

CKDoc doc;

// encoders
doc.addGroup(
    ["Encode", "ABFormat", "BAFormat"],
    "Encoders and Converters",
    "encoders", 
    "Ambisonic virtual encoders and microphone utilities."
);

// decoders
doc.addGroup(
    [ "Decode", "SAD", "DBD"],
    "Decoders",
    "decoders",
    "Ambisonic decoders."
);

//utilities
doc.addGroup(
    [ "OrderGain", "Mirror", "Rotate", "Warp" ],
    "Soundfield Utilities",
    "utilities",
    "Basic soundfield alterers, shapers and modifiers."
);


doc.genGroups(["Encoders and Converters", "Decoders", "Soundfield Utilities"]);

// generate
doc.outputToDir( ".", "Chumbi Doc" );
