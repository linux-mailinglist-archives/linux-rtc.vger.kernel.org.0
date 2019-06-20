Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9FB4D957
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 20:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfFTSer (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 14:34:47 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34989 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfFTSer (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 14:34:47 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D0407240005;
        Thu, 20 Jun 2019 18:34:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Dylan Howey <Dylan.Howey@tennantco.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/4] rtc: pcf2123: add proper compatible string
Date:   Thu, 20 Jun 2019 20:34:33 +0200
Message-Id: <20190620183433.30779-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
References: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
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
index f31feffed2d2..2ac016cb2af6 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -453,8 +453,10 @@ static int pcf2123_probe(struct spi_device *spi)
 
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

