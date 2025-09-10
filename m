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

　
　下記エリアにおいて、大人の発達障害の方が働くことを支援する、
　「厚労省許認可」の就労移行支援事業の新規開業パートナーを募集しています。
　
　
　◇１エリア１企業様限定のエリアパートナー制となります◇


　　　　　　　　　　　〜募集エリア〜
　　　　　北海道／青森県／福島県／茨城県／群馬県
　　　　　埼玉県／千葉県／東京都／神奈川県
　
　　　　　新潟県／福井県／長野県
　　　　　愛知県／三重県／大阪府／兵庫県
　
　　　　　鳥取県／山口県／徳島県／高知県
　　　　　長崎県／宮崎県／鹿児島県／沖縄県
　
　9月16日（火）　16:00-17:00　オンライン開催
----------------------------------------------------------
　
　　　　　    −　１エリア１企業 限定　−
　　　　　　　　
　　　　 大人の発達障害の方が働くことを支援する
　　　　　 就労移行支援事業　「ディーキャリア」
　　　　　　　新規開業パートナー募集説明会

　　　　　　　　　>>詳細・申込<<
　　　   　　https://decoboco-fc.jp/25m/


　  　　　　　　　◆　 　提供　　 ◆
　　　　　　　　デコボコベース株式会社
 　　　　　　（ディーキャリア FC運営本部）

----------------------------------------------------------
　
　いつもお世話になります。
　
　
　厚労省認可の「就労移行支援事業」の新規開業パートナーを
　募集するオンライン説明会のご案内につきご連絡差し上げました。
　
　
　本事業は業界未経験からスタートができ、地域社会への貢献と
　ストック型の安定した収益を実現することが可能です。
　
　
　新たなビジネスの展開をご検討でしたら、
　この機会にまずは本説明会へご参加くださいませ。
　
　
　よろしくお願いします。
　
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
　就労移行支援事業　FC説明会事務局
　電話：0120-891-893
　住所：東京都中央区銀座7-13-6
―――――――――――――――――――――――――――――――
　本メールのご不要な方には大変ご迷惑をおかけいたしました。
　下記アドレスより、お手続きをお願いいたします。
　┗　https://decoboco-fc.jp/mail/
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

