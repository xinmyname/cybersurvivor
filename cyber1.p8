pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()

	hero={}
	hero.x=80
	hero.y=80
	hero.flip=false
	hero.moving={{2,3},{3,3}}
	hero.idle={{2,90},{1,4}}
	setani(hero,hero.idle)

end

function _update()

	local b=btn()
	local nx=hero.x
	local ny=hero.y
	local tx=0
	local ty=0

	if (band(b,1)==1) then
	 nx-=1.5
		hero.flip=true
	end
	
	if (band(b,2)==2) then
		nx+=1.5
		hero.flip=false
	end

 if (band(b,4)==4) then
 	ny-=1.5
 end
 
 if (band(b,8)==8) then
 	ny+=1.5
 end

	tl=((nx+1)/8)
	tr=((nx+6)/8)
	tt=((ny+4)/8)
	tb=((ny+6)/8)

 local tv=fget(mget(tl,tt))
 |        fget(mget(tr,tt))
 |        fget(mget(tl,tb))
 |        fget(mget(tr,tb))
  
 if (tv&1==0) then
 	hero.x=nx
 	hero.y=ny
 end

	if (b&0xf>0) then
		setani(hero,hero.moving)
	else
		setani(hero,hero.idle)
	end

	animate(hero)
		
end

function _draw()
	local hx=64
	local hy=64
	local mx=hx-hero.x
	local my=hy-hero.y
 
	if (mx>0) then
		hx-=mx
		if (hx<0) then 
			hx=0
			hero.x=0
		end
		mx=0
	end

	if (my>0) then
		hy-=my
		if (hy<0) then 
			hy=0
			hero.y=0
		end
		my=0
	end

	if (mx<-896) then
		hx+=(hero.x-(hx+896))
		if (hx>120) then
			hx=120
			hero.x=1016
		end
		mx=-896
	end

	if (my<-128) then
		hy+=(hero.y-(hy+128))
		if (hy>120) then
			hy=120
			hero.y=248
		end
		my=-128
	end


	palt(0,false)
	map(0,0,mx,my)
	palt(0,true)
	spr(hero.spr,hx,hy,1,1,hero.flip)
end

-->8
-- utilities

function setani(ent,ani)
	if (ani != ent.ani) then
		ent.ani=ani
		ent.ani_idx=1 
		ent.spr=ani[1][1]
		ent.wait=ani[1][2]
	end
end

function animate(ent)
 
	if (ent.wait>0) then
		ent.wait-=1
	else
		ent.ani_idx+=1

		if (ent.ani_idx>#ent.ani) ent.ani_idx=1

		ent.spr=ent.ani[ent.ani_idx][1]
		ent.wait=ent.ani[ent.ani_idx][2]
	end
 
end
__gfx__
0000000033bb300033bb300003bb3040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003bbb34003bbb34033bbb304000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070003ffff0403f1f10403f1f104000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700004ffff0404ffff0404ffff3f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700033bbb33f33bbb33f03bbb334000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700f5446504f54465040f446504000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333040333330403333340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050005400500054050005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444444444444444044440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444444444444440404440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444444544444404440440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555559a9a554444444444444444044440440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555555a9a9554444444444444554404404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444444444444404044400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444445544444040444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555554444444444444444044044440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666666665559a5550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555a95550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666666665559a5550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555a95550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66777666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6766677690a990a50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
766666560a990a950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65766665595559550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
76666565595559550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65656656959595950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66555566959595950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8e8888e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88e88e88000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
888ee888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
888ee888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88e88e88000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8e8888e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1414141414141414303131313014141414141414141414141414141414141414141414141414141414141430313131301414141414141414141414141414141414143031313130141414141414141414141414141414141414141414141414141414141414141414141414303131313014141414141414141414141414141414
1414141412121212201021102012121212141414141414141414141414141414141414141414121212121220102110201214141414141414141212121212121212122010211020121212141414141414141414141414141414141414121212121214141414141212121212201021102014141412141414141412141414141414
1414141212121212201021102012121312121212141414121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212141414141414121212121212121212121212121212121212121212121212201021102012141212121212121212121214141414
1414121212121212201021102012121212121212121412121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121214141412121212121212121212121212121212121212121212121212201021102012121212121212121212121212141414
1414121213121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212141212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121213201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1412121212131212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
3020202020202020201111112020202020202020202020202020202020202020202020202020202020202020111111202020202020202020202020202020202020202011111120202020202020202020202020202020202020202020202020202020202020202020202020201111112020202020202020202020202020202030
3110101010101010211010102110101010101010101010101010101010101010101010101010101010101021101010211010101010101010101010101010101010102110101021101010101010101010101010101010101010101010101010101010101010101010101010211010102110101010101010101010101010101031
3111111111111111211010102111111111111111111111111111111111111111111111111111111111111121101010211111111111111111111111111111111111112110101021111111111111111111111111111111111111111111111111111111111111111111111111211010102111111111111111111111111111111131
3110101010101010211010102110101010101010101010101010101010101010101010101010101010101021101010211010101010101010101010101010101010102110101021101010101010101010101010101010101010101010101010101010101010101010101010211010102110101010101010101010101010101031
3020202020202020201111112020202020202020202020202020202020202020202020202020202020202020111111202020202020202020202020202020202020202011111120202020202020202020202020202020202020202020202020202020202020202020202020201111112020202020202020202020202020202030
1414121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1414121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212141414
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121214141414
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212141414
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1412121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1414121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121212121212121212121212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1414121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212121412121212121212141212121212121212121212121212121212121212121212201021102012121212121212121212121212121214
1414121212121212201021102012121212121212121212121212121212121212121212121212121212121220102110201212121212121212121212121212121212122010211020121212141414121212121214141412121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1414141212121212201021102012121212121412121212121212121212121212121414121212121212121420102110201212121212121212121212121414121212122010211020121214141414121212121214141414121212121212121212121212121212121212121212201021102012121212121212121212121212121414
1414141412121212201021102012121212141414121212121212121212121212141414141212121212141420102110201414121212121212121214141414121214122010211020121414141414141212121414141414121212121212121212121212121212121212121414201021102012121212121212121212121212141414
1414141414141212201021102014141212141414141212141412121212121214141414141414121414141420102110201414141212121414141214141414121414142010211020141414141414141414141414141414141414141414141412121212121212121414141414201021102014121212121214141414121414141414
1414141414141414303131313014141414141414141414141414141414141414141414141414141414141430313131301414141414141414141414141414141414143031313130141414141414141414141414141414141414141414141414141414141414141414141414303131313014141414141414141414141414141414
