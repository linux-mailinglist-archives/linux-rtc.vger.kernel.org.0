Return-Path: <linux-rtc+bounces-4850-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68159B509FE
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 02:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4ED172C86
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 00:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDCC1C1F05;
	Wed, 10 Sep 2025 00:51:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9221.ps.combzmail.jp (r9221.ps.combzmail.jp [160.16.65.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044013AD1C
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.65.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757465503; cv=none; b=iWs6KZomqRd/c9Sl4BOjHyoVLVYeteditWedo2eIj8Kdrp4vrcC6DYY7+1vIZ92lkBDFGHdOKn/ERhpM/biJjJT+OEZ7FfygSqeO2NOtFGoJH8RxQ7AOPgA+tzOIKdR3lyt5+TU4T7UlZFLOjhs5gjN6GQUZjgCZscKvZjgCO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757465503; c=relaxed/simple;
	bh=gwtGjyr406Kn0MilPO/CQtMGSbMz8EqNSwd5sp3GouM=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=GxiIVHDkwWA/ApuckJihCBo5jYMBnt1ELvAeCc+Ti2CKEhkNKqQNFOs9N5usCmNDjXD+0fYx6xQl3x3U2D997sPI7UyTVgvFdCUEZO+sISSWKnAxJlJcVmGAfRAKpiL8A9lN7XyMiIHN7k6zKStL2Ev6zTPuyeyWq3JhoqUA4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledgelink-corp.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.65.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledgelink-corp.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9221.ps.combzmail.jp (Postfix, from userid 99)
	id 90FB6E3F4A; Wed, 10 Sep 2025 09:39:54 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9221.ps.combzmail.jp 90FB6E3F4A
To: linux-rtc@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCFDJUolbCVDJTglaiVzJS8bKEI=?= <info@knowledgelink-corp.jp>
X-Ip: 2471891803360534
X-Ip-source: k85gj73p48dnsa9wu0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPT42SDB3JE41a00/JE43aCRhSn0bKEI=?=
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 3p9w
X-uId: 6763304837485965624884461045
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20250910004032.90FB6E3F4A@r9221.ps.combzmail.jp>
Date: Wed, 10 Sep 2025 09:39:54 +0900 (JST)

$B!!(B
$B!!(B
$B!!$"$kF|FMA3!"(B
$B!!<RD9(B $B$A$g$C$H$4AjCL$,!&!&$H!"$J$i$J$$$?$a$K!#(B
$B!!(B
$B!!::Dj$,0z$-6b$G%-!<%Q!<%=%s$,N%?&$7!"6H@S$,Mn$A$k(B
$B!!$=$s$J<:GT$rKI$0!"(B4,300$B?M$N7P1D<T$,6&46$7$?(B
$B!!!!!V=>6H0w$N5kM?$N7h$aJ}!W$rCN$k!"%&%'%S%J!<$N$40FFb$G$9!#(B
$B!!(B
$B!!(B
$B!!(B>> $B$4;kD0M=Ls$O$3$A$i(B
$B!!!!(B https://fc-knowledgelink-corp.jp/seminar_25/
$B!!(B
--------------------------------------------$B!!(B

$B!!%F!<%^!'(B $BO+;H6&$KG<F@$G$-$k!#(B
$B!!!!!!!!!!(B $B<:GT$7$J$$!"!V5kM?$N7h$aJ}!W(B
$B!!(B
$B!!F|Dx!!!'(B 9$B7n(B17$BF|!J?e!K(B13:00$B!A(B15:00
$B!!!!!!(B $B!!!!(B10$B7n(B1$BF|!J?e!K(B13:00$B!A(B15:00
$B!!2q>l!!!'(B Zoom$B3+:E(B
$B!!Dj0w!!!'(B 150$BL>!!"(7P1DAX$NJ}8BDj$G$9(B
$B!!HqMQ!!!'(B $BL5NA(B
$B!!FCE5!!!'(B $B%;%_%J!<;qNA$r?JDh(B
$B!!Hw9M!!!'(B $BN>F|FbMF$OF1$8$G$9(B
--------------------------------------------

$B!!K\%;%_%J!<$O(B4,300$B?M0J>e$N7P1DAX$,<u9V$7$?(B
$B!!%^%M%8%a%s%HM}O@!'<13X$N!V5kM?$N7h$aJ}!W$r(B
$B!!(B
$B!!%S%8%M%9$N<BL32H$H$7$F<BBN83$r%Y!<%9$K(B
$B!!7P1D<TL\@~$G$*EA$($$$?$7$^$9!#(B
$B!!(B
$B!!B?$/$NItJ,$G6&46$$$?$@$1$k%;%_%J!<$H(B
$B!!$J$C$F$*$j$^$9$N$G$<$R$4;22C$/$@$5$$!#(B
$B!!(B
$B!!!N(B $BFb(B $BMF(B $B!O(B
$B!!!!(B1$B!%I>2A$H::Dj$HO"F0$5$;$kJ}K!(B
$B!!!!(B2$B!%@dBP$K2!$5$($k$Y$-%]%$%s%H(B
$B!!!!(B3$B!%4V0c$C$?I>2A@)EY(B
$B!!!!(B4$B!%F3F~4k6H$N;vNc(B
$B!!!!(B5$B!%<A5?1~Ez(B
$B!!(B
$B!!(B
$B!!>:5k!&>:3J$KBP$9$kG<F@46$rF@$i$l$:!"(B
$B!!AH?%%Q%U%)!<%^%s%9$,DcD4$K$J$C$F$$$^$;$s$+!)(B
$B!!(B
$B!!!!>:5k!">:3J!"DB6b%F!<%V%k$NMW7o$,[#Kf$G(B
$B!!!!O+;H6&$KG<F@$G$-$k>uBV$H$O8@$$Fq$$!#(B

$B!!$3$l$i$O!"!V5kM?$N7h$aJ}!W$NLdBj$+$b$7$l$^$;$s!#(B
$B!!(B
$B!!5kM?@)EY$,5!G=ITA4$K4Y$k$H!"8xJ?@-!&F)L@@-$K5?5A$,@8$8!"(B
$B!!?M;vI>2A$KBP$9$kIT?.$d%b%A%Y!<%7%g%s$NDc2<!"(B
$B!!$R$$$F$OM%=(?M:`$NN.=P$H$$$C$??<9o$J%j%9%/$K$D$J$,$j$+$M$^$;$s!#(B
$B!!(B
$B!!(B
$B!!0lJ}$G!"<+<R$K:GE,2=$5$l$?5kM?@)EY$r%<%m$+$i(B
$B!!@_7W$9$k$3$H$OMF0W$G$O$J$/!"9bEY$JCN8+$H<B9TNO$,5a$a$i$l$^$9!#(B
$B!!(B
$B!!(B
$B!!$=$3$GK\%;%_%J!<$G$O!"%S%8%M%9AH?%$+$i%9%]!<%D%A!<%`$^$G(B
$B!!I}9-$/1~MQ2DG=$J!"HFMQ@-$N9b$$(B
$B!!!V5kM?$N7h$aJ}!W%U%l!<%`%o!<%/$r$4>R2p$$$?$7$^$9!#(B


$B!!$3$N%;%_%J!<$,!":GE,$J5kM?@)EY$r9M$($k(B
$B!!5!2q$H$J$l$P9,$$$G$9!#(B
$B!!(B
$B!!(B>> $B$4;kD0M=Ls$O$3$A$i(B
$B!!!!(B https://fc-knowledgelink-corp.jp/seminar_25/
$B!!(B
$B!!(B
$B!!$46=L#$r$*;}$A$$$?$@$1$^$7$?$i!"(B
$B!!$4;22C$N$*?=9~$_$rD:$1$^$9$H9,$$$G$9!#(B
-----------------------
$B!!0lHL<RCDK!?M(B $B%J%l%C%8%j%s%/(B
$B!!El5~ET@iBeED6h?@ED>.@nD.(B1-8-3
$B!!EEOC!'(B03-5256-7638

$B!!G[?.$,ITMW$JJ}$OBgJQ;DG0$G$O$4$6$$$^$9$,!"(B
$B!!2<5-(BURL$B$h$j<jB3$-2<$5$$$^$;!#(B
$B!!(B
$B!!%a!<%k$NDd;_$O$3$A$i(B
$B!!(Bhttps://fc-knowledgelink-corp.jp/mail/
$B!!(B

