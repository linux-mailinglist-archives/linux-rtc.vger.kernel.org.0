Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B1417279D
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2020 19:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbgB0Sbq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Feb 2020 13:31:46 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:51256 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729169AbgB0Sbp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8SjkA7IjCSGUMcfzL6sRgrvmSd1UEQES9jRtvIHJjUo=; b=ikeq+xAP9lfBDtKGFrUYfx9qBZ
        Ufa+EkO2/tOOozira4f65iZ+IGAYNyDdadVB0U4LbKItdAMg9huqxg0iNSEcdhr6eW4qUX7LFOHJe
        UhXfgZG+r9rYKi/RfGX3ZKRX4ZwHBNWG6no5AVyzPgV4yquYduX4K9Z5ZZ4tKOvGc3AA=;
Received: from p200300ccff13fd00e2cec3fffe93fc31.dip0.t-ipconnect.de ([2003:cc:ff13:fd00:e2ce:c3ff:fe93:fc31] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j7Nwa-0006yr-6y; Thu, 27 Feb 2020 19:31:32 +0100
Received: from andi by eeepc with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j7NwZ-0003oa-LF; Thu, 27 Feb 2020 19:31:31 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org,
        jic23@kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v6 4/7] mfd: rn5t618: add more subdevices
Date:   Thu, 27 Feb 2020 19:31:09 +0100
Message-Id: <20200227183112.14512-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227183112.14512-1-andreas@kemnade.info>
References: <20200227183112.14512-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since the RC5T619 has a RTC, use a separate subdevice list for that.
The ADC should be the same as in the RN5T618, according to drivers
in the wild, but since it is not tested, the ADC is only added for
the RC5T619.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v6:
- squashed with patch from former ADC patchset

Changes in v3:
- alignment cleanup
 drivers/mfd/rn5t618.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 30fed9ab3d04..321836f78120 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/rn5t618.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 
@@ -22,6 +23,13 @@ static const struct mfd_cell rn5t618_cells[] = {
 	{ .name = "rn5t618-wdt" },
 };
 
+static const struct mfd_cell rc5t619_cells[] = {
+	{ .name = "rn5t618-adc" },
+	{ .name = "rn5t618-regulator" },
+	{ .name = "rc5t619-rtc" },
+	{ .name = "rn5t618-wdt" },
+};
+
 static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -174,8 +182,16 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
-				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
+	if (priv->variant == RC5T619)
+		ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE,
+					   rc5t619_cells,
+					   ARRAY_SIZE(rc5t619_cells),
+					   NULL, 0, NULL);
+	else
+		ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE,
+					   rn5t618_cells,
+					   ARRAY_SIZE(rn5t618_cells),
+					   NULL, 0, NULL);
 	if (ret) {
 		dev_err(&i2c->dev, "failed to add sub-devices: %d\n", ret);
 		return ret;
-- 
2.20.1

