Return-Path: <linux-rtc+bounces-6579-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPwrD/i6F2rMOwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6579-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:48:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF585EC4AD
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7C030CED69
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 03:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CCF311954;
	Thu, 28 May 2026 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="S8wUAJds"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED41D2DF12F;
	Thu, 28 May 2026 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940024; cv=none; b=ScdEwsI7VQxbJpMCcnD5SSDAAZNfDDO1Y4BUYyDg2yK9FkUV1+v1TG0TzZqTxa/kt6YiHZMgc3SbJ/C3RJoomoWEvc24n/hZlFGpP+/c6SfpXBR7Crz0FtEhZGZcPEKu/CE/h0xQZP3ezln2+Rsatr44TeBILZCHTY/rUGm5Xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940024; c=relaxed/simple;
	bh=N/+7UgqP3hDoMpdcWGIoFqQQDTgfq+jlToGKPISYtQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GCzeqecQZvu4B2fT5K6DwH4DIclkixp4SJbhkw5ipuEVAu+yFGPhf3FYp4RETusDpigjJgNbvu1nAvy55sFTqw5ow1P+YWGBRXlq/swmgy4smDOX7SSTG5un4cw5vQC1JJABUtls9USMRZio/5NbC7lGdtwoVO4SRW0mpI8+5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=S8wUAJds; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779940022; x=1811476022;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=N/+7UgqP3hDoMpdcWGIoFqQQDTgfq+jlToGKPISYtQw=;
  b=S8wUAJds8oBe7J8cpusYX6x0yyj/+6NgvMjmR3lVmQsRHtn800BUfO1C
   xxzbHzK/fioS2mJG+diY4BNfYTkDTQqi11pm7NP3xAEwaoKvrMv2AQSVt
   /MuOrdEXWB1PUDUUqigVl6SxyfDzZUNTzO1JFc2kFR20EEVS3lPe00xDX
   0GexkodtnnNNtoyLHvwu5moBG17ok0uOT1tPuwBa5Y49qRw2vdIdphIpV
   yRYyL+Edkzg0wa9fnXJ5qhC+CPOo8KA/WxayWl/8GC7kZGvlU1f8u+0UH
   reZZ1isa8oL1EZVS2GyfDz33POEMjqjJ038Wpzvj+gOvM6VwVvlz1TmnR
   w==;
X-CSE-ConnectionGUID: g5WiT7AxRUSGqWE/rya/Jg==
X-CSE-MsgGUID: jGORMBdnRS6eUJhIYGtpGQ==
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="225400144"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:47:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 20:46:58 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 20:46:55 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Thu, 28 May 2026 09:16:46 +0530
Subject: [PATCH 3/4] rtc: sc27xx: convert to dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260528-cleanup-dev-err-probe-rtc-v1-3-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "Orson
 Zhai" <orsonzhai@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6579-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.alibaba.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8EF585EC4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use dev_err_probe() in place of dev_err() and return, which
communicates the error type and helps debugging hardware issues.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/rtc/rtc-sc27xx.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 2b83561d4d2..2c6d4565389 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -574,10 +574,8 @@ static int sprd_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = of_property_read_u32(node, "reg", &rtc->base);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get RTC base address\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get RTC base address\n");
 
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0)
@@ -592,26 +590,20 @@ static int sprd_rtc_probe(struct platform_device *pdev)
 
 	/* check if we need set the alarm interrupt */
 	ret = sprd_rtc_check_alarm_int(rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to check RTC alarm interrupt\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to check RTC alarm interrupt\n");
 
 	/* check if RTC time values are valid */
 	ret = sprd_rtc_check_power_down(rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to check RTC time values\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to check RTC time values\n");
 
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 					sprd_rtc_handler,
 					IRQF_ONESHOT | IRQF_EARLY_RESUME,
 					pdev->name, rtc);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request RTC irq\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request RTC irq\n");
 
 	device_init_wakeup(&pdev->dev, true);
 

-- 
2.34.1


