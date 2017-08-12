vertex shader snippet is expected between lines

//vs-calc.begin;

...and

//vs-calc.end;

HLSL snippets are used with DirectX on Windows only.
Everything outside the comment is ignored.
On Windows the file should be UTF-8 encoded and have Windows line endings.
BOM should be ok. 
I have setup a file extension to open *.hlsl files in Editor / Notepad.
Using Visual Studio Code is recommended.
Make sure you add syntax highlighting for hlsl there.