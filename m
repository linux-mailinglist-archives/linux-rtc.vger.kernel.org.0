Return-Path: <linux-rtc+bounces-2476-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C49249C2979
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2024 03:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 591D4B22A99
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2024 02:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBABE1DFFC;
	Sat,  9 Nov 2024 02:18:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9204.ps.combzmail.jp (r9204.ps.combzmail.jp [160.16.62.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155C28E8
	for <linux-rtc@vger.kernel.org>; Sat,  9 Nov 2024 02:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.62.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731118697; cv=none; b=jXMu5kYFxLWwL3CdljEqY0nsKJ3Q/2WZEsrBS7CBgKWY/AcJnW38bLLJttH5df4vEyrYC7Gm5udO6kFWTUSi2WLgA96sInIKGu/B97r1EnHfg7rtg9YOlT5PmjB1Xkj3ZemcXx4ry029NQn0j2+jOL0qMF0HgSZ+x+I+GuX6nY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731118697; c=relaxed/simple;
	bh=lcZf+9KcB2jzx8Bvmso5EN4EtO/RaINPO2z6f+sN9Lc=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=Qzn+S5wjpiHhFGZjXMYCgG0o/W16gksElrJtvfiK9hacD5H5pdmKWvVYvtPiOM2Xc60gsBQuXkFGZmo2GaouA5nARiedYa3ZOen9jnhzy2+tUYwqPtdZu7W1YGSUSqhIn9k8jXQW65le4wYZ+bLryWKo4CiuHL+GKqdjKn3kpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=p-upneo.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.62.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=p-upneo.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9204.ps.combzmail.jp (Postfix, from userid 99)
	id 70F811037FB; Sat,  9 Nov 2024 11:07:39 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9204.ps.combzmail.jp 70F811037FB
To: linux-rtc@vger.kernel.org
From: P-UP x =?ISO-2022-JP?B?GyRCPDEzWCU7JV8lSiE8O3ZMMzZJGyhC?= <info@p-upneo.jp>
X-Ip: 3042311535112224
X-Ip-source: k85gj73p48dnsa9wu0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPFJEOSQsNFYwYyQmISFJPjJBQClFWSROGyhC?=
 =?ISO-2022-JP?B?GyRCTW4kSCQ3N2obKEI=?=
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 3p9w
X-uId: 6762324739485867615157471023
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20241109020756.70F811037FB@r9204.ps.combzmail.jp>
Date: Sat,  9 Nov 2024 11:07:39 +0900 (JST)

$B!!(B
$B!!$"$kF|FMA3(B
$B!!(B
$B!!!V!!<RD9!"$A$g$C$H$*OC$,!&!&!!!W$H$J$i$J$$0Y$K(B
$B!!(B
$B!!(B
$B!!(B4,000$B?M$N7P1D<T$,6&46$7$?!"(B
$B!!!V<R0w$NITK~$,$G$J$$I>2A@)EY!W$N$D$/$jJ}$rCN$k(B
$B!!(BWEB$B%;%_%J!<$r$40FFb$$$?$7$^$9!#(B
$B!!(B
$B!=!=!=!=!=!=!=!=!=!=!=!=(B

$B!!!!M%=($J<R0w$N%b%A%Y!<%7%g%sDc2<(B
$B!!!!!!!!FMA3$NN%?&$rKI;_$7$F(B
$B!!(B
$B!!@.2L$K$D$J$,$kI>2A@)EY#8$D$N%]%$%s%H(B
$B!!(B
$B!!F|!!Dx!'(B11$B7n(B19$BF|(B($B2P(B) 13:00-15:00
$B!!2q!!>l!'%*%s%i%$%s3+:E(B(ZOOM)
$B!!Dj!!0w!'(B300$BL>(B

$B!!!!!!!!"'(B $B>\:Y$O$3$A$i(B $B"'(B
$B!!(Bhttps://shikigaku-pupneo.jp/241119/
$B!!(B
$B!=!=!=!=!=!=!=!=!=!=!=!=(B
$B!!"(5.=E$J%N%&%O%&Ds6!$K$J$j$^$9$N$G(B
$B!!!!7P1D<T!&Lr0w$NJ}8BDj$H$J$j$^$9!#(B


$B!!K\%;%_%J!<$O(B4,000$B?M0J>e$N7P1DAX$,<u9V$7$?(B
$B!!%^%M%8%a%s%HM}O@!V<13X!W$N!VI>2A@)EY!W$r(B

$B!!%S%8%M%9$N<BL32H$H$7$F<BBN83$r%Y!<%9$K(B
$B!!7P1D<TL\@~$G$*EA$($$$?$7$^$9!#(B

$B!!B?$/$NItJ,$G6&46$$$?$@$1$k%;%_%J!<$H(B
$B!!$J$C$F$*$j$^$9$N$G$<$R$4;22C$/$@$5$$!#(B
$B!!(B
$B!!!N(B $BFb(B $BMF(B $B!O(B
$B!!!!!&$h$/$"$k8m$C$?I>2A@)EY(B
$B!!!!!&I>2A@)EY#8$D$N%]%$%s%H(B
$B!!!!!&1?MQ$K@dBP30$;$J$$%^%M%8%a%s%H<jK!(B
$B!!!!!&2a5n$N7P83$d;vNc$J$I(B

$B!!!X;22CFCE5!'%;%_%J!<;qNA$rL5NA?JDh!Y!!(B
$B!!(B
$B!!(B
$B!!$3$s$J$*G:$_$"$j$^$;$s$+!)(B
$B!!(B
$B!!!!M%=($J<R0w$N%b%A%Y!<%7%g%sDc2<(B
$B!!!!M}M3$r[#Kf$K$5$l$?!"FMA3$NB`?&(B
$B!!(B
$B!!$3$l$i$O!"AH?%%b%A%Y!<%7%g%s%^%M%8%a%s%H$K(B
$B!!O"F0$9$k!VI>2A@)EY!W$NLdBj$+$b$7$l$^$;$s!#(B
$B!!(B
$B!!@)EY$,==J,$K5!G=$7$F$$$J$$$HI>2A$N;~4|$K(B
$B!!%b%A%Y!<%7%g%sDc2<$,B3$-!"FMA3$NN%?&$X(B
$B!!7k2L!"A4<R%Q%U%)!<%^%s%9$K0-1F6A$rM?$($^$9!#(B
$B!!(B
$B!!(B
$B!!$7$+$7!"0lJ}$G<+<R$K$H$C$FE,@Z$JI>2A@)EY$r(B
$B!!#0$+$i9M$($k$3$H$O$H$F$bFq0WEY$,9b$$$G$9!#(B
$B!!(B
$B!!$=$s$J7P1D<T$dLr0w$NJ}$X!"(B
$B!!%S%8%M%9$+$i%9%]!<%DAH?%$G$b;H$($kHFMQ@-$N9b$$(B
$B!!!V4V0c$$$J$$!WI>2A@)EY$r$*EA$($7$^$9!#(B
$B!!(B
$B!!(B
$B!!=>Mh7?$NI>2A@)EY$NLdBjE@$d2~A1J}K!$K$D$$$F(B
$B!!CzG+$K2r@b$7!"AH?%$NI>2A@)EY$rJQ3W$G$-$k(B
$B!!7P1D<T$dLr0w$N3'MM$K$H$C$F!"M-1W$J>pJs$rDs6!$$$?$7$^$9!#(B
$B!!(B
$B!!$3$N%;%_%J!<$,!"I>2A@)EY$N2~A1$r9M$($k(B
$B!!5!2q$K$J$l$P$&$l$7$$$G$9!#(B
$B!!(B
$B!!!!!!!!"'(B $B>\:Y$O$3$A$i(B $B"'(B
$B!!(Bhttps://shikigaku-pupneo.jp/241119/
$B!!(B
$B!!(B
$B!!$46=L#$r$*;}$A$$$?$@$1$^$7$?$i!"(B
$B!!$4;22C$N$*?=9~$_$rD:$1$^$9$H9,$$$G$9!#(B
$B!!(B
------------------------
$B!!(BP-up$B!_<13X(B $B%;%_%J!<;vL36I(B
$B!!El5~ETBfEl6hCSG7C<(B1$BCzL\(B2-18$B!!(B8F
$B!!EEOC!'(B03-5829-8444

$B!!G[?.Dd;_$r$44uK>$NJ}$O(B
$B!!BgJQ;DG0$G$O$4$6$$$^$9$,!"(B
$B!!2<5-(BURL$B$h$j<jB3$-2<$5$$$^$;!#(B

$B!!G[?.Dd;_$O$3$A$i(B
$B!!(Bhttps://shikigaku-pupneo.jp/mail/

