Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AD11A486D
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgDJQ1i (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:38 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:32816 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDJQ1i (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536058; x=1618072058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=kx75iRvDXLZZ7RnWClLIBFKi8jslmQjHPxpu6/ocCjE=;
  b=rrtOUWdzWmwuT1l3fXvpUk9CXwa2b7GnQ6DBXst37rMtSvBOcsdVf9cS
   J6gJbieEV5p0UVFihI/igiGLrWOfN3h/oQQSuw6pLaNfYi0+9LaSjV2DI
   c6nm+FW4w8v2spx8oEIKWCfj06aGECnECJ0vsLL2znpu8O3TUJZCFH08r
   Hbo4rD4IF4QFTt0LC4cYKRBNKZeOYPDqXaRXw4u7+bWopGhx4TPl5/CZw
   xj/dRSqaW6sWhHZHjFrSiVnm3SuQP0CJtvgnvnKxfemsrhB2alPSVPhMY
   s99DF84NqRFivgl8Lc8OPjvsiefRtYvF+4g6LQpYbHWm68zjUEH45gZ+f
   Q==;
IronPort-SDR: jqiqMXLojVGL5cI4ia8zCf/yYim18pgHzQB/iiiFP2Y5KUHJ84XGClzAUxjq23sTjVdt5UaPxe
 F4jwGqvsb7njT0873SD0AfZdC/ALOyFB+iQo9XQLmgmbfcFq2aqN3V2x9eQl/fMo17yCN3m4X7
 SXl8ChBoC9+EObz4hq5cf0igY7Tx9RGp4fivzichSqeCdRhcB7RULRFn25hLDmW+HKOO5y039N
 EovJV4YYeqM9PlF1cTE6Ft67pQnXf7XyJGvy1bpky1WCrtf/uZi8V37wa9o1tH/Lk476VzgQ2Y
 5cM=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="71870918"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:48 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:28 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 2/5] rtc: at91sam9: enable driver for sam9x60
Date:   Fri, 10 Apr 2020 19:26:56 +0300
Message-ID: <1586536019-12348-3-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enable driver for SAM9X60.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/rtc/rtc-at91sam9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index e39e89867d29..cb0a8f4a73a4 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -525,6 +525,7 @@ static SIMPLE_DEV_PM_OPS(at91_rtc_pm_ops, at91_rtc_suspend, at91_rtc_resume);
 
 static const struct of_device_id at91_rtc_dt_ids[] = {
 	{ .compatible = "atmel,at91sam9260-rtt" },
+	{ .compatible = "microchip,sam9x60-rtt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, at91_rtc_dt_ids);
-- 
2.7.4

