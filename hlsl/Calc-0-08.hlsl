
/*
Plot := 8; //Energy
*/

//vs-calc.begin;

float sqr(float x) { return x * x; }

float Calc(float x, float y, int Plot)
{
  float3 p = float3(x, y, 0.0f);

  float3 p1 = P1.xyz;
  float3 p2 = P2.xyz;
  float3 p3 = P3.xyz;

  float3 t;
  t.x = length(p-p1);
  t.y = length(p-p2);
  t.z = length(p-p3);

  float4 k = ParamK;
  float4 l = ParamL;

  float3 b;
  b.x = k.x * sqr(t.x - l.x) / 2.0f;
  b.y = k.y * sqr(t.y - l.y) / 2.0f;
  b.z = k.z * sqr(t.z - l.z) / 2.0f;

  return (b.x + b.y + b.z) * 5000.0f;
}

//vs-calc.end;
