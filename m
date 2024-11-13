Return-Path: <linux-rtc+bounces-2551-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9199C6DE2
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 12:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BD91F21870
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 11:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D76D1FF054;
	Wed, 13 Nov 2024 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F7fUOkRN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA11FF5EB
	for <linux-rtc@vger.kernel.org>; Wed, 13 Nov 2024 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731497451; cv=none; b=m1naINntNghUQgxaTsj0CzIlyOqkMc1Hr2GjuglR5Rs1k117V3RFC4yJwrVlZo/3ebPq2PiZ4mPjp+RzcNNSkO1wFDY7GsLQP51QSsxgN0N5oMmSOV72Ksda8JFPp4mTRLG56eLq8tjdOrje8qsN00ZkgoFBrrnU+exotPSw8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731497451; c=relaxed/simple;
	bh=J5btnQlH0PeMzYyGqLpogcTSzK7tOilGztRw17sqpKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J+DXPVEsyq4Wx5Xdkhrpm7kVwE8QCa0pu/PsEzKZtS9DC39yi03qOPNiZHJzLzLFD+DqFeivtqAmSvW0v/XCjugiIDR6Do2cQYD/k2sYH9x0ulM/1aEawzjfodGamG4Hat/XQf3eRusbv15XYOhnaKPlcyQMOxvfX4SXqbs11Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F7fUOkRN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=7vXBPXir51a/LF
	kMnHbeuFsmzXM9Ech/7YGkNl/OEW8=; b=F7fUOkRN+/EGmZyVK6/Kq4/nz/Skyf
	vQ3S7Pdbr7CGE/DW3oZwU98HcMHoSACZkF8zsPsFqS2OXzxXg3sOghoQ9CXIs2sl
	bTxK1nmalkE+/QfOpWhGN42prp8Tp7+UMmUtCIQVxi1hw09FFAueVpL8sPgvn06r
	O9gmCQ4e4erdVQqLIjcZhDfAFDWsxEtaPA9lYwACJSBFw9WHaQewvBKDLSXtPLYa
	i8RjMNyHZGvdNjMt7fZJ9ee4BcXdOh2Juwf2ucS61Sqi6v4BxToIzTvth6VKgtWC
	pZuRBpWo1HClo3eXkra2LZyL7FVdl+ga9NBdBp8jdtwlgJ8am0pgZPKw==
Received: (qmail 2813146 invoked from network); 13 Nov 2024 12:30:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2024 12:30:37 +0100
X-UD-Smtp-Session: l3s3148p1@ZR2oqckmyoZehhtH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
Date: Wed, 13 Nov 2024 12:30:32 +0100
Message-Id: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tm_mon describes months from 0 to 11, but the register contains BCD from
1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
Apply the offsets when converting these numbers.

Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

We had this kind of fix in two different BSPs, time to get it upstream.
While I am here, I have one question: Isn't it better to replace

	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
	...
	writel(tm->tm_mon, rtc->base + RZN1_RTC_MONTH);

with
	writel(bin2bcd(tm->tm_mon + 1), rtc->base + RZN1_RTC_MONTH);

I'd say it is even more readable and I also think it is better coding
style if 'tm' always contains defined values.

Happy hacking,

   Wolfram

 drivers/rtc/rtc-rzn1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 56ebbd4d0481..8570c8e63d70 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -111,8 +111,8 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_hour = bcd2bin(tm->tm_hour);
 	tm->tm_wday = bcd2bin(tm->tm_wday);
 	tm->tm_mday = bcd2bin(tm->tm_mday);
-	tm->tm_mon = bcd2bin(tm->tm_mon);
-	tm->tm_year = bcd2bin(tm->tm_year);
+	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;
+	tm->tm_year = bcd2bin(tm->tm_year) + 100;
 
 	return 0;
 }
@@ -128,8 +128,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_hour = bin2bcd(tm->tm_hour);
 	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
 	tm->tm_mday = bin2bcd(tm->tm_mday);
-	tm->tm_mon = bin2bcd(tm->tm_mon);
-	tm->tm_year = bin2bcd(tm->tm_year);
+	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
+	tm->tm_year = bin2bcd(tm->tm_year - 100);
 
 	val = readl(rtc->base + RZN1_RTC_CTL2);
 	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
-- 
2.39.2


