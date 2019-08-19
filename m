Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FBF94CD6
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfHSS1E (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:04 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58737 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbfHSS1E (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:04 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B79441C0002;
        Mon, 19 Aug 2019 18:27:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 9/9] rtc: pcf2123: add proper compatible string
Date:   Mon, 19 Aug 2019 20:26:56 +0200
Message-Id: <20190819182656.29744-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
References: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

nxp,rtc-pcf2123 is not a proper compatible strong for this RTC. The part
name is only pcf2123 and is less confusing.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt | 4 ++--
 drivers/rtc/rtc-pcf2123.c                              | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt b/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
index 1994f601800a..7371f525a687 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
+++ b/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
@@ -1,7 +1,7 @@
 NXP PCF2123 SPI Real Time Clock
 
 Required properties:
-- compatible: should be: "nxp,rtc-pcf2123"
+- compatible: should be: "nxp,pcf2123"
                       or "microcrystal,rv2123"
 - reg: should be the SPI slave chipselect address
 
@@ -11,7 +11,7 @@ Optional properties:
 Example:
 
 pcf2123: rtc@3 {
-	compatible = "nxp,rtc-pcf2123"
+	compatible = "nxp,pcf2123"
 	reg = <3>
 	spi-cs-high;
 };
diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index bda4b1687318..c3691fa4210e 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -443,8 +443,10 @@ static int pcf2123_probe(struct spi_device *spi)
 
 #ifdef CONFIG_OF
 static const struct of_device_id pcf2123_dt_ids[] = {
-	{ .compatible = "nxp,rtc-pcf2123", },
+	{ .compatible = "nxp,pcf2123", },
 	{ .compatible = "microcrystal,rv2123", },
+	/* Deprecated, do not use */
+	{ .compatible = "nxp,rtc-pcf2123", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pcf2123_dt_ids);
-- 
2.21.0

