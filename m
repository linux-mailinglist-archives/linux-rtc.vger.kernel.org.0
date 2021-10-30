Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1440440C33
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Oct 2021 00:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhJ3Wxj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 18:53:39 -0400
Received: from smtp2.axis.com ([195.60.68.18]:25911 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232023AbhJ3Wxi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 18:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635634268;
  x=1667170268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FxzIM7aRQ1IIVWNEna6Vt8eW8kPVS2+apV86vv6FcV8=;
  b=I8NTaNcWITmBmvrmL9l5QVtqqJeeWrrrRZ56zz2mRZcrJi5gYoABCeE0
   0d+2MfBH497chmJFhKcKifKRIgOjS/IQPBlXTz3BMKtBeuAtjqfjaovqA
   86yhitAArG21KeRqXNAZIHefQnwJDkVZx3qVI4vDMk+ctqHw5f6w/MpK4
   SZcHFrH3sbNrpvGEHWkTnNRjqRt27Av5uOdifr3jcgAS1DkQfITAiopDO
   AWdEKeDbf1CPgB+QzeDnOEapMa3LqPuhmZDCxKtygI8LqkbDuYxSQYYW9
   Pkf2l2xgx6jwd542OuBQmk8/ZzVrstnesFCj970oZh+LjB2HxJOw1myll
   w==;
From:   Pavel Modilaynen <pavel.modilaynen@axis.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lkml@axis.com>, <kernel@axis.com>,
        "Pavel Modilaynen" <pavelmn@axis.com>
Subject: [PATCH 1/2] rtc: rs5c372: Add support for trim configuration
Date:   Sun, 31 Oct 2021 00:50:53 +0200
Message-ID: <20211030225054.32114-2-pavel.modilaynen@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211030225054.32114-1-pavel.modilaynen@axis.com>
References: <20211030225054.32114-1-pavel.modilaynen@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Pavel Modilaynen <pavelmn@axis.com>

Add support for oscillation adjustment register RS5C372_REG_TRIM
setting that is needed to accommodate for effective crystal
capacitance.

Use optional property ricoh,trim that should contain
raw value to setup this register. According to
datasheets for RS5C372, R2025S/D, RV5C38[67] and R222[13]
the value will be converted to a number of ticks that
is to be subtracted or added when the second digits read
00, 20 or 40 seconds.

Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
---
 drivers/rtc/rtc-rs5c372.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 80980414890c..3a2db0326669 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of.h>
 
 /*
  * Ricoh has a family of I2C based RTCs, which differ only slightly from
@@ -560,6 +561,8 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
 {
 	unsigned char buf[2];
 	int addr, i, ret = 0;
+	struct i2c_client *client = rs5c372->client;
+	u8 trim = 0;
 
 	addr   = RS5C_ADDR(RS5C_REG_CTRL1);
 	buf[0] = rs5c372->regs[RS5C_REG_CTRL1];
@@ -599,9 +602,22 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
 		break;
 	}
 
+	/* optional setup of xtal trimming */
+	if (!of_property_read_u8(client->dev.of_node, "ricoh,trim", &trim)) {
+		if (rs5c372->type != rtc_r2221tl && (trim & ~RS5C372_TRIM_MASK)) {
+			dev_warn(&client->dev, "Erroneous setting for ricoh,trim in devicetree\n");
+		} else {
+			int addr = RS5C_ADDR(RS5C372_REG_TRIM);
+			int ret = i2c_smbus_write_byte_data(client, addr, trim);
+
+			if (unlikely(ret < 0))
+				return ret;
+		}
+	}
+
 	for (i = 0; i < sizeof(buf); i++) {
 		addr = RS5C_ADDR(RS5C_REG_CTRL1 + i);
-		ret = i2c_smbus_write_byte_data(rs5c372->client, addr, buf[i]);
+		ret = i2c_smbus_write_byte_data(client, addr, buf[i]);
 		if (unlikely(ret < 0))
 			return ret;
 	}
-- 
2.20.1

