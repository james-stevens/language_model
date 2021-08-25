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

In generate mode, it will generate text from a NN you have previously generated in Learn Mode. I have included a few NN I created.
`plots.pickle` are paragraphs of movie plots, the `txt` files explain themselves.

This means you can start generating text right away by using any NN I have provided.

Generally it produces nonsense that sounds vaguely like it might be English. Just a bit of fun.
`plots` is the least amount of text, so is the most meaningless. The King James Bible & The Complete Works of Shakespeare
provide enough text to be almost meaningful and definitely reproduce something of the linguistic style of the training data.


Example

	./language_model -g plots -n 35 -s "he walked"

	he walked out with the family of his wife who has to leave his partial zoe
	and zoe in a small comics peter to rescue his latest zoe who has to be removed
	and quarantined and the

	$ ./language_model -g King_James_Bible -s "Lo"  -n 35

	Lo the Lord and to them which were with them that were with him heard that the
	seven things which are called unto him that sat upon the horse of his mouth for
	ever for ever

	$ ./language_model -g King_James_Bible -s "Above"  -n 37

	Above his heart was not able to make a full of the seven beasts of God which was
	the throne and the seven and of a great city and he was the third angel which
	is the first

	$ ./language_model -g Complete_Works_of_Shakespeare -n 35 -s "inequality"

	inequality in my heart And with his face she is a boar of his eyes and all his eyes and all the world
	that he hath been so bold and in the ground And in her

	$ ./language_model -g Complete_Works_of_Shakespeare -n 35 -s "Love"

	Love is the shadow of her eyes are in his eyes the world doth bear her to his eyes and his heart and
	his eyes are dead and all his eyes and the world doth bear

	$ ./language_model -g Tolstoy -s "When I opened the door" -n 50

	When I opened the door and the first day in my eyes in a new face in a new and happy smile of my life
	I was in a new way and the same feeling which had been so much and that he was in the same way and
	I had not been in my


NOTE: Becuase of the github file size limit, the `Tolstoy` NN has been split into 5 files, you need to run this to remake the model file

	$ cat Tolstoy_model.pickle.part_* > Tolstoy_model.pickle



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
	  -t NUM_TOKENS, --num-tokens NUM_TOKENS
                            Number of words in a rows to use to make one sequence


`--learn [file]` will take one parameter, which is the name of the text or pickle file to train from. A text file should
be a series of paragraphs broken with blank lines. A pickle file should be an array of paragraphs.

When learning, by default, it uses sequences of 5 words `-t`/`--num-tokens` lets you change this to any value you like.

Once it has loaded the file, it will check one word can be correctly tokenised, the default is `the`, but if this word does not
appear in your training data, then you will need to give it a different check work.

`--generate [file]` - this will load a pre-created NN and generate text, you can seed the text with the `--seed` option 
(default no seed) and you can specify how many word you want with the `--number` option (default 15).

Either `--learn` or `--generate` (`-l` or `-g`) *must* be provided.
