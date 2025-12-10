Return-Path: <linux-rtc+bounces-5528-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B3CB3F02
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 21:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBFB43000CF9
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 20:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B308532548B;
	Wed, 10 Dec 2025 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noM8ookT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AE313E36;
	Wed, 10 Dec 2025 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398013; cv=none; b=tP4Us4R37i4THbmERq5dNFqSeELRi+ekftpoH38oxriEq9ZmXEW91CfSJ/E+EU3oV6JMgYqhf4m41UTjQgTkGyFNhuKTUJVxiD7JCfPPF/qgayBpAQRfVY5o4hgcqjIDwZaKT9uhrtwiatTS0nzj4KVUKN2Ag/ZbAaF2mM8jXRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398013; c=relaxed/simple;
	bh=bffxLdvM+WaBiTtq7V4HtUSuVCZ6aTFISgQjb7PLCjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c+X+j8rHwBfdnLIH3cPJXo+DAXpdM8AsvN/esxb73lf/T6s6nzgQTwQ+67A3jtietId8lbC0+4Dei5L7E4ThM58YiK3pPNLXlExTa/axAF0gT3H91jZDEydCDlX6IhLvxFTerS7eGNO/9u7Q27wBBWoqX9dj1ffOvhnYrjfoS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noM8ookT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE9D9C4CEF1;
	Wed, 10 Dec 2025 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765398012;
	bh=bffxLdvM+WaBiTtq7V4HtUSuVCZ6aTFISgQjb7PLCjI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=noM8ookT/87XkX205fdaTKasn3PunJvYkLDVRerAAo4yK6STorPOfbR47yeVvTqFx
	 F6fTfFyxsnKEGhWqlgwhRobttrmX1DOtf9pL2eYp2bpjaLIxJFF1+c0wrM61SS1ttc
	 WgWCfS94Q4GIwGXzk14BZyLRCX3dNbrkJ1nL1A7vGsewZtDFWbYxj+8IP8GW8UvMVD
	 tqnWOGMsItFGTzRZ1dilyOl2Q9Zlu8YFUYfuysspdRV52h/XmNKroD8242F+LupRck
	 RxUsfPUNs8d886Ycdg6I0fuTpNyQSJv3wBnFul1PcXhgSzNM5R/TfEXy4/OxhnV73v
	 gm63ieNcKk7Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20F3D3B9AB;
	Wed, 10 Dec 2025 20:20:12 +0000 (UTC)
From: Alessandro Di Chiara via B4 Relay <devnull+alessandro.dichiara.se.com@kernel.org>
Date: Wed, 10 Dec 2025 21:19:59 +0100
Subject: [PATCH] rtc: pcf2127: clear the PWRMNG bits for pcf2131
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rtc-pcf2131-clear-pwrmng-bits-v1-1-407c1c573726@se.com>
X-B4-Tracking: v=1; b=H4sIAO7VOWkC/x2O2wrCMBAFf6Xk2YVckIK/IlI266YJ2DRsUhVK/
 93Ux4E5w9lVZUlc1W3YlfA71bTmDuYyKIqYZ4b07KystldjjQZpBIWCNc4AvRgFykeWPINPrYL
 V5ByGcbSGVG94rAxeMFM8K308FWwUp7ZOW6lNGJfTK8Ihff8/7o/j+AHD5V3blwAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alessandro Di Chiara <alessandro.dichiara@se.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765398011; l=1668;
 i=alessandro.dichiara@se.com; s=20251210; h=from:subject:message-id;
 bh=sdtnNaboWuo63u4CZWW9IBzWMWcDmWRWx8WFWRzaWEg=;
 b=UDvSzXBS9AYvzB8XJPf1w/I9KpG8bg18/NZGwLqttQMaro2jyNx7ktq912m1XquugeWfnAvj3
 VpeB9v36MVrBUi2JqDPwP6Ku2aosnlwExRGoVOBpiDGQaIiGi88xrob
X-Developer-Key: i=alessandro.dichiara@se.com; a=ed25519;
 pk=u2B6IoaKeBzT34cbldBoNPmpikSV4O5zEn0xUxy5vlM=
X-Endpoint-Received: by B4 Relay for alessandro.dichiara@se.com/20251210
 with auth_id=575
X-Original-From: Alessandro Di Chiara <alessandro.dichiara@se.com>
Reply-To: alessandro.dichiara@se.com

From: Alessandro Di Chiara <alessandro.dichiara@se.com>

The pcf2131 does not retain the date by default. This is because the
reset value of the PWRMNG bits is 111, which is different from the
pcf2127/pcf2129, whose reset value is 000.

To keep consistency with the other rtc handled by the driver,
clear the PWRMNG bits for pcf2131 to enable:
	- Battery switch-over function in standard mode.
	- Battery low detection function.

Signed-off-by: Alessandro Di Chiara <alessandro.dichiara@se.com>
---
Hi,

this patch enables battery switch-over and low detection functions for
the rtc pcf2131.

Tested only with pcf2131.
---
 drivers/rtc/rtc-pcf2127.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index bb4fe81d3d62..c6ea679645f2 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1329,8 +1329,11 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	 * Clear battery interrupt flags which can block new trigger events.
 	 * Note: This is the default chip behaviour but added to ensure
 	 * correct tamper timestamp and interrupt function.
+	 * For pcf2131, clear the PWRMNG bits[7:5] because the reset value
+	 * is 111, which is different from 2127/2129.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 (pcf2127->cfg->type == PCF2131 ? PCF2127_CTRL3_PM : 0) |
 				 PCF2127_BIT_CTRL3_BTSE |
 				 PCF2127_BIT_CTRL3_BIE |
 				 PCF2127_BIT_CTRL3_BLIE, 0);

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251210-rtc-pcf2131-clear-pwrmng-bits-20c33af7721c

Best regards,
-- 
Alessandro Di Chiara <alessandro.dichiara@se.com>



