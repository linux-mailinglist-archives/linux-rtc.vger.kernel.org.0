Return-Path: <linux-rtc+bounces-4851-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D981FB50ADF
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 04:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995573A997F
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 02:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BD723536C;
	Wed, 10 Sep 2025 02:12:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9204.ps.combzmail.jp (r9204.ps.combzmail.jp [160.16.62.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725271A9FBA
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 02:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.62.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470335; cv=none; b=r+rdfZ7m1wEbwfchhlMbeWLZhxHdAABndn23YlxHsSUnctQDca9jeI0NHobFmhCUl1BmKLYpM/mxNW5J6ul3Y9bPUpSogdKeS4zzwYtt/fQU9+QBPPbHFPAEN2OoQlgfeHs9qy+E1+Dw7wntfiHCFnurUZAUPLP6PXqZGzlJDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470335; c=relaxed/simple;
	bh=H7skry00/cVP0ZAaAZkvJJjqgZu6ph1kst5FtLNTm8g=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=QuDsDb00i7n11Oy2mCJ6wAa7Hob8tCse4r+hCWoNvUhu7/7aEMQ0E//7cwFRuiwOqzrWfiZAKBo/1YP2TRVmHM33swYTs/8oMT98l5zxhFkn5Iutv3O+qGiLeUmN4tzqubEaXFlAeFMUB4GvO7hbM7jAINAfoNTfBZHVut3S9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fc-seminar-online.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.62.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fc-seminar-online.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9204.ps.combzmail.jp (Postfix, from userid 99)
	id 65CF7103C09; Wed, 10 Sep 2025 10:57:59 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9204.ps.combzmail.jp 65CF7103C09
To: linux-rtc@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCPSJPKzBcOVQ7WTFnO3Y2SBsoQg==?= 
 =?ISO-2022-JP?B?GyRCQGJMQDJxGyhC?= <info@fc-seminar-online.jp>
X-Ip: 5790563803959527
X-Ip-source: k85gj7o648dnsaq5u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPmMzMjxUJE49Ik8rJHI7WTFnJDkkazt2GyhC?=
 =?ISO-2022-JP?B?GyRCNkgbKEIgGyRCPzc1LDMrNkglUSE8JUglSiE8GyhC?=
 =?ISO-2022-JP?B?GyRCSmc9OBsoQg==?=
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: o6q5
X-uId: 6763304839485965624936221054
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20250910020103.65CF7103C09@r9204.ps.combzmail.jp>
Date: Wed, 10 Sep 2025 10:57:59 +0900 (JST)

$B!!(B
$B!!2<5-%(%j%"$K$*$$$F!"Bg?M$NH/C#>c32$NJ}$,F/$/$3$H$r;Y1g$9$k!"(B
$B!!!V8|O+>J5vG'2D!W$N="O+0\9T;Y1g;v6H$N?75,3+6H%Q!<%H%J!<$rJg=8$7$F$$$^$9!#(B
$B!!(B
$B!!(B
$B!!!~#1%(%j%"#14k6HMM8BDj$N%(%j%"%Q!<%H%J!<@)$H$J$j$^$9!~(B


$B!!!!!!!!!!!!!!!!!!!!!!!AJg=8%(%j%"!A(B
$B!!!!!!!!!!KL3$F;!?@D?98)!?J!Eg8)!?0q>k8)!?72GO8)(B
$B!!!!!!!!!!:k6L8)!?@iMU8)!?El5~ET!??@F`@n8)(B
$B!!(B
$B!!!!!!!!!!?73c8)!?J!0f8)!?D9Ln8)(B
$B!!!!!!!!!!0&CN8)!?;0=E8)!?Bg:eI\!?J<8K8)(B
$B!!(B
$B!!!!!!!!!!D;<h8)!?;38}8)!?FAEg8)!?9bCN8)(B
$B!!!!!!!!!!D9:j8)!?5\:j8)!?</;yEg8)!?2-Fl8)(B
$B!!(B
$B!!(B9$B7n(B16$BF|!J2P!K!!(B16:00-17:00$B!!%*%s%i%$%s3+:E(B
----------------------------------------------------------
$B!!(B
$B!!!!!!!!!!(B    $B!]!!#1%(%j%"#14k6H(B $B8BDj!!!](B
$B!!!!!!!!!!!!!!!!(B
$B!!!!!!!!(B $BBg?M$NH/C#>c32$NJ}$,F/$/$3$H$r;Y1g$9$k(B
$B!!!!!!!!!!(B $B="O+0\9T;Y1g;v6H!!!V%G%#!<%-%c%j%"!W(B
$B!!!!!!!!!!!!!!?75,3+6H%Q!<%H%J!<Jg=8@bL@2q(B

$B!!!!!!!!!!!!!!!!!!(B>>$B>\:Y!&?=9~(B<<
$B!!!!!!(B   $B!!!!(Bhttps://decoboco-fc.jp/25m/


$B!!(B  $B!!!!!!!!!!!!!!"!!!(B $B!!Ds6!!!!!(B $B"!(B
$B!!!!!!!!!!!!!!!!%G%3%\%3%Y!<%93t<02q<R(B
 $B!!!!!!!!!!!!!J%G%#!<%-%c%j%"(B FC$B1?1DK\It!K(B

----------------------------------------------------------
$B!!(B
$B!!$$$D$b$*@$OC$K$J$j$^$9!#(B
$B!!(B
$B!!(B
$B!!8|O+>JG'2D$N!V="O+0\9T;Y1g;v6H!W$N?75,3+6H%Q!<%H%J!<$r(B
$B!!Jg=8$9$k%*%s%i%$%s@bL@2q$N$40FFb$K$D$-$4O"Mm:9$7>e$2$^$7$?!#(B
$B!!(B
$B!!(B
$B!!K\;v6H$O6H3&L$7P83$+$i%9%?!<%H$,$G$-!"CO0h<R2q$X$N9W8%$H(B
$B!!%9%H%C%/7?$N0BDj$7$?<}1W$r<B8=$9$k$3$H$,2DG=$G$9!#(B
$B!!(B
$B!!(B
$B!!?7$?$J%S%8%M%9$NE83+$r$48!F$$G$7$?$i!"(B
$B!!$3$N5!2q$K$^$:$OK\@bL@2q$X$4;22C$/$@$5$$$^$;!#(B
$B!!(B
$B!!(B
$B!!$h$m$7$/$*4j$$$7$^$9!#(B
$B!!(B
$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B!!="O+0\9T;Y1g;v6H!!(BFC$B@bL@2q;vL36I(B
$B!!EEOC!'(B0120-891-893
$B!!=;=j!'El5~ETCf1{6h6d:B(B7-13-6
$B!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=!=(B
$B!!K\%a!<%k$N$4ITMW$JJ}$K$OBgJQ$4LBOG$r$*$+$1$$$?$7$^$7$?!#(B
$B!!2<5-%"%I%l%9$h$j!"$*<jB3$-$r$*4j$$$$$?$7$^$9!#(B
$B!!(1!!(Bhttps://decoboco-fc.jp/mail/
$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

