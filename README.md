# PokedexChecklist
A checklist for which Pokémon you have caught.

While this is intended for use as a Pokédex checklist, it can be used for pretty much anything else.

# Using the checklist
The program displays a grid of items, with a row of buttons underneath. It automatically loads the previous checklist.

To label an item with a colour, click on it. Left clicking will cycle forwards, while right clicking will cycle backwards.
The buttons at either end scroll through the pages, while the button in the middle saves the current checklist.

# Configuration
The program is set up by default for the Generation 4 Pokémon games, but it can be modified to fit other checklists by changing the following constants:
- `BOX_WIDTH` and `BOX_HEIGHT` - How many items are displayed per page. To keep the buttons at the bottom working correctly, `BOX_WIDTH` should be at least 6.
- `SPRITE_WIDTH` and `SPRITE_HEIGHT` - How large the images should be displayed. Ideally, this should be the same as the actual size of the images.
- `DEX_LENGTH` - How many items there are in total. The program automatically pads out the final page with blank spaces.
- `COLOUR` - The colours that items can be labelled with, in #RRGGBB notation. The first and last colours are used by the buttons, so keep this in mind if you change them. Feel free to add, change or remove colours as you wish.

After changing the constants, I'd recommend deleting the `checklist.txt` file, as it may not load correctly with the new values. Because of this, you should test what values for the constants work first before actually using the checklist.

# Images
In the `data` folder, there should be a list of .png images, numbered (with leading zeros) starting from 1. Any images should work as long as they follow this numbering scheme, though ideally they should all be the same size.

For any Pokémon sprites from Generations 3 to 5, I recommend using  [The Cave of Dragonflies](www.dragonflycave.com/resources/sprites), as the sprites there are already numbered.
