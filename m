Return-Path: <linux-rtc+bounces-6344-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBrkIdVM4GkXegAAu9opvQ
	(envelope-from <linux-rtc+bounces-6344-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 04:43:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4C409BDB
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 04:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A93063041A5C
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 02:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A9A244694;
	Thu, 16 Apr 2026 02:43:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from r9103.ps.combzmail.jp (r9103.ps.combzmail.jp [49.212.47.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471F1F8691
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.47.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776307409; cv=none; b=Z5KXhPhB+Ym26ZGf1mPz6OKIoGomfN4cKHNpTghhPatM3TEASkJ6q+sXqMs+O8P0m/MdUKyrrX2kJmjeQ+z2fcnapI+cpveMjE2GFLwA1jibNLozVV9srJ68rDrj/mC+pvamchB6V+/3bnv4rAY8No5mCJCVa3bQFSwOXiCKgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776307409; c=relaxed/simple;
	bh=dDkk4mnzfHKJldzPmvzDMe22JbYrxd2TLEafe2IUTJI=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=jnZRJqGGWHti3lqBBHyKR78mk/TsDU16pAQJhrvrQdfKDLctLoJm+weFM5Aqs8oNAvq2Q1RWGpgOVEORvSHUnhc0LbPZ+/AVbMOMDFe/Dwo0xJvHkUFnT0UkMSm9+fA2Da4MzLU0QMj2KpZNVjU+kjbsjBTr6OTgNVZt2eR7Ic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=49.212.47.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9103.ps.combzmail.jp (Postfix, from userid 99)
	id B2B21189C8F; Thu, 16 Apr 2026 11:42:50 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9103.ps.combzmail.jp B2B21189C8F
To: linux-rtc@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCE/JUolbCVDJTglaiVzJS8bKEI=?= <info@knowledge-seminar.jp>
X-Ip: 6470621032510968
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
X-uId: 6764255440486060694174711026
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20260416024320.B2B21189C8F@r9103.ps.combzmail.jp>
Date: Thu, 16 Apr 2026 11:42:50 +0900 (JST)
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[knowledge-seminar.jp];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6344-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@knowledge-seminar.jp,linux-rtc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.614];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	R_DKIM_NA(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[knowledge-corp.jp:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,r9103.ps.combzmail.jp:mid]
X-Rspamd-Queue-Id: E7E4C409BDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
　

　日 程　： 4月21日（火）13:00スタート　※残11席
　　　　　  5月19日（火）13:00スタート
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
　

