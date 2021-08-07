# language_model
This is a basic python/torch language model neural net

Special thanks to Prateek Joshi at Analytics Vidhya for most of the code
https://www.analyticsvidhya.com/blog/2020/08/build-a-natural-language-generation-nlg-system-using-pytorch/

And thanks to Project Gutenberg for providing The King James Bible & The Complete Works of Shakespeare as plain text files
https://www.gutenberg.org/

To run this, you will need PyTorch, which you can get from here -> https://pytorch.org/get-started/locally/

# Running this

This runs in two mode, `learn` and `generate`.

## Learn Mode

When run in `learn` mode, it takes a text file or pickle file of paragraphs, tokenises it, then create
a language model neural net from the text. The tokens & neural net are then saved as `pickle` files, for use
in generating text later.


## Generate Mode

In generate mode, it will generate text from a NN you have previously generated in Learn Mode. I have included an NN I created from
500 movie reviews (as per Prateek Joshi) - called `plots`.

This means you can start generating text right away by using the NN I have provided.

Generally it produces nonsense that sounds vaguely like it might be English. Just a bit of fun.

Example

	$ ./language_model -g plots -n 50 -s "the man stopped"

	the man stopped with the rest effect of bobbili sanchez wyatt in a clinical dramatic line in defiance
	of the inventor akston arrives in a clinical depression run in the third scene are forced to be a
	serious to a girl and is facing eviction in a ritual and the other character has

	$ ./language_model -g King_James_Bible -s "Lo"  -n 35

	Lo a man hath given me to be a great earthquake in a city and they were not written and
	they shall come unto him that is of the city of God which was of God


Its something. Like I said "nonsense".


# Command Line Options

	usage: language_model [-h] [-l LEARN] [-c CHECK_WORD] [-g GENERATE] [-s SEED_TEXT] [-n NUMBER]

	PyTorch Language Model

	optional arguments:
	  -h, --help            show this help message and exit
	  -l LEARN, --learn LEARN
							Create model from this file
	  -c CHECK_WORD, --check-word CHECK_WORD
							Check this word can be tokenised
	  -g GENERATE, --generate GENERATE
							Make some text from seed provided
	  -s SEED_TEXT, --seed-text SEED_TEXT
							Seed Text
	  -n NUMBER, --number NUMBER
							Number of words to output

`--learn [file]` will take one parameter, which is the name of the text or pickle file to train from. A text file should
be a series of paragraphs broken with blank lines. A pickle file should be an array of paragraphs.

Once it has loaded the file, it will check one word can be correctly tokenised, the default is `the`, but if this word doe not
appear in your training data, then you will need to give it a different check work.

`--generate [file]` - this will load a pre-created NN and generate text, you can seed the text with the `--seed` option 
(default no seed) and you can specify how many word you want with the `--number` option (default 15).

Either `--learn` or `--generate` (`-l` or `-g`) *must* be provided.
