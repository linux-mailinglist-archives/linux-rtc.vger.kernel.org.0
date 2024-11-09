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

　
　ある日突然
　
　「　社長、ちょっとお話が・・　」とならない為に
　
　
　4,000人の経営者が共感した、
　「社員の不満がでない評価制度」のつくり方を知る
　WEBセミナーをご案内いたします。
　
――――――――――――

　　優秀な社員のモチベーション低下
　　　　突然の離職を防止して
　
　成果につながる評価制度８つのポイント
　
　日　程：11月19日(火) 13:00-15:00
　会　場：オンライン開催(ZOOM)
　定　員：300名

　　　　▼ 詳細はこちら ▼
　https://shikigaku-pupneo.jp/241119/
　
――――――――――――
　※貴重なノウハウ提供になりますので
　　経営者・役員の方限定となります。


　本セミナーは4,000人以上の経営層が受講した
　マネジメント理論「識学」の「評価制度」を

　ビジネスの実務家として実体験をベースに
　経営者目線でお伝えいたします。

　多くの部分で共感いただけるセミナーと
　なっておりますのでぜひご参加ください。
　
　［ 内 容 ］
　　・よくある誤った評価制度
　　・評価制度８つのポイント
　　・運用に絶対外せないマネジメント手法
　　・過去の経験や事例など

　『参加特典：セミナー資料を無料進呈』　
　
　
　こんなお悩みありませんか？
　
　　優秀な社員のモチベーション低下
　　理由を曖昧にされた、突然の退職
　
　これらは、組織モチベーションマネジメントに
　連動する「評価制度」の問題かもしれません。
　
　制度が十分に機能していないと評価の時期に
　モチベーション低下が続き、突然の離職へ
　結果、全社パフォーマンスに悪影響を与えます。
　
　
　しかし、一方で自社にとって適切な評価制度を
　０から考えることはとても難易度が高いです。
　
　そんな経営者や役員の方へ、
　ビジネスからスポーツ組織でも使える汎用性の高い
　「間違いない」評価制度をお伝えします。
　
　
　従来型の評価制度の問題点や改善方法について
　丁寧に解説し、組織の評価制度を変革できる
　経営者や役員の皆様にとって、有益な情報を提供いたします。
　
　このセミナーが、評価制度の改善を考える
　機会になればうれしいです。
　
　　　　▼ 詳細はこちら ▼
　https://shikigaku-pupneo.jp/241119/
　
　
　ご興味をお持ちいただけましたら、
　ご参加のお申込みを頂けますと幸いです。
　
------------------------
　P-up×識学 セミナー事務局
　東京都台東区池之端1丁目2-18　8F
　電話：03-5829-8444

　配信停止をご希望の方は
　大変残念ではございますが、
　下記URLより手続き下さいませ。

　配信停止はこちら
　https://shikigaku-pupneo.jp/mail/

