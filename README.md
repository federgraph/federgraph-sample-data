# federgraph-sample-data
Sample data for the Federgraph application.

## sub folders

## glsl
Some *.glsl files ready for dropping.
Glsl is used with Open GL.
Open GL is used on Mac and mobile devices.

## hlsl
Some *.hlsl files ready for dropping.
Hlsl is used on Windows only.

## html
- Sample data can be embedded in a bunch of html tags.
- This should be an alternative form of sharing data.
- Edit the html and put it on a static server.
- It can then be previewed in a browser.
- And finally saved to a file locally and dropped onto the drop target. 
- The Application accepts html files and expects to find the embedded data islands.
- These data islands are not standard xml data islands.
- They are just blocks of text marked by a special begin and end comment.
- The purpose is to combine two or three pieces of text into one file.
- Take it as an idea that seems to work.
- We will need all three pieces of text data, also in the future.

## imprinted
Subfolder 'imprinted' holds png images with imprinted data.

If you look at the first line of pixels in the image - the pixels appear reddish.
The red channel of the pixel data has been overwritten to contains the model data of the image.
You can drop the image onto the drop target of the application, and the app wil load the image.

## named
A selection of text files with data for model and view parameters, and options.

## original
- Just some of the old samples to start with.
- Some of these samples are more than 4 years old.
- I believe that each of them is interesting, even if they do not look nice.
