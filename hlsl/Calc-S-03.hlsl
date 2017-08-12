
/*
Plot := 3;
SolutionMode := True;
*/

//vs-calc.begin;

float Calc(float x, float y, int Plot)
{
  float3 p = float3(x, y, 0.0f);

  float3 p1 = P1.xyz;
  float3 p2 = P2.xyz;
  float3 p3 = P3.xyz;

  float4 l = ParamL;
  float4 k = ParamK;

  float3 t;
  t.x = length(p-p1);
  t.y = length(p-p2);
  t.z = length(p-p3);

  float3 b;
  b.x = t.y * t.z * (t.x-l.x) * k.x;
  b.y = t.x * t.z * (t.y-l.y) * k.y;
  b.z = t.x * t.y * (t.z-l.z) * k.z;

  float3 u;
  u.x = b.x * (x-p1.x);
  u.y = b.y * (x-p2.x);
  u.z = b.z * (x-p3.x);

  float3 v;
  v.x = b.x * (y-p1.y);
  v.y = b.y * (y-p2.y);
  v.z = b.z * (y-p3.y);

  float su = u.x + u.y + u.z;
  float sv = v.x + v.y + v.z;

  return su + sv;
}

//vs-calc.end;