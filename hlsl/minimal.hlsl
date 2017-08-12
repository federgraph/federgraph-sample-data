Create a text file with extension hlsl like this. 
Then drop it on the droptarget of the Federgraph app. 
Guess what happens.

//vs-calc.begin;

float Calc(float x, float y, int Plot)
{
  return (x * x + y * y) * 3000;
}

//vs-calc.end;

Make sure that you include the comments and the signature of the Calc function exactly as given, and that it returns a value.

Everything inside the comments will be used as a code snippet. This spippet is considered minimal and will not make use of any available parameters. The local Plot parameter is unused, and any constant buffer values are also not used. It does some z-scaling however.

The next thing up would be that you experiment with the scaling and offset.