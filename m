Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA0B43D6B2
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Oct 2021 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhJ0Wh7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 18:37:59 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:57426 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhJ0Whz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 18:37:55 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 0C0E3F40CA3; Thu, 28 Oct 2021 00:35:23 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] rtc: gamecube: Report low battery as invalid data
Date:   Thu, 28 Oct 2021 00:35:12 +0200
Message-Id: <20211027223516.2031-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027223516.2031-1-linkmauve@linkmauve.fr>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I haven’t been able to test this patch as all of my consoles have a
working RTC battery, but according to the documentation it should work
like that.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/rtc/rtc-gamecube.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
index e8260c82c07d..1932c6fe1301 100644
--- a/drivers/rtc/rtc-gamecube.c
+++ b/drivers/rtc/rtc-gamecube.c
@@ -83,6 +83,10 @@
 #define RTC_CONTROL0	0x21000c
 #define RTC_CONTROL1	0x21000d
 
+/* RTC flags */
+#define RTC_CONTROL0_UNSTABLE_POWER	0x00000800
+#define RTC_CONTROL0_LOW_BATTERY	0x00000200
+
 struct priv {
 	struct regmap *regmap;
 	void __iomem *iob;
@@ -182,9 +186,35 @@ static int gamecube_rtc_set_time(struct device *dev, struct rtc_time *t)
 	return regmap_write(d->regmap, RTC_COUNTER, timestamp - d->rtc_bias);
 }
 
+static int gamecube_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct priv *d = dev_get_drvdata(dev);
+	int value;
+	int control0;
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = regmap_read(d->regmap, RTC_CONTROL0, &control0);
+		if (ret)
+			return ret;
+
+		value = 0;
+		if (control0 & RTC_CONTROL0_UNSTABLE_POWER)
+			value |= RTC_VL_DATA_INVALID;
+		if (control0 & RTC_CONTROL0_LOW_BATTERY)
+			value |= RTC_VL_DATA_INVALID;
+		return put_user(value, (unsigned int __user *)arg);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct rtc_class_ops gamecube_rtc_ops = {
 	.read_time	= gamecube_rtc_read_time,
 	.set_time	= gamecube_rtc_set_time,
+	.ioctl		= gamecube_rtc_ioctl,
 };
 
 static int gamecube_rtc_read_offset_from_sram(struct priv *d)
-- 
2.33.1

