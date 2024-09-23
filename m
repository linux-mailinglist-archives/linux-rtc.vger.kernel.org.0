Return-Path: <linux-rtc+bounces-2048-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56297E93D
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 12:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709CE2816CD
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 10:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520E19753F;
	Mon, 23 Sep 2024 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h8Jax48P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDC195FD1;
	Mon, 23 Sep 2024 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085618; cv=none; b=S+RjYaVOFpX7noCx0MZBYdxQ7wWVhshwHlhJXpGy32MX0i/ZJgWzOZ/9zEBoOn8ozh76xVsLQG7CXJQFV6vzUdBV0tHamCTHoEhu9EaimjcZeuzsbsqU9tI3hhZjVa13HXMTAZt8eF7gvVAcwfHSpX3Wv7dOYrHG6LV/wGIBPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085618; c=relaxed/simple;
	bh=YrvCOBRllTDZcvuPynXFN1lDKpyxG284BO/X9CnemNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DklorwTyVb8Zre10fPGj9qJUrYC8KJSIy200ikSARcJp/vZEo5SEMbffQ73WUw5m4AhX3wTXpnseM5yUDhQCgd+IbgfzgUBKmmH+51hdVP2VbmRudH7tEHmwxUZzQ3cOND2zIQA+IEfTuXFPSXoD3JzhcV3BNYMU1xl+NvckX9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h8Jax48P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085614;
	bh=YrvCOBRllTDZcvuPynXFN1lDKpyxG284BO/X9CnemNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8Jax48P/c+QVuNQ6JkqF+x+nTEam9eaf+PQGnzo4bF0PAqJ+6UhtwoOaeJtaijvd
	 z5Gsq1lzk2b+jBztRd9rDFQP96QEUVNMjJ5iODjPnRTm+lVV9YrdcxJJ6uvg6ESYWk
	 9XritmaOw2DS1cIuPEyPV05crKdkYhtNQWCvv/DyCTDUmyKoj3SCaOXjgd5kOoOKf4
	 LlUbRDDj2kMAPlmM6Ys9DwH1S08kIDBhhKq4HZp+t4ly7rYXCGQxdM33d9c0Tz3qjw
	 HUYtQ9IRruDe2usZXAO21mMRxoB9KjOJ3ZXlV4vxNm2PqJYOweMToni3Gvg6LSY7TC
	 l4GjVjxIJ0g7A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28C1817E10D3;
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
Subject: [PATCH v1 2/3] rtc: mt6359: Add RTC hardware range and add support for start-year
Date: Mon, 23 Sep 2024 12:00:09 +0200
Message-ID: <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
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

Add the RTC hardware range parameters to enable the possibility
of using the `start-year` devicetree property which, if present,
will set the start_secs parameter by overriding the defaults
that this driver is setting;

To keep compatibility with (hence have the same date/time reading
as) the old behavior, set:
 - range_min to 1900-01-01 00:00:00
 - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
 - start_secs defaulting to 1968-01-02 00:00:00

Please note that the oddness of starting from January 2nd is not
a hardware quirk and it's done only to get the same date/time
reading as an RTC which time was set before this commit.

Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
callbacks set_time() and read_time() respectively, as now this
is already done by the API.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rtc/rtc-mt6397.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 1617063669cc..4785af123a7f 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -96,12 +96,6 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
-	/* HW register use 7 bits to store year data, minus
-	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
-	 * RTC_MIN_YEAR_OFFSET back after read year from register
-	 */
-	tm->tm_year += RTC_MIN_YEAR_OFFSET;
-
 	/* HW register start mon from one, but tm_mon start from zero. */
 	tm->tm_mon--;
 	time = rtc_tm_to_time64(tm);
@@ -122,7 +116,6 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
-	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	data[RTC_OFFSET_SEC] = tm->tm_sec;
@@ -178,7 +171,6 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
-	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
 
 	return 0;
@@ -194,7 +186,6 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
-	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	mutex_lock(&rtc->lock);
@@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
+	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
+	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
+	rtc->rtc_dev->set_start_time = true;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
-- 
2.46.0


