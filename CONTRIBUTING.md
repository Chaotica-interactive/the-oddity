# How to contrubute to The Oddity
## some info:
This game is a rather ambitious project, so I do want to make it known that we find your contributions incredibly helpfull considering most of the poeple working on this are just hobbyists trying to have fun making aneat game about space exploration and adventures.

this game is free and open source, though thats free as in freedom so this may be a paid release on steam and various other platforms. If you feel you are a heavy contributer wanting  some compensation for your work, reach out! Though do keep in mind we can only provide as much as we feel like we can and this project is not for-profit, so please do not work on it if all you expect is to get paid from it.

## Tools you'll need:
### Godot!
![Screenshot of the Godot editor](https://user-images.githubusercontent.com/85266594/175846521-6261d9a4-4a22-406f-94e7-97048f66cd0c.png)
---
The entire game is made in the [Godot Game Engine](https://github.com/godotengine/godot "Godot's github repo"), so you'll need to install Godot game engine in order to test the game out and develop in it in general, this is considered to be pretty bare minimum though it is possible to edit everything with an external code editor and Godot's CLI, but at that point you might as well just open the editor, it only takes 5 seconds anyways.

> **Keep in mind:** this project is not made in Godot Mono and any pull requests that use C# will be rejected.

if you dont already have it [Here's the link to download the engine.](https://godotengine.org/ "Godot engine homepage")

### VSCode! (or its equivalents)
![Screenshot of the VSCode editor](https://user-images.githubusercontent.com/85266594/175847930-c4d73d37-64c7-4100-a80e-e3a5ca48c81f.png)
---
This isent really required as much as its highly reccomended but [VSCode](https://github.com/microsoft/vscode "VSCode's Github repo") is the tool of choice for code eding and git controll.

**By all means use whatever code editor you wish!** But do keep in mind what kind of files it might add on by default and try to avoid pushing those!

if you dont already have it, [Here's the link to download VSCode.](https://code.visualstudio.com/ "VSCode code editor website link")

### Blender!
![Screenshot of the Blender 3D modelling program](https://user-images.githubusercontent.com/85266594/175850309-44d4a7ca-6551-40a8-9315-05ed8041cfa4.png)
---
If you plan on refining, optomising, or making new models, its required to use Blender. As much as id like to say "you can use any 3D modelling program you'd like!" that would fragment things way too much and we have a strict policy on using proprietary formats unless its aboslutly nessesary. Blender is free, it is not nessesary to use anything else like Maya or Cinema 4D.

> **Keep in mind:** contributing a model or updating one requires the source file to that model in .blend and must be readable in blender, if it is corrupted or doesent match the corresponding exported model then that pull request will be rejected.

## Some policies regarding contribution:
- **KEEP. IT. OPEN.**
  - Absolutely no proprietary formats.
    - only acception is if it is decided if it is warrented. **only repo owners decide wether or not somthing is nessesary or not.**
  - Absolutely no obfuscation.
  - Follow the AGPL license terms.
- **Please use GDScript.**
  - Avoid trying to convert other files from GDScript to GDNative(C/C++) just because its more performant, we know it is, but GDScript is easier to use and develop with.
  - Do not use C#. Not everyone has Godot Mono, or frankly even wants to use it. doing so can cause fragmentation which we want to avoid.
  - Do not use plugins that add in other language support. As cool as that feature is, use it on your own projects, not one a big one built by a community of mostly GDScript developers.
- **Make things easier for other developers.**
  - Dont be **THAT** guy who has all their work require some mega obscure tooling to be understandable or hell even useable.
  - Make your code readable. As good as it is to make really fast code, make it readable and understandable first THEN work on optomisation if it is warrented.
  - Document your code. Add comments whereever is reasonable, that means not for every single line, and not for every 100 lines, just whenever somthing new comes up, or say theres a particularly long and compicated line, it would be very helpfull to make a comment.
    - Absolutely no insensitive or offensive language in your comments. Swearing is cool, slurs are not.
    - Do avoid "meme" comments, yes they are funny but people are tryign to get work done and you are taking up reviewers time if all you gotta push is somthig dumb.

thats about all I can think of for now, happy coding!
