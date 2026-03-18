Return-Path: <linux-rtc+bounces-6231-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9bFGHV4sumkVSgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6231-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2026 05:38:54 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D48982B5C81
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2026 05:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CFC63019138
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2026 04:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02863351C25;
	Wed, 18 Mar 2026 04:31:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9204.ps.combzmail.jp (r9204.ps.combzmail.jp [160.16.62.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925F285CA4
	for <linux-rtc@vger.kernel.org>; Wed, 18 Mar 2026 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.62.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773808265; cv=none; b=rLjqfjCf3Q139b/7nx4RF8jHi2STbv21ohTFPKh34JQRSypOgTmRP4bhuXZcmp1TnRQZv+U7JVb6H3E/j6JOzADy/KAl+uZ8tpUdPg+1+RyJRZQ5x/uUgeP8WB9K25l0ZswTPpYHK4hIgDr0Se9jFPqKaViWWkWWskm2NjYwXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773808265; c=relaxed/simple;
	bh=QQ+3gEbhGo+AoipHB9xiZytr5r9L1Ma7CYIdP1mEhBk=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=LHq4hKOmkcdlx2XoWR/IwE7cy8hE2OWhJpzHV8C0TT0Sg6rCItxDSywi3jDsiDOfRyoXyOODlhMRbBk4Jdp43zKVSZo4K/JG6zGAz+YzuDpNOorNS3NPIp1OCvsXbSSbWtlqBO1NVoG8Qs21Hs5yp8Sxkg4ca7NW6TamKs/oYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.62.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9204.ps.combzmail.jp (Postfix, from userid 99)
	id 8F1301038C5; Wed, 18 Mar 2026 13:30:33 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9204.ps.combzmail.jp 8F1301038C5
To: linux-rtc@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCE/JUolbCVDJTglaiVzJS8bKEI=?= <info@knowledge-seminar.jp>
X-Ip: 5212893215381475
X-Ip-source: k85gj72848dnsad1u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPFJEOSROGyhCTkcbJEI5VEYwGyhC?=
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 28d1
X-uId: 6764245641486059714435611045
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20260318043102.8F1301038C5@r9204.ps.combzmail.jp>
Date: Wed, 18 Mar 2026 13:30:33 +0900 (JST)
X-Spamd-Result: default: False [10.28 / 15.00];
	FUZZY_DENIED(9.94)[1:f37ffecbe3:0.68:txt];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[knowledge-seminar.jp];
	TAGGED_FROM(0.00)[bounces-6231-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@knowledge-seminar.jp,linux-rtc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.979];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fc-knowledgelink-corp.jp:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,knowledge-corp.jp:url,r9204.ps.combzmail.jp:mid]
X-Rspamd-Queue-Id: D48982B5C81
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

　お世話になります。ナレッジリンクセミナー事務局です。
　
　
　「社員のモチベーションを上げようと声をかける」
　「部下の相談に乗り、一緒に悩んであげる」
　「現場のトラブルに、自ら先頭に立って対応する」
　
　もし社長がこれらを率先しているようであれば、
　残念ながら、その組織の成長はそこで止まります。
　
　社長のその“優しさ”が、社員の甘えを生み、責任感を奪い、
　「指示待ち人間」を量産する装置になっているからです。
　
　
　4,800社の経営者が衝撃を受けた、
　良かれと思ってやってしまう「社長のNG行動」の正体。
　
　組織を劇的に変えるための、
　オンラインセミナーを開催いたします。
　
　1つでも心当たりがあれば、一度ご視聴ください。　
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
----------------------------------------------
　
　テーマ ：　それ、危険です 『社長のNG行動』
　　　　　 〜 その行動が、組織崩壊を招く 〜
　

　日 程　： 3月19日（木）13:00〜15:00　残り14枠
　　　　　  4月14日（火）13:00&#12316;15:00
　　　　　  4月21日（火）13:00&#12316;15:00
　　　　　※どちらの日程も内容は同じ
　会 場　：Zoom開催
　定 員　：先着100名（費用は不要）
----------------------------------------------
　※経営層の方限定です
　
　
　なぜ、社員は「言われたこと」しかやらないのか。
　なぜ、次世代のリーダー候補が育たないのか。
　
　それは、能力の問題ではなく、
　
　良かれと思って続けている「社長の配慮」こそが、
　組織成長を止める、最大のボトルネックかもしれません。
　
　本セミナーでは、4,800社以上が導入した
　独自の組織論「識学」に基づき、社長の「NG行動」と
　真の経営者へ脱皮するためのマインドセットを伝授します。
　
　
　【セミナー内容(一部抜粋)】
　 ○ NG行動3選
　 ○ なぜ優秀なNo.2や部長が育たないのか
　 ○ マネジメントスタイルの変革について
　 ○ 導入企業の事例
　
　「管理職が育ったら任せる」ではなく「任せるから育つ」
　という思考の逆転を提言。
　
　現場から「冷たくなった」と思われることを恐れず、
　機能的な階層構造（仕組み）を作ることで

　結果として社員全員を守り、
　利益を最大化させる道筋を明示します。

　「優しさ」で人を動かすのではなく、
　「正しさ」で組織を動かす。

　音声やお顔が表に出ることはございませんので
　お気軽にご視聴ください。
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
　
-----------------------
　一般社団法人 ナレッジリンク
　東京都千代田区神田小川町1-8-3
　電話：03-5256-7638

　セミナーのご案内が不要な方は大変残念ではございますが、
　下記URLより手続き下さいませ。
　
　メール配信のワンクリック解除はこちら
　https://fc-knowledgelink-corp.jp/mail/
　

