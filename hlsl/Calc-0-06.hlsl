/*
Plot := 6; //Richtung
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

  float f1 = Force(k.x, t.x, l.x, m.x);
  float f2 = Force(k.y, t.y, l.y, m.y);
  float f3 = Force(k.z, t.z, l.z, m.z);

  // normalisierte Kraft in Richtung Feder mit Betrag 1
  float3 vn1 = normalize(p-p1);
  float3 vn2 = normalize(p-p2);
  float3 vn3 = normalize(p-p3);

  // betragsrichtige Kraft in Feder
  float3 vf1 = vn1 * f1;
  float3 vf2 = vn2 * f2;
  float3 vf3 = vn3 * f3;

  // Richtung der resultierende Kraft
  float3 vf0 = vf1 + vf2 + vf3;
  float3 vfn = normalize(vf0);

  // Richtungs-Cosinus und Sinus
  float3 vcf = normalize(float3(1, 0, 1));
  float3 vsf = normalize(float3(0, 1, 1));
  float cf = dot(vfn, vcf);
  float sf = dot(vfn, vsf);

  int PlotFigure = max(MP02.z, 0);
  float FaktorEQ = MP01.w;
  float g7 = 0;

  switch (PlotFigure) {
    case 1: g7 = cf * 200 * FaktorEQ; break;
    case 2: g7 = abs(cf) * 200 * FaktorEQ; break;
    case 3: g7 = abs(sf) * 200 * FaktorEQ; break;
    case 4: g7 = sf * 200 * FaktorEQ; break;
  }

  return g7;
}

//vscalc.end;