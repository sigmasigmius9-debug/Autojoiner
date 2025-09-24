bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	local FlatIdent_95CAC = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_95CAC == 2) then
			r = 0;
			p = 1;
			FlatIdent_95CAC = 3;
		end
		if (FlatIdent_95CAC == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_95CAC = 1;
		end
		if (FlatIdent_95CAC == 3) then
			for i = 1, N do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 2) then
					r = r + p;
				end
				p = 2 * p;
			end
			return r;
		end
		if (FlatIdent_95CAC == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % P, y % P;
			FlatIdent_95CAC = 2;
		end
	end
end;
bit32.bor = function(x, y)
	local FlatIdent_44603 = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_44603 == 0) then
			if (y == 255) then
				return (x - (x % 256)) + 255;
			end
			if (y == 65535) then
				return (x - (x % 65536)) + 65535;
			end
			FlatIdent_44603 = 1;
		end
		if (2 == FlatIdent_44603) then
			r = 0;
			p = 1;
			FlatIdent_44603 = 3;
		end
		if (FlatIdent_44603 == 3) then
			for i = 1, N do
				local FlatIdent_2953F = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_2953F == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_2953F = 1;
					end
					if (FlatIdent_2953F == 1) then
						if ((a + b) >= 1) then
							r = r + p;
						end
						p = 2 * p;
						break;
					end
				end
			end
			return r;
		end
		if (FlatIdent_44603 == 1) then
			if (y == 4294967295) then
				return 4294967295;
			end
			x, y = x % P, y % P;
			FlatIdent_44603 = 2;
		end
	end
end;
bit32.bxor = function(x, y)
	local FlatIdent_47A9C = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_47A9C == 1) then
			p = 1;
			for i = 1, N do
				local FlatIdent_7126B = 0;
				local a;
				local b;
				while true do
					if (0 == FlatIdent_7126B) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_7126B = 1;
					end
					if (FlatIdent_7126B == 1) then
						if ((a + b) == 1) then
							r = r + p;
						end
						p = 2 * p;
						break;
					end
				end
			end
			FlatIdent_47A9C = 2;
		end
		if (FlatIdent_47A9C == 2) then
			return r;
		end
		if (FlatIdent_47A9C == 0) then
			x, y = x % P, y % P;
			r = 0;
			FlatIdent_47A9C = 1;
		end
	end
end;
bit32.lshift = function(x, s_amount)
	local FlatIdent_60EA1 = 0;
	while true do
		if (FlatIdent_60EA1 == 1) then
			if (s_amount < 0) then
				return math.floor(x * (2 ^ s_amount));
			else
				return (x * (2 ^ s_amount)) % P;
			end
			break;
		end
		if (FlatIdent_60EA1 == 0) then
			if (math.abs(s_amount) >= N) then
				return 0;
			end
			x = x % P;
			FlatIdent_60EA1 = 1;
		end
	end
end;
bit32.rshift = function(x, s_amount)
	local FlatIdent_8F047 = 0;
	while true do
		if (FlatIdent_8F047 == 0) then
			if (math.abs(s_amount) >= N) then
				return 0;
			end
			x = x % P;
			FlatIdent_8F047 = 1;
		end
		if (FlatIdent_8F047 == 1) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % P;
			end
			break;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local FlatIdent_6FA1 = 0;
		local add;
		while true do
			if (FlatIdent_6FA1 == 1) then
				return math.floor(x * (2 ^ -s_amount)) + add;
			end
			if (0 == FlatIdent_6FA1) then
				add = 0;
				if (x >= (P / 2)) then
					add = P - (2 ^ (N - s_amount));
				end
				FlatIdent_6FA1 = 1;
			end
		end
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v28, v29)
	local FlatIdent_940A0 = 0;
	local v30;
	while true do
		if (1 == FlatIdent_940A0) then
			return v5(v30);
		end
		if (FlatIdent_940A0 == 0) then
			v30 = {};
			for v154 = 1, #v28 do
				v6(v30, v0(v4(v1(v2(v28, v154, v154 + 1)), v1(v2(v29, 1 + (v154 % #v29), 1 + (v154 % #v29) + 1))) % 256));
			end
			FlatIdent_940A0 = 1;
		end
	end
end
local v8 = v7("\198\208\129\106\169\183\200\29\208\207\211\42\245\175\157\79\133\155\131", "\126\177\163\187\69\134\219\167");
local v9 = false;
local v10 = true;
local v11 = game:GetService(v7("\23\200\38\192\236\44\223\62\246\249\49\219\35\198\249", "\156\67\173\74\165"));
local v12 = game:GetService(v7("\28\163\93\6\143\35\84\34\190\74\19", "\38\84\215\41\118\220\70"));
local v13 = game:GetService(v7("\96\26\35\11\251\66\5", "\158\48\118\66\114"));
local v14 = game:GetService(v7("\136\43\2\51\84\176\242", "\155\203\68\112\86\19\197"));
local v15 = game:GetService(v7("\114\202\51\249\78\75\224\234\80\212\53\249", "\152\38\189\86\156\32\24\133"));
local v16 = game:GetService(v7("\201\68\162\84\213\89\183\83\232\100\162\84\234\94\164\67", "\38\156\55\199"));
local v17 = nil;
local v18 = false;
local v19 = nil;
local v20 = 14139808 - 9139808;
local function v21(v31, v32, v33)
	local v34 = 0 - 0;
	while true do
		if (v34 == (0 + 0)) then
			if v10 then
				pcall(function()
					game:GetService(v7("\155\105\125\58\7\113\232\100\189\116", "\35\200\29\28\72\115\20\154")):SetCore(v7("\42\186\223\219\163\35\32\16\185\216\220\140\56\61\22\177", "\84\121\223\177\191\237\76"), {[v7("\143\95\221\172\63", "\161\219\54\169\192\90\48\80")]=v31,[v7("\125\71\24\49", "\69\41\34\96")]=v32,[v7("\152\214\197\11\22\34\179\205", "\75\220\163\183\106\98")]=(v33 or (10 - 5))});
				end);
			end
			print("[" .. tostring(v31) .. v7("\63\250", "\185\98\218\235\87") .. tostring(v32));
			break;
		end
	end
end
local function v22(v35)
	local FlatIdent_43BEE = 0;
	local v36;
	local v37;
	local v38;
	local v39;
	while true do
		if (FlatIdent_43BEE == 1) then
			v35.InputChanged:Connect(function(v156)
				if (v156.UserInputType == Enum.UserInputType.MouseMovement) then
					v37 = v156;
				end
			end);
			v16.InputChanged:Connect(function(v157)
				if ((v157 == v37) and v36) then
					local FlatIdent_2FBBD = 0;
					local v181;
					while true do
						if (0 == FlatIdent_2FBBD) then
							v181 = v157.Position - v38;
							v35.Position = UDim2.new(v39.X.Scale, v39.X.Offset + v181.X, v39.Y.Scale, v39.Y.Offset + v181.Y);
							break;
						end
					end
				end
			end);
			break;
		end
		if (0 == FlatIdent_43BEE) then
			v36, v37, v38, v39 = nil;
			v35.InputBegan:Connect(function(v155)
				if (v155.UserInputType == Enum.UserInputType.MouseButton1) then
					local FlatIdent_6053C = 0;
					local v180;
					while true do
						if (FlatIdent_6053C == 0) then
							v180 = 65 - (30 + 35);
							while true do
								if (v180 == (1 + 0)) then
									v39 = v35.Position;
									v155.Changed:Connect(function()
										if (v155.UserInputState == Enum.UserInputState.End) then
											v36 = false;
										end
									end);
									break;
								end
								if (v180 == (1257 - (1043 + 214))) then
									local FlatIdent_8F59B = 0;
									while true do
										if (FlatIdent_8F59B == 0) then
											v36 = true;
											v38 = v155.Position;
											FlatIdent_8F59B = 1;
										end
										if (FlatIdent_8F59B == 1) then
											v180 = 3 - 2;
											break;
										end
									end
								end
							end
							break;
						end
					end
				end
			end);
			FlatIdent_43BEE = 1;
		end
	end
end
local function v23(v40, v41, v42)
	local FlatIdent_90113 = 0;
	local v43;
	local v44;
	while true do
		if (FlatIdent_90113 == 0) then
			v43 = 0;
			v44 = nil;
			FlatIdent_90113 = 1;
		end
		if (FlatIdent_90113 == 1) then
			while true do
				if (v43 == (1212 - (323 + 889))) then
					v44 = 0 - 0;
					while true do
						if (v44 == (580 - (361 + 219))) then
							v40.MouseEnter:Connect(function()
								v15:Create(v40, TweenInfo.new(320.12 - (53 + 267)), {[v7("\233\61\36\237\217\184\196\41\41\226\253\165\199\51\53\181", "\202\171\92\71\134\190")]=v42}):Play();
							end);
							v40.MouseLeave:Connect(function()
								v15:Create(v40, TweenInfo.new(0.12 + 0), {[v7("\11\192\47\131\46\211\35\157\39\197\15\135\37\206\62\219", "\232\73\161\76")]=v41}):Play();
							end);
							break;
						end
					end
					break;
				end
			end
			break;
		end
	end
end
local function v24()
	if (v19 and v19.ScreenGui) then
		local FlatIdent_1B1BA = 0;
		local v176;
		while true do
			if (FlatIdent_1B1BA == 0) then
				v176 = 413 - (15 + 398);
				while true do
					if (v176 == (982 - (18 + 964))) then
						pcall(function()
							v19.ScreenGui:Destroy();
						end);
						v19 = nil;
						break;
					end
				end
				break;
			end
		end
	end
	local v45 = Instance.new(v7("\136\218\80\88\27\181\254\87\84", "\126\219\185\34\61"));
	v45.Name = v7("\43\207\82\115\102\110\210\242\24\193\84\125\119\121\246\245\51\233\107\91", "\135\108\174\62\18\30\23\147");
	v45.Parent = v14;
	v45.ResetOnSpawn = false;
	local v49 = Instance.new(v7("\144\251\43\198\29", "\167\214\137\74\171\120\206\83"));
	v49.Size = UDim2.new(0 - 0, 267 + 193, 0, 190 + 110);
	v49.Position = UDim2.new(0, 930 - (20 + 830), 0, 80);
	v49.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
	v49.BorderSizePixel = 0;
	v49.Parent = v45;
	Instance.new(v7("\190\217\17\82\234\169\142\226", "\199\235\144\82\61\152"), v49).CornerRadius = UDim.new(0 + 0, 12);
	local v56 = Instance.new(v7("\33\4\184\38\2", "\75\103\118\217"));
	v56.Size = UDim2.new(126 - (116 + 10), 9 + 111, 739 - (542 + 196), 0 - 0);
	v56.BackgroundColor3 = Color3.fromRGB(9 + 19, 15 + 13, 28);
	v56.Parent = v49;
	Instance.new(v7("\242\125\83\27\171\16\194\70", "\126\167\52\16\116\217"), v56).CornerRadius = UDim.new(0 + 0, 31 - 19);
	local function v61(v158, v159)
		local v160 = 0 - 0;
		local v161;
		while true do
			local FlatIdent_5BA5E = 0;
			while true do
				if (FlatIdent_5BA5E == 1) then
					if (v160 == (377 - (142 + 235))) then
						local FlatIdent_1E4CB = 0;
						while true do
							if (FlatIdent_1E4CB == 2) then
								v160 = 1 + 0;
								break;
							end
							if (FlatIdent_1E4CB == 0) then
								v161 = Instance.new(v7("\252\43\56\148\150\12\232\220\33\46", "\156\168\78\64\224\212\121"));
								v161.Size = UDim2.new(4 - 3, -(5 + 15), 977 - (553 + 424), 60 - 28);
								FlatIdent_1E4CB = 1;
							end
							if (FlatIdent_1E4CB == 1) then
								v161.Position = UDim2.new(0 + 0, 10 + 0, 0, v159);
								v161.BackgroundTransparency = 1 + 0;
								FlatIdent_1E4CB = 2;
							end
						end
					end
					break;
				end
				if (FlatIdent_5BA5E == 0) then
					if (v160 == (1552 - (1126 + 425))) then
						local FlatIdent_3F15E = 0;
						while true do
							if (FlatIdent_3F15E == 1) then
								v161.Font = Enum.Font.GothamBold;
								v161.TextSize = 40 - 26;
								FlatIdent_3F15E = 2;
							end
							if (FlatIdent_3F15E == 2) then
								v160 = 2;
								break;
							end
							if (FlatIdent_3F15E == 0) then
								v161.Text = v158;
								v161.TextColor3 = Color3.fromRGB(635 - (118 + 287), 901 - 671, 1351 - (118 + 1003));
								FlatIdent_3F15E = 1;
							end
						end
					end
					if (v160 == 2) then
						local FlatIdent_1DFAF = 0;
						while true do
							if (FlatIdent_1DFAF == 0) then
								v161.TextXAlignment = Enum.TextXAlignment.Left;
								v161.AutoButtonColor = false;
								FlatIdent_1DFAF = 1;
							end
							if (FlatIdent_1DFAF == 1) then
								v161.Parent = v56;
								return v161;
							end
						end
					end
					FlatIdent_5BA5E = 1;
				end
			end
		end
	end
	local v62 = v61("⚙ Auto Join", 10 + 6);
	local v63 = v61("🔧 Settings", 56);
	local v64 = Instance.new(v7("\33\252\164\195\2", "\174\103\142\197"));
	v64.Size = UDim2.new(2 - 1, -(334 - 214), 2 - 1, 0);
	v64.Position = UDim2.new(0, 35 + 85, 0, 0 - 0);
	v64.BackgroundTransparency = 754 - (239 + 514);
	v64.Parent = v49;
	local v69 = Instance.new(v7("\112\58\94\53\32", "\152\54\72\63\88\69\62"));
	v69.Size = UDim2.new(1 + 0, 0, 1, 1329 - (797 + 532));
	v69.BackgroundTransparency = 1 + 0;
	v69.Parent = v64;
	local v73 = Instance.new(v7("\242\214\239\81\209", "\60\180\164\142"));
	v73.Size = UDim2.new(1 + 0, 0 - 0, 1, 0);
	v73.BackgroundTransparency = 1203 - (373 + 829);
	v73.Visible = false;
	v73.Parent = v64;
	local v78 = Instance.new(v7("\108\91\29\61\11\236\16\93\82", "\114\56\62\101\73\71\141"));
	v78.Size = UDim2.new(1, 731 - (476 + 255), 0, 36);
	v78.Position = UDim2.new(1130 - (369 + 761), 7 + 5, 0 - 0, 6);
	v78.BackgroundTransparency = 1 - 0;
	v78.Text = v7("\159\232\215\197\160\240\155\229\173\253\212\206\183\224\213\193\170", "\164\216\137\187");
	v78.TextColor3 = Color3.fromRGB(255, 493 - (64 + 174), 37 + 218);
	v78.Font = Enum.Font.GothamBold;
	v78.TextSize = 26 - 8;
	v78.TextXAlignment = Enum.TextXAlignment.Left;
	v78.Parent = v69;
	local function v90(v162, v163, v164)
		local FlatIdent_295EB = 0;
		local v165;
		local v166;
		while true do
			if (FlatIdent_295EB == 1) then
				while true do
					local v177 = 0;
					while true do
						if ((217 - (42 + 174)) == v177) then
							if (v165 == (0 + 0)) then
								local FlatIdent_35A31 = 0;
								while true do
									if (FlatIdent_35A31 == 0) then
										v166 = Instance.new(v7("\230\227\41\166\132\235\31\198\233\63", "\107\178\134\81\210\198\158"));
										v166.Size = UDim2.new(1 + 0, -(11 + 13), 1504 - (363 + 1141), 1612 - (1183 + 397));
										FlatIdent_35A31 = 1;
									end
									if (FlatIdent_35A31 == 1) then
										v166.Position = UDim2.new(0, 36 - 24, 0, v164);
										v165 = 1 + 0;
										break;
									end
								end
							end
							if (v165 == (2 + 0)) then
								local FlatIdent_64E40 = 0;
								local v211;
								while true do
									if (FlatIdent_64E40 == 0) then
										v211 = 1975 - (1913 + 62);
										while true do
											if ((0 + 0) == v211) then
												local FlatIdent_35AC5 = 0;
												while true do
													if (FlatIdent_35AC5 == 1) then
														v211 = 1;
														break;
													end
													if (FlatIdent_35AC5 == 0) then
														v166.Font = Enum.Font.Gotham;
														v166.TextSize = 13;
														FlatIdent_35AC5 = 1;
													end
												end
											end
											if (v211 == (2 - 1)) then
												v166.TextXAlignment = Enum.TextXAlignment.Left;
												v165 = 1936 - (565 + 1368);
												break;
											end
										end
										break;
									end
								end
							end
							v177 = 7 - 5;
						end
						if (0 == v177) then
							local FlatIdent_75B50 = 0;
							while true do
								if (FlatIdent_75B50 == 1) then
									v177 = 1002 - (938 + 63);
									break;
								end
								if (FlatIdent_75B50 == 0) then
									if (v165 == (1664 - (1477 + 184))) then
										local FlatIdent_20FB0 = 0;
										while true do
											if (0 == FlatIdent_20FB0) then
												v166.AutoButtonColor = false;
												v166.Parent = v162;
												FlatIdent_20FB0 = 1;
											end
											if (FlatIdent_20FB0 == 1) then
												Instance.new(v7("\13\39\161\201\184\54\11\144", "\202\88\110\226\166"), v166).CornerRadius = UDim.new(0 - 0, 8);
												v165 = 4 + 0;
												break;
											end
										end
									end
									if (v165 == 1) then
										local FlatIdent_52EE1 = 0;
										while true do
											if (FlatIdent_52EE1 == 0) then
												v166.BackgroundColor3 = Color3.fromRGB(888 - (564 + 292), 54 - 22, 96 - 64);
												v166.Text = v163;
												FlatIdent_52EE1 = 1;
											end
											if (FlatIdent_52EE1 == 1) then
												v166.TextColor3 = Color3.fromRGB(220, 524 - (244 + 60), 170 + 50);
												v165 = 478 - (41 + 435);
												break;
											end
										end
									end
									FlatIdent_75B50 = 1;
								end
							end
						end
						if (v177 == (2 + 0)) then
							if (v165 == (1129 - (936 + 189))) then
								local FlatIdent_89237 = 0;
								local v218;
								local v219;
								while true do
									if (FlatIdent_89237 == 0) then
										v218 = 0 + 0;
										v219 = nil;
										FlatIdent_89237 = 1;
									end
									if (FlatIdent_89237 == 1) then
										while true do
											if (v218 == 0) then
												v219 = 1613 - (1565 + 48);
												while true do
													if (0 == v219) then
														v23(v166, Color3.fromRGB(20 + 12, 1170 - (782 + 356), 299 - (176 + 91)), Color3.fromRGB(117 - 72, 66 - 21, 45));
														return v166;
													end
												end
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
					end
				end
				break;
			end
			if (FlatIdent_295EB == 0) then
				v165 = 336 - (144 + 192);
				v166 = nil;
				FlatIdent_295EB = 1;
			end
		end
	end
	local v91 = 1129 - (975 + 117);
	local v92 = 1923 - (157 + 1718);
	local v93 = v90(v69, v7("\230\1\131\245\198\198\79\163\226\222\204\79\168\248\195\205", "\170\163\111\226\151"), v92 + (v91 * 0));
	local v94 = v90(v69, v7("\34\36\179\44\91\36\115\81\20\187\43\77\56\39\31\53\177\44\75\51", "\73\113\80\210\88\46\87"), v92 + (v91 * (1 + 0)));
	local v95 = v9;
	local function v96()
		if v95 then
			local FlatIdent_5B2CE = 0;
			local v183;
			while true do
				if (FlatIdent_5B2CE == 0) then
					v183 = 0;
					while true do
						if (v183 == (0 - 0)) then
							v15:Create(v93, TweenInfo.new(0.12 - 0), {[v7("\163\45\206\25\224\147\35\216\28\227\162\35\193\29\245\210", "\135\225\76\173\114")]=Color3.fromRGB(1058 - (697 + 321), 272 - 172, 84 - 44)}):Play();
							v93.Text = "✓ Auto Join Enabled";
							break;
						end
					end
					break;
				end
			end
		else
			local FlatIdent_2E9CB = 0;
			while true do
				if (FlatIdent_2E9CB == 0) then
					v15:Create(v93, TweenInfo.new(0.12), {[v7("\56\236\187\187\171\175\168\15\227\188\147\163\177\168\8\190", "\199\122\141\216\208\204\221")]=Color3.fromRGB(73 - 41, 13 + 19, 59 - 27)}):Play();
					v93.Text = v7("\136\211\17\242\116\243\237\252\5\228\119\182\135\210\25\254", "\150\205\189\112\144\24");
					break;
				end
			end
		end
	end
	v96();
	v93.MouseButton1Click:Connect(function()
		local FlatIdent_669F5 = 0;
		local v167;
		local v168;
		while true do
			if (1 == FlatIdent_669F5) then
				while true do
					if (0 == v167) then
						v168 = 0 - 0;
						while true do
							if (v168 == (1227 - (322 + 905))) then
								v95 = not v95;
								v9 = v95;
								v168 = 612 - (602 + 9);
							end
							if (v168 == 1) then
								v96();
								v21(v7("\2\133\179\77\28\145\81\49\48\144\176\70\11\129\31\21\55", "\112\69\228\223\44\100\232\113"), v7("\245\10\19\220\246\86\137\221\17\93\147", "\230\180\127\103\179\214\28") .. ((v9 and v7("\163\43", "\128\236\101\63\38\132\33")) or v7("\131\143\55", "\175\204\201\113\36\214\139")), 2);
								break;
							end
						end
						break;
					end
				end
				break;
			end
			if (FlatIdent_669F5 == 0) then
				v167 = 0;
				v168 = nil;
				FlatIdent_669F5 = 1;
			end
		end
	end);
	v94.MouseButton1Click:Connect(function()
		if not v18 then
			ConnectToWebSocket();
		else
			DisconnectWebSocket();
		end
	end);
	local v97 = Instance.new(v7("\115\201\45\200\40\70\206\48\208", "\100\39\172\85\188"));
	v97.Size = UDim2.new(1190 - (449 + 740), 872 - (826 + 46), 947 - (245 + 702), 36);
	v97.Position = UDim2.new(0 - 0, 12, 0 + 0, 1904 - (260 + 1638));
	v97.BackgroundTransparency = 441 - (382 + 58);
	v97.Text = v7("\158\125\173\148\58\163\127\170", "\83\205\24\217\224");
	v97.TextColor3 = Color3.fromRGB(818 - 563, 212 + 43, 526 - 271);
	v97.Font = Enum.Font.GothamBold;
	v97.TextSize = 18;
	v97.TextXAlignment = Enum.TextXAlignment.Left;
	v97.Parent = v73;
	local v107 = Instance.new(v7("\210\192\213\41\196\208\217\41\233\203", "\93\134\165\173"));
	v107.Size = UDim2.new(2 - 1, -(1229 - (902 + 303)), 0 - 0, 32);
	v107.Position = UDim2.new(0, 12, 0 - 0, 5 + 47);
	v107.BackgroundColor3 = Color3.fromRGB(1722 - (1121 + 569), 246 - (22 + 192), 32);
	v107.Text = v7("\144\253\213\203\60\199\177\127\170\251\206\204\41\148\242", "\30\222\146\161\162\90\174\210") .. ((v10 and v7("\202\96", "\106\133\46\16")) or v7("\119\6\85", "\32\56\64\19\156\58"));
	v107.TextColor3 = Color3.fromRGB(220, 903 - (483 + 200), 220);
	v107.Font = Enum.Font.Gotham;
	v107.TextSize = 1476 - (1404 + 59);
	v107.TextXAlignment = Enum.TextXAlignment.Left;
	v107.AutoButtonColor = false;
	v107.Parent = v73;
	Instance.new(v7("\111\225\198\89\72\252\133\72", "\224\58\168\133\54\58\146"), v107).CornerRadius = UDim.new(0 - 0, 10 - 2);
	v23(v107, Color3.fromRGB(797 - (468 + 297), 594 - (334 + 228), 107 - 75), Color3.fromRGB(104 - 59, 45, 81 - 36));
	v107.MouseButton1Click:Connect(function()
		local FlatIdent_4D11E = 0;
		local v169;
		while true do
			if (FlatIdent_4D11E == 0) then
				v169 = 0;
				while true do
					if ((0 + 0) == v169) then
						v10 = not v10;
						v107.Text = v7("\119\89\95\244\115\143\132\10\77\95\68\243\102\220\199", "\107\57\54\43\157\21\230\231") .. ((v10 and v7("\244\165", "\175\187\235\113\149\217\188")) or v7("\19\137\167", "\24\92\207\225\44\131\25"));
						v169 = 237 - (141 + 95);
					end
					if (v169 == 1) then
						v21(v7("\120\214\172\88\18\115\76\192", "\29\43\179\216\44\123"), v7("\147\214\52\69\187\208\35\77\169\208\47\66\174\131\96", "\44\221\185\64") .. ((v10 and v7("\46\201", "\19\97\135\40\63")) or v7("\129\122\21", "\81\206\60\83\91\79")), 2);
						break;
					end
				end
				break;
			end
		end
	end);
	local v120 = Instance.new(v7("\104\185\209\127\42", "\196\46\203\176\18\79\163\45"));
	v120.Size = UDim2.new(0 + 0, 566 - 346, 0, 96 - 56);
	v120.Position = UDim2.new(0, 3 + 9, 0 - 0, 65 + 27);
	v120.BackgroundTransparency = 0 + 0;
	v120.BackgroundColor3 = Color3.fromRGB(32, 32, 32);
	v120.Parent = v73;
	local v126 = Instance.new(v7("\140\39\102\10\8\250\237\189\46", "\143\216\66\30\126\68\155"));
	v126.Size = UDim2.new(1 - 0, -(17 + 11), 163 - (92 + 71), 15 + 15);
	v126.Position = UDim2.new(0 - 0, 777 - (574 + 191), 0 + 0, 5);
	v126.BackgroundTransparency = 1;
	v126.Text = v7("\153\205\25\139\227\170\219\245\175\218", "\129\202\168\109\171\165\195\183");
	v126.Font = Enum.Font.Gotham;
	v126.TextSize = 34 - 20;
	v126.TextColor3 = Color3.fromRGB(113 + 107, 1069 - (254 + 595), 220);
	v126.TextXAlignment = Enum.TextXAlignment.Left;
	v126.Parent = v120;
	local v136 = Instance.new(v7("\22\93\47\204\252\27\254", "\134\66\56\87\184\190\116"));
	v136.Size = UDim2.new(126 - (55 + 71), 100, 0 - 0, 1820 - (573 + 1217));
	v136.Position = UDim2.new(1, -120, 0 - 0, 1 + 4);
	v136.BackgroundColor3 = Color3.fromRGB(60, 96 - 36, 60);
	v136.TextColor3 = Color3.fromRGB(1194 - (714 + 225), 255, 255);
	v136.Font = Enum.Font.Gotham;
	v136.TextSize = 40 - 26;
	v136.Text = "5";
	v136.ClearTextOnFocus = false;
	v136.Parent = v120;
	Instance.new(v7("\9\24\42\180\11\229\36\39", "\85\92\81\105\219\121\139\65"), v136).CornerRadius = UDim.new(0, 8);
	v136.FocusLost:Connect(function()
		local v170 = 0 - 0;
		local v171;
		while true do
			if (v170 == (1 + 0)) then
				v20 = v171 * (1447949 - 447949);
				v21(v7("\236\26\224\8\51\209\24\231", "\90\191\127\148\124"), v7("\94\142\34\3\125\149\110\4\125\147\110\3\119\221\110", "\119\24\231\78") .. v171 .. "M", 2);
				break;
			end
			if (v170 == (806 - (118 + 688))) then
				local FlatIdent_4D434 = 0;
				while true do
					if (FlatIdent_4D434 == 0) then
						v171 = tonumber(v136.Text);
						if (v171 > (58 - (25 + 23))) then
							local FlatIdent_61800 = 0;
							while true do
								if (FlatIdent_61800 == 0) then
									v136.Text = v7("\172\227", "\191\157\211\48\37\28");
									v171 = 10;
									break;
								end
							end
						elseif (v171 < 0) then
							local FlatIdent_23B66 = 0;
							local v220;
							while true do
								if (FlatIdent_23B66 == 0) then
									v220 = 0 + 0;
									while true do
										if (v220 == 0) then
											v136.Text = "0";
											v171 = 1886 - (927 + 959);
											break;
										end
									end
									break;
								end
							end
						end
						FlatIdent_4D434 = 1;
					end
					if (FlatIdent_4D434 == 1) then
						v170 = 3 - 2;
						break;
					end
				end
			end
		end
	end);
	v62.MouseButton1Click:Connect(function()
		local FlatIdent_78A9D = 0;
		while true do
			if (FlatIdent_78A9D == 0) then
				v69.Visible = true;
				v73.Visible = false;
				break;
			end
		end
	end);
	v63.MouseButton1Click:Connect(function()
		local FlatIdent_882F4 = 0;
		while true do
			if (FlatIdent_882F4 == 0) then
				v69.Visible = false;
				v73.Visible = true;
				break;
			end
		end
	end);
	v22(v49);
	return {[v7("\177\46\183\79\217\78\54\151\36", "\113\226\77\197\42\188\32")]=v45,[v7("\9\2\245\161\47\5\214\161\52", "\213\90\118\148")]=v94,[v7("\126\32\181\84\65\94\12\160\88", "\45\59\78\212\54")]=v93};
end
local function v25(v147)
	local FlatIdent_499B1 = 0;
	local v148;
	while true do
		if (FlatIdent_499B1 == 0) then
			v148 = 0;
			while true do
				if (v148 == (732 - (16 + 716))) then
					local FlatIdent_79729 = 0;
					while true do
						if (0 == FlatIdent_79729) then
							if (not v147 or (v147 == "")) then
								return false;
							end
							return pcall(function()
								v11:TeleportToPlaceInstance(game.PlaceId, v147, v13.LocalPlayer);
							end);
						end
					end
				end
			end
			break;
		end
	end
end
local function v26(v149)
	local FlatIdent_FBDE = 0;
	while true do
		if (FlatIdent_FBDE == 0) then
			if not v19 then
				return;
			end
			pcall(function()
				if v149 then
					local FlatIdent_7993F = 0;
					local v185;
					while true do
						if (FlatIdent_7993F == 0) then
							v185 = 0 - 0;
							while true do
								if (v185 == (97 - (11 + 86))) then
									v15:Create(v19.StatusBtn, TweenInfo.new(0.2), {[v7("\50\87\128\128\129\60\162\229\30\82\160\132\138\33\191\163", "\144\112\54\227\235\230\78\205")]=Color3.fromRGB(40, 243 - 143, 325 - (175 + 110))}):Play();
									v19.StatusBtn.Text = v7("\128\60\14\232\197\72\233\104\44\243\222\85\182\43\27\249\212", "\59\211\72\111\156\176");
									break;
								end
							end
							break;
						end
					end
				else
					local FlatIdent_581C8 = 0;
					local v186;
					while true do
						if (FlatIdent_581C8 == 0) then
							v186 = 0;
							while true do
								if (v186 == 0) then
									v15:Create(v19.StatusBtn, TweenInfo.new(0.2), {[v7("\108\134\224\38\73\149\236\56\64\131\192\34\66\136\241\126", "\77\46\231\131")]=Color3.fromRGB(252 - 152, 197 - 157, 40)}):Play();
									v19.StatusBtn.Text = v7("\137\64\183\84\175\71\236\0\158\93\165\67\181\90\184\69\185\64\179\68", "\32\218\52\214");
									break;
								end
							end
							break;
						end
					end
				end
			end);
			break;
		end
	end
end
function ConnectToWebSocket()
	local v150 = 0;
	local v151;
	local v152;
	while true do
		if (v150 == 0) then
			local FlatIdent_1B881 = 0;
			while true do
				if (FlatIdent_1B881 == 1) then
					v150 = 1;
					break;
				end
				if (FlatIdent_1B881 == 0) then
					if v18 then
						return;
					end
					v151, v152 = pcall(function()
						if (syn and syn.websocket and syn.websocket.connect) then
							return syn.websocket.connect(v8);
						elseif (WebSocket and WebSocket.connect) then
							return WebSocket.connect(v8);
						else
							error(v7("\121\18\51\155\254\179\78\95\90\87\63\167\229\240\86\79\94\7\62\186\229\181\65", "\58\46\119\81\200\145\208\37"));
						end
					end);
					FlatIdent_1B881 = 1;
				end
			end
		end
		if (v150 == 1) then
			if (v151 and v152) then
				local v200 = 1796 - (503 + 1293);
				while true do
					if (v200 == (2 - 1)) then
						v26(true);
						v21(v7("\12\141\60\173\177\164\118\10\153\36\163\163\178\63\37\137\34", "\86\75\236\80\204\201\221"), v7("\81\78\121\139\251\136\102\68\115\197\234\132\50\118\114\135\205\132\113\74\114\145\191", "\235\18\33\23\229\158"), 3 + 0);
						break;
					end
					if (v200 == 0) then
						local FlatIdent_580CB = 0;
						while true do
							if (FlatIdent_580CB == 1) then
								v200 = 1;
								break;
							end
							if (FlatIdent_580CB == 0) then
								v17 = v152;
								v18 = true;
								FlatIdent_580CB = 1;
							end
						end
					end
				end
			else
				local FlatIdent_272FB = 0;
				local v201;
				local v202;
				while true do
					if (FlatIdent_272FB == 0) then
						v201 = 1061 - (810 + 251);
						v202 = nil;
						FlatIdent_272FB = 1;
					end
					if (1 == FlatIdent_272FB) then
						while true do
							if (v201 == 0) then
								v202 = 0;
								while true do
									if (v202 == (0 + 0)) then
										v21(v7("\117\168\211\180\66", "\219\48\218\161"), v7("\199\112\114\71\212\91\160\231\126\114\71\222\76\244\190\49", "\128\132\17\28\41\187\47") .. tostring(v152), 2 + 3);
										v26(false);
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end
function DisconnectWebSocket()
	local FlatIdent_70B9A = 0;
	while true do
		if (FlatIdent_70B9A == 0) then
			if v17 then
				local v178 = 0 + 0;
				local v179;
				while true do
					if (v178 == (533 - (43 + 490))) then
						v179 = 733 - (711 + 22);
						while true do
							if (v179 == 0) then
								pcall(function()
									if v17.Close then
										v17:Close();
									elseif v17.close then
										v17:close();
									end
								end);
								v17 = nil;
								break;
							end
						end
						break;
					end
				end
			end
			v18 = false;
			FlatIdent_70B9A = 1;
		end
		if (FlatIdent_70B9A == 1) then
			v26(false);
			break;
		end
	end
end
local function v27()
	local FlatIdent_4223E = 0;
	local v153;
	while true do
		if (FlatIdent_4223E == 0) then
			v153 = 0 - 0;
			while true do
				if (v153 == (860 - (240 + 619))) then
					v21(v7("\38\51\10\59\69\24\114\39\47\73\14\56\9\51\83\4\32", "\61\97\82\102\90"), v7("\139\27\130\11\203\88\31\13\169\42\234\11\228\91\23\10\167\110\152\95\198\67\11\26\236\58\164\11\196\88\16\7\169\45\191\5", "\105\204\78\203\43\167\55\126"), 2 + 3);
					break;
				end
				if (v153 == (0 - 0)) then
					local FlatIdent_280F1 = 0;
					while true do
						if (FlatIdent_280F1 == 1) then
							v153 = 1;
							break;
						end
						if (FlatIdent_280F1 == 0) then
							v19 = v24();
							v26(v18);
							FlatIdent_280F1 = 1;
						end
					end
				end
			end
			break;
		end
	end
end
v27();
