Return-Path: <linux-rtc+bounces-2049-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE097E940
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 12:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DB151F21F0A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627E3197A69;
	Mon, 23 Sep 2024 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ih89HEvr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70947194C6E;
	Mon, 23 Sep 2024 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085619; cv=none; b=NxQjxnLYdnSJG77SUbovXHdHMKbejo49Xdj+HRaikInvAFjzQWGZMHUQE/lKjQd6ZWVVyXJk3cddVumjb3JzKkJIj2ZZ+0US2VZ2m68DYo/9Uoli7VmaaDzGZ7Hlf1btOwupLZ7zmC2nSNWcO3coyxya/+2U1X7se+NBpAd5190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085619; c=relaxed/simple;
	bh=EVa8pFZK1Gg2RTP6+a6/2urfhYG5YFYSX1JAt7R4Yi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnG0kvz5weXz6h0QnEFbhq7WLD8gq3g0rJJd2cDwh6FqGB+GhS6izBfDsQ/hmop7xxHEHDLVuy4kSQXmFriiXTGIqOYbES3pdYyThfjZnHHBamkLBpbFGEmten33KEkAQT5xOsguc3yLNSdfKo/PbplughwUcpzsjuOX/N1UVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ih89HEvr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085615;
	bh=EVa8pFZK1Gg2RTP6+a6/2urfhYG5YFYSX1JAt7R4Yi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ih89HEvrjCdr+PhyTQoUw7wGQee/jfqo1S+wA+rutY1NkTRHoyBWrb7JUIxxbi6Pr
	 og/QOh/P2Csh+mCIR2i6FJTlxhJ9Gap+3995bEtSzqkVNJg4hwF3NpfgvKWGh3aycB
	 z/NTjbbx1nhKQg8a7G4MrdvnBetbeEfyhStNTE4CBQzOed66K+mpXdIix8KL69QFg5
	 Nh0Hr8IO1rhxfX6QFgYgodk1BXwz3tE7IBpfF3NX8fYzNhzPsqoN/HBU0V8S+fCNWo
	 Kcj4U0Pj3CnuXleHU0ufRDowANlc9b+/gaeo0HnsIrAyN8vJ5V1VhyxjVud/oJufuL
	 MxJBc+gzzplww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E93C217E10FC;
	Mon, 23 Sep 2024 12:00:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eddie.huang@mediatek.com,
	sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com,
	macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 3/3] rtc: mt6359: Use RTC_TC_DOW hardware register for wday
Date: Mon, 23 Sep 2024 12:00:10 +0200
Message-ID: <20240923100010.97470-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calculating the number of full days since Sunday with
(days + 4) % 7, read (and write) that to the RTC Day-of-week Time
Counter register (RTC_TC_DOW).

Some transformation (addition and subtraction for set/get) is
still done, as this register's range is [1..7], while the tm_wday
in struct tm's range is [0..6].

Please note that this was added only to set_time() and read_time()
callbacks because set_alarm() and read_alarm() are setting a bit
in RTC_AL_MASK to ignore DOW for RTC HW alarms for unknown reasons.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rtc/rtc-mt6397.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 4785af123a7f..152699219a2b 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -75,6 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_min = data[RTC_OFFSET_MIN];
 	tm->tm_hour = data[RTC_OFFSET_HOUR];
 	tm->tm_mday = data[RTC_OFFSET_DOM];
+	tm->tm_wday = data[RTC_OFFSET_DOW];
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR];
 
@@ -86,9 +87,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 
 static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	time64_t time;
 	struct mt6397_rtc *rtc = dev_get_drvdata(dev);
-	int days, sec, ret;
+	int sec, ret;
 
 	do {
 		ret = __mtk_rtc_read_time(rtc, tm, &sec);
@@ -96,15 +96,9 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
-	/* HW register start mon from one, but tm_mon start from zero. */
+	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
 	tm->tm_mon--;
-	time = rtc_tm_to_time64(tm);
-
-	/* rtc_tm_to_time64 covert Gregorian date to seconds since
-	 * 01-01-1970 00:00:00, and this date is Thursday.
-	 */
-	days = div_s64(time, 86400);
-	tm->tm_wday = (days + 4) % 7;
+	tm->tm_wday--;
 
 exit:
 	return ret;
@@ -117,11 +111,13 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u16 data[RTC_OFFSET_COUNT];
 
 	tm->tm_mon++;
+	tm->tm_wday++;
 
 	data[RTC_OFFSET_SEC] = tm->tm_sec;
 	data[RTC_OFFSET_MIN] = tm->tm_min;
 	data[RTC_OFFSET_HOUR] = tm->tm_hour;
 	data[RTC_OFFSET_DOM] = tm->tm_mday;
+	data[RTC_OFFSET_DOW] = tm->tm_wday;
 	data[RTC_OFFSET_MTH] = tm->tm_mon;
 	data[RTC_OFFSET_YEAR] = tm->tm_year;
 
-- 
2.46.0


