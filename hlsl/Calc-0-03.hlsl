﻿/*
Plot := 3;
SolutionMode := False;
*/


//vs-calc.begin;

float sqr(float x) { return x * x; }

float Force(float k, float l, float l0, int m)
{
  float result;
  if (Divi4 == 1.0)
    result = k * (l - l0);
  else
    result = k * sqr(l - l0) / 50;
  if (m == 1) result = max(result, 0);
  if (m == 2) result = min(result, 0);
  return result;
}

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

  float4 l = ParamL;
  float4 k = ParamK;

  int3 m;
  m.x = OptioM.x;
  m.y = OptioM.y;
  m.z = OptioM.z;

  float su;
  float sv;

  const float Epsilon = 0.0001f;

  if (t.x > Epsilon && t.y > Epsilon && t.z > Epsilon)
  {
    float3 f;
    f.x = Force(k.x, t.x, l.x, m.x);
    f.y = Force(k.y, t.y, l.y, m.y);
    f.z = Force(k.z, t.z, l.z, m.z);

    float3 u;
    u.x = f.x * (x-p1.x) / t.x;
    u.y = f.y * (x-p2.x) / t.y;
    u.z = f.z * (x-p3.x) / t.z;

    float3 v;
    v.x = f.x * (y-p1.y) / t.x;
    v.y = f.y * (y-p2.y) / t.y;
    v.z = f.z * (y-p3.y) / t.z;

    su = (u.x + u.y + u.z) * 100000;
    sv = (v.x + v.y + v.z) * 100000;
  }
  else
  {
    su = 0;
    sv = 0;
  }

  return su + sv;
}

//vs-calc.end;