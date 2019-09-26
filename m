Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E5DBF2B5
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2019 14:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfIZMPi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 26 Sep 2019 08:15:38 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:17171 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfIZMPi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 26 Sep 2019 08:15:38 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 0TiS9fIcdcyV9inCyL6awYTBqCeAB47Y4vUBe6VSskTJHwuRiBvGgrPOuq17nKJvQ3vV9G5tpm
 eG7TTnxDdGBrMkjbXYsYishcE8/yKsvGEN9t3SfBQ+bQ83i/24RlIAIzWvjSjjBgUA/U7INWtY
 2Gv4gI/KUxz82u4HzHk9w3shhs4XnkllpU3lA0s6MwhDxgHrxfdblzPZaZqu9DZlg9tshkX3WJ
 JpWkpEYn+BqjExgzHmh28uVSMIKtHEHIg3IS+zfjfhaY2BIKZDhqPsw7Xkk0PY82uh0ztlXXpO
 2Uk=
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="50424041"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2019 05:15:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Sep 2019 05:15:36 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 26 Sep 2019 05:15:34 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] rtc: at91rm9200: use of_device_get_match_data()
Date:   Thu, 26 Sep 2019 15:15:32 +0300
Message-ID: <1569500132-21164-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use of_device_get_match_data() since all platforms should now use DT
bindings. AVR32 architecture has been removed in
commit 26202873bb51 ("avr32: remove support for AVR32 architecture").

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/rtc/Kconfig          |  1 +
 drivers/rtc/rtc-at91rm9200.c | 19 +------------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..d0b08b1ebcdf 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1433,6 +1433,7 @@ config RTC_DRV_PL031
 config RTC_DRV_AT91RM9200
 	tristate "AT91RM9200 or some AT91SAM9 RTC"
 	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	help
 	  Driver for the internal RTC (Realtime Clock) module found on
 	  Atmel AT91RM9200's and some  AT91SAM9 chips. On AT91SAM9 chips
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 82a54e93ff04..4dc413d07138 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -319,7 +319,6 @@ static const struct at91_rtc_config at91sam9x5_config = {
 	.use_shadow_imr	= true,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id at91_rtc_dt_ids[] = {
 	{
 		.compatible = "atmel,at91rm9200-rtc",
@@ -332,22 +331,6 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
 	}
 };
 MODULE_DEVICE_TABLE(of, at91_rtc_dt_ids);
-#endif
-
-static const struct at91_rtc_config *
-at91_rtc_get_config(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-
-	if (pdev->dev.of_node) {
-		match = of_match_node(at91_rtc_dt_ids, pdev->dev.of_node);
-		if (!match)
-			return NULL;
-		return (const struct at91_rtc_config *)match->data;
-	}
-
-	return &at91rm9200_config;
-}
 
 static const struct rtc_class_ops at91_rtc_ops = {
 	.read_time	= at91_rtc_readtime,
@@ -367,7 +350,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	struct resource *regs;
 	int ret = 0;
 
-	at91_rtc_config = at91_rtc_get_config(pdev);
+	at91_rtc_config = of_device_get_match_data(&pdev->dev);
 	if (!at91_rtc_config)
 		return -ENODEV;
 
-- 
2.7.4

