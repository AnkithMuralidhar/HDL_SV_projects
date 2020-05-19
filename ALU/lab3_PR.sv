module lab3_PR(
		input logic [31:0] A, B,
		output reg [16:0] z);

	logic [15:0] e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;

	assign e[0] = ~(A[0] ^ B[0]) | (B[16]);
	assign e[1] = ~(A[1] ^ B[1]) | (B[17]);
	assign e[2] = ~(A[2] ^ B[2]) | (B[18]);
	assign e[3] = ~(A[3] ^ B[3]) | (B[19]);
	assign e[4] = ~(A[4] ^ B[4]) | (B[20]);
	assign e[5] = ~(A[5] ^ B[5]) | (B[21]);
	assign e[6] = ~(A[6] ^ B[6]) | (B[22]);
	assign e[7] = ~(A[7] ^ B[7]) | (B[23]);
	assign e[8] = ~(A[8] ^ B[8]) | (B[24]);
	assign e[9] = ~(A[9] ^ B[9]) | (B[25]);
	assign e[10] = ~(A[10] ^ B[10]) | (B[26]);
	assign e[11] = ~(A[11] ^ B[11]) | (B[27]);
	assign e[12] = ~(A[12] ^ B[12]) | (B[28]);
	assign e[13] = ~(A[13] ^ B[13]) | (B[29]);
	assign e[14] = ~(A[14] ^ B[14]) | (B[30]);
	assign e[15] = ~(A[15] ^ B[15]) | (B[31]);

	assign z[0] = &e;

	assign f[0] = ~(A[1] ^ B[0]) | (B[16]);
	assign f[1] = ~(A[2] ^ B[1]) | (B[17]);
	assign f[2] = ~(A[3] ^ B[2]) | (B[18]);
	assign f[3] = ~(A[4] ^ B[3]) | (B[19]);
	assign f[4] = ~(A[5] ^ B[4]) | (B[20]);
	assign f[5] = ~(A[6] ^ B[5]) | (B[21]);
	assign f[6] = ~(A[7] ^ B[6]) | (B[22]);
	assign f[7] = ~(A[8] ^ B[7]) | (B[23]);
	assign f[8] = ~(A[9] ^ B[8]) | (B[24]);
	assign f[9] = ~(A[10] ^ B[9]) | (B[25]);
	assign f[10] = ~(A[11] ^ B[10]) | (B[26]);
	assign f[11] = ~(A[12] ^ B[11]) | (B[27]);
	assign f[12] = ~(A[13] ^ B[12]) | (B[28]);
	assign f[13] = ~(A[14] ^ B[13]) | (B[29]);
	assign f[14] = ~(A[15] ^ B[14]) | (B[30]);
	assign f[15] = ~(A[16] ^ B[15]) | (B[31]);

	assign z[1] = &f;

	assign g[0] = ~(A[2] ^ B[0]) | (B[16]);
	assign g[1] = ~(A[3] ^ B[1]) | (B[17]);
	assign g[2] = ~(A[4] ^ B[2]) | (B[18]);
	assign g[3] = ~(A[5] ^ B[3]) | (B[19]);
	assign g[4] = ~(A[6] ^ B[4]) | (B[20]);
	assign g[5] = ~(A[7] ^ B[5]) | (B[21]);
	assign g[6] = ~(A[8] ^ B[6]) | (B[22]);
	assign g[7] = ~(A[9] ^ B[7]) | (B[23]);
	assign g[8] = ~(A[10] ^ B[8]) | (B[24]);
	assign g[9] = ~(A[11] ^ B[9]) | (B[25]);
	assign g[10] = ~(A[12] ^ B[10]) | (B[26]);
	assign g[11] = ~(A[13] ^ B[11]) | (B[27]);
	assign g[12] = ~(A[14] ^ B[12]) | (B[28]);
	assign g[13] = ~(A[15] ^ B[13]) | (B[29]);
	assign g[14] = ~(A[16] ^ B[14]) | (B[30]);
	assign g[15] = ~(A[17] ^ B[15]) | (B[31]);

	assign z[2] = &g;

	assign h[0] = ~(A[3] ^ B[0]) | (B[16]);
	assign h[1] = ~(A[4] ^ B[1]) | (B[17]);
	assign h[2] = ~(A[5] ^ B[2]) | (B[18]);
	assign h[3] = ~(A[6] ^ B[3]) | (B[19]);
	assign h[4] = ~(A[7] ^ B[4]) | (B[20]);
	assign h[5] = ~(A[8] ^ B[5]) | (B[21]);
	assign h[6] = ~(A[9] ^ B[6]) | (B[22]);
	assign h[7] = ~(A[10] ^ B[7]) | (B[23]);
	assign h[8] = ~(A[11] ^ B[8]) | (B[24]);
	assign h[9] = ~(A[12] ^ B[9]) | (B[25]);
	assign h[10] = ~(A[13] ^ B[10]) | (B[26]);
	assign h[11] = ~(A[14] ^ B[11]) | (B[27]);
	assign h[12] = ~(A[15] ^ B[12]) | (B[28]);
	assign h[13] = ~(A[16] ^ B[13]) | (B[29]);
	assign h[14] = ~(A[17] ^ B[14]) | (B[30]);
	assign h[15] = ~(A[18] ^ B[15]) | (B[31]);

	assign z[3] = &h;

	assign i[0] = ~(A[4] ^ B[0]) | (B[16]);
	assign i[1] = ~(A[5] ^ B[1]) | (B[17]);
	assign i[2] = ~(A[6] ^ B[2]) | (B[18]);
	assign i[3] = ~(A[7] ^ B[3]) | (B[19]);
	assign i[4] = ~(A[8] ^ B[4]) | (B[20]);
	assign i[5] = ~(A[9] ^ B[5]) | (B[21]);
	assign i[6] = ~(A[10] ^ B[6]) | (B[22]);
	assign i[7] = ~(A[11] ^ B[7]) | (B[23]);
	assign i[8] = ~(A[12] ^ B[8]) | (B[24]);
	assign i[9] = ~(A[13] ^ B[9]) | (B[25]);
	assign i[10] = ~(A[14] ^ B[10]) | (B[26]);
	assign i[11] = ~(A[15] ^ B[11]) | (B[27]);
	assign i[12] = ~(A[16] ^ B[12]) | (B[28]);
	assign i[13] = ~(A[17] ^ B[13]) | (B[29]);
	assign i[14] = ~(A[18] ^ B[14]) | (B[30]);
	assign i[15] = ~(A[19] ^ B[15]) | (B[31]);

	assign z[4] = &i;

	assign j[0] = ~(A[5] ^ B[0]) | (B[16]);
	assign j[1] = ~(A[6] ^ B[1]) | (B[17]);
	assign j[2] = ~(A[7] ^ B[2]) | (B[18]);
	assign j[3] = ~(A[8] ^ B[3]) | (B[19]);
	assign j[4] = ~(A[9] ^ B[4]) | (B[20]);
	assign j[5] = ~(A[10] ^ B[5]) | (B[21]);
	assign j[6] = ~(A[11] ^ B[6]) | (B[22]);
	assign j[7] = ~(A[12] ^ B[7]) | (B[23]);
	assign j[8] = ~(A[13] ^ B[8]) | (B[24]);
	assign j[9] = ~(A[14] ^ B[9]) | (B[25]);
	assign j[10] = ~(A[15] ^ B[10]) | (B[26]);
	assign j[11] = ~(A[16] ^ B[11]) | (B[27]);
	assign j[12] = ~(A[17] ^ B[12]) | (B[28]);
	assign j[13] = ~(A[18] ^ B[13]) | (B[29]);
	assign j[14] = ~(A[19] ^ B[14]) | (B[30]);
	assign j[15] = ~(A[20] ^ B[15]) | (B[31]);

	assign z[5] = &j;

	assign k[0] = ~(A[6] ^ B[0]) | (B[16]);
	assign k[1] = ~(A[7] ^ B[1]) | (B[17]);
	assign k[2] = ~(A[8] ^ B[2]) | (B[18]);
	assign k[3] = ~(A[9] ^ B[3]) | (B[19]);
	assign k[4] = ~(A[10] ^ B[4]) | (B[20]);
	assign k[5] = ~(A[11] ^ B[5]) | (B[21]);
	assign k[6] = ~(A[12] ^ B[6]) | (B[22]);
	assign k[7] = ~(A[13] ^ B[7]) | (B[23]);
	assign k[8] = ~(A[14] ^ B[8]) | (B[24]);
	assign k[9] = ~(A[15] ^ B[9]) | (B[25]);
	assign k[10] = ~(A[16] ^ B[10]) | (B[26]);
	assign k[11] = ~(A[17] ^ B[11]) | (B[27]);
	assign k[12] = ~(A[18] ^ B[12]) | (B[28]);
	assign k[13] = ~(A[19] ^ B[13]) | (B[29]);
	assign k[14] = ~(A[20] ^ B[14]) | (B[30]);
	assign k[15] = ~(A[21] ^ B[15]) | (B[31]);

	assign z[6] = &k;

	assign l[0] = ~(A[7] ^ B[0]) | (B[16]);
	assign l[1] = ~(A[8] ^ B[1]) | (B[17]);
	assign l[2] = ~(A[9] ^ B[2]) | (B[23]);
	assign l[3] = ~(A[10] ^ B[3]) | (B[23]);
	assign l[4] = ~(A[11] ^ B[4]) | (B[23]);
	assign l[5] = ~(A[12] ^ B[5]) | (B[23]);
	assign l[6] = ~(A[13] ^ B[6]) | (B[23]);
	assign l[7] = ~(A[14] ^ B[7]) | (B[23]);
	assign l[8] = ~(A[15] ^ B[8]) | (B[23]);
	assign l[9] = ~(A[16] ^ B[9]) | (B[23]);
	assign l[10] = ~(A[17] ^ B[10]) | (B[23]);
	assign l[11] = ~(A[18] ^ B[11]) | (B[23]);
	assign l[12] = ~(A[19] ^ B[12]) | (B[23]);
	assign l[13] = ~(A[20] ^ B[13]) | (B[23]);
	assign l[14] = ~(A[21] ^ B[14]) | (B[23]);
	assign l[15] = ~(A[22] ^ B[15]) | (B[23]);

	assign z[7] = &l;

	assign m[0] = ~(A[8] ^ B[0]) | (B[16]);
	assign m[1] = ~(A[9] ^ B[1]) | (B[17]);
	assign m[2] = ~(A[10] ^ B[2]) | (B[18]);
	assign m[3] = ~(A[11] ^ B[3]) | (B[19]);
	assign m[4] = ~(A[12] ^ B[4]) | (B[20]);
	assign m[5] = ~(A[13] ^ B[5]) | (B[21]);
	assign m[6] = ~(A[14] ^ B[6]) | (B[22]);
	assign m[7] = ~(A[15] ^ B[7]) | (B[23]);
	assign m[8] = ~(A[16] ^ B[8]) | (B[24]);
	assign m[9] = ~(A[17] ^ B[9]) | (B[25]);
	assign m[10] = ~(A[18] ^ B[10]) | (B[26]);
	assign m[11] = ~(A[19] ^ B[11]) | (B[27]);
	assign m[12] = ~(A[20] ^ B[12]) | (B[28]);
	assign m[13] = ~(A[21] ^ B[13]) | (B[29]);
	assign m[14] = ~(A[22] ^ B[14]) | (B[30]);
	assign m[15] = ~(A[23] ^ B[15]) | (B[31]);

	assign z[8] = &m;

	assign n[0] = ~(A[9] ^ B[0]) | (B[16]);
	assign n[1] = ~(A[10] ^ B[1]) | (B[17]);
	assign n[2] = ~(A[11] ^ B[2]) | (B[18]);
	assign n[3] = ~(A[12] ^ B[3]) | (B[19]);
	assign n[4] = ~(A[13] ^ B[4]) | (B[20]);
	assign n[5] = ~(A[14] ^ B[5]) | (B[21]);
	assign n[6] = ~(A[15] ^ B[6]) | (B[22]);
	assign n[7] = ~(A[16] ^ B[7]) | (B[23]);
	assign n[8] = ~(A[17] ^ B[8]) | (B[24]);
	assign n[9] = ~(A[18] ^ B[9]) | (B[25]);
	assign n[10] = ~(A[19] ^ B[10]) | (B[26]);
	assign n[11] = ~(A[20] ^ B[11]) | (B[27]);
	assign n[12] = ~(A[21] ^ B[12]) | (B[28]);
	assign n[13] = ~(A[22] ^ B[13]) | (B[29]);
	assign n[14] = ~(A[23] ^ B[14]) | (B[30]);
	assign n[15] = ~(A[24] ^ B[15]) | (B[31]);

	assign z[9] = &n;

	assign o[0] = ~(A[10] ^ B[0]) | (B[16]);
	assign o[1] = ~(A[11] ^ B[1]) | (B[17]);
	assign o[2] = ~(A[12] ^ B[2]) | (B[18]);
	assign o[3] = ~(A[13] ^ B[3]) | (B[19]);
	assign o[4] = ~(A[14] ^ B[4]) | (B[20]);
	assign o[5] = ~(A[15] ^ B[5]) | (B[21]);
	assign o[6] = ~(A[16] ^ B[6]) | (B[22]);
	assign o[7] = ~(A[17] ^ B[7]) | (B[23]);
	assign o[8] = ~(A[18] ^ B[8]) | (B[24]);
	assign o[9] = ~(A[19] ^ B[9]) | (B[25]);
	assign o[10] = ~(A[20] ^ B[10]) | (B[26]);
	assign o[11] = ~(A[21] ^ B[11]) | (B[27]);
	assign o[12] = ~(A[22] ^ B[12]) | (B[28]);
	assign o[13] = ~(A[23] ^ B[13]) | (B[29]);
	assign o[14] = ~(A[24] ^ B[14]) | (B[30]);
	assign o[15] = ~(A[25] ^ B[15]) | (B[31]);

	assign z[10] = &o;

	assign p[0] = ~(A[11] ^ B[0]) | (B[16]);
	assign p[1] = ~(A[12] ^ B[1]) | (B[17]);
	assign p[2] = ~(A[13] ^ B[2]) | (B[18]);
	assign p[3] = ~(A[14] ^ B[3]) | (B[19]);
	assign p[4] = ~(A[15] ^ B[4]) | (B[20]);
	assign p[5] = ~(A[16] ^ B[5]) | (B[21]);
	assign p[6] = ~(A[17] ^ B[6]) | (B[22]);
	assign p[7] = ~(A[18] ^ B[7]) | (B[23]);
	assign p[8] = ~(A[19] ^ B[8]) | (B[24]);
	assign p[9] = ~(A[20] ^ B[9]) | (B[25]);
	assign p[10] = ~(A[21] ^ B[10]) | (B[26]);
	assign p[11] = ~(A[22] ^ B[11]) | (B[27]);
	assign p[12] = ~(A[23] ^ B[12]) | (B[28]);
	assign p[13] = ~(A[24] ^ B[13]) | (B[29]);
	assign p[14] = ~(A[25] ^ B[14]) | (B[30]);
	assign p[15] = ~(A[26] ^ B[15]) | (B[31]);

	assign z[11] = &p;

	assign q[0] = ~(A[12] ^ B[0]) | (B[16]);
	assign q[1] = ~(A[13] ^ B[1]) | (B[17]);
	assign q[2] = ~(A[14] ^ B[2]) | (B[18]);
	assign q[3] = ~(A[15] ^ B[3]) | (B[19]);
	assign q[4] = ~(A[16] ^ B[4]) | (B[20]);
	assign q[5] = ~(A[17] ^ B[5]) | (B[21]);
	assign q[6] = ~(A[18] ^ B[6]) | (B[22]);
	assign q[7] = ~(A[19] ^ B[7]) | (B[23]);
	assign q[8] = ~(A[20] ^ B[8]) | (B[24]);
	assign q[9] = ~(A[21] ^ B[9]) | (B[25]);
	assign q[10] = ~(A[22] ^ B[10]) | (B[26]);
	assign q[11] = ~(A[23] ^ B[11]) | (B[27]);
	assign q[12] = ~(A[24] ^ B[12]) | (B[28]);
	assign q[13] = ~(A[25] ^ B[13]) | (B[29]);
	assign q[14] = ~(A[26] ^ B[14]) | (B[30]);
	assign q[15] = ~(A[27] ^ B[15]) | (B[31]);

	assign z[12] = &q;

	assign r[0] = ~(A[13] ^ B[0]) | (B[16]);
	assign r[1] = ~(A[14] ^ B[1]) | (B[17]);
	assign r[2] = ~(A[15] ^ B[2]) | (B[18]);
	assign r[3] = ~(A[16] ^ B[3]) | (B[19]);
	assign r[4] = ~(A[17] ^ B[4]) | (B[20]);
	assign r[5] = ~(A[18] ^ B[5]) | (B[21]);
	assign r[6] = ~(A[19] ^ B[6]) | (B[22]);
	assign r[7] = ~(A[20] ^ B[7]) | (B[23]);
	assign r[8] = ~(A[21] ^ B[8]) | (B[24]);
	assign r[9] = ~(A[22] ^ B[9]) | (B[25]);
	assign r[10] = ~(A[23] ^ B[10]) | (B[26]);
	assign r[11] = ~(A[24] ^ B[11]) | (B[27]);
	assign r[12] = ~(A[25] ^ B[12]) | (B[28]);
	assign r[13] = ~(A[26] ^ B[13]) | (B[29]);
	assign r[14] = ~(A[27] ^ B[14]) | (B[30]);
	assign r[15] = ~(A[28] ^ B[15]) | (B[31]);

	assign z[13] = &r;

	assign s[0] = ~(A[14] ^ B[0]) | (B[16]);
	assign s[1] = ~(A[15] ^ B[1]) | (B[17]);
	assign s[2] = ~(A[16] ^ B[2]) | (B[18]);
	assign s[3] = ~(A[17] ^ B[3]) | (B[19]);
	assign s[4] = ~(A[18] ^ B[4]) | (B[20]);
	assign s[5] = ~(A[19] ^ B[5]) | (B[21]);
	assign s[6] = ~(A[20] ^ B[6]) | (B[22]);
	assign s[7] = ~(A[21] ^ B[7]) | (B[23]);
	assign s[8] = ~(A[22] ^ B[8]) | (B[24]);
	assign s[9] = ~(A[23] ^ B[9]) | (B[25]);
	assign s[10] = ~(A[24] ^ B[10]) | (B[26]);
	assign s[11] = ~(A[25] ^ B[11]) | (B[27]);
	assign s[12] = ~(A[26] ^ B[12]) | (B[28]);
	assign s[13] = ~(A[27] ^ B[13]) | (B[29]);
	assign s[14] = ~(A[28] ^ B[14]) | (B[30]);
	assign s[15] = ~(A[29] ^ B[15]) | (B[31]);

	assign z[14] = &s;

	assign t[0] = ~(A[15] ^ B[0]) | (B[16]);
	assign t[1] = ~(A[16] ^ B[1]) | (B[17]);
	assign t[2] = ~(A[17] ^ B[2]) | (B[18]);
	assign t[3] = ~(A[18] ^ B[3]) | (B[19]);
	assign t[4] = ~(A[19] ^ B[4]) | (B[20]);
	assign t[5] = ~(A[20] ^ B[5]) | (B[21]);
	assign t[6] = ~(A[21] ^ B[6]) | (B[22]);
	assign t[7] = ~(A[22] ^ B[7]) | (B[23]);
	assign t[8] = ~(A[23] ^ B[8]) | (B[24]);
	assign t[9] = ~(A[24] ^ B[9]) | (B[25]);
	assign t[10] = ~(A[25] ^ B[10]) | (B[26]);
	assign t[11] = ~(A[26] ^ B[11]) | (B[27]);
	assign t[12] = ~(A[27] ^ B[12]) | (B[28]);
	assign t[13] = ~(A[28] ^ B[13]) | (B[29]);
	assign t[14] = ~(A[29] ^ B[14]) | (B[30]);
	assign t[15] = ~(A[30] ^ B[15]) | (B[31]);

	assign z[15] = &t;

	assign u[0] = ~(A[16] ^ B[0]) | (B[16]);
	assign u[1] = ~(A[17] ^ B[1]) | (B[17]);
	assign u[2] = ~(A[18] ^ B[2]) | (B[18]);
	assign u[3] = ~(A[19] ^ B[3]) | (B[19]);
	assign u[4] = ~(A[20] ^ B[4]) | (B[20]);
	assign u[5] = ~(A[21] ^ B[5]) | (B[21]);
	assign u[6] = ~(A[22] ^ B[6]) | (B[22]);
	assign u[7] = ~(A[23] ^ B[7]) | (B[23]);
	assign u[8] = ~(A[24] ^ B[8]) | (B[24]);
	assign u[9] = ~(A[25] ^ B[9]) | (B[25]);
	assign u[10] = ~(A[26] ^ B[10]) | (B[26]);
	assign u[11] = ~(A[27] ^ B[11]) | (B[27]);
	assign u[12] = ~(A[28] ^ B[12]) | (B[28]);
	assign u[13] = ~(A[29] ^ B[13]) | (B[29]);
	assign u[14] = ~(A[30] ^ B[14]) | (B[30]);
	assign u[15] = ~(A[31] ^ B[15]) | (B[31]);

	assign z[16] = &u;

	

endmodule