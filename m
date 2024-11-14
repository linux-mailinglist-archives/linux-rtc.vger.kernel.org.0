Return-Path: <linux-rtc+bounces-2557-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62C9C8543
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 09:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2338A1F2145C
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED40D1E8822;
	Thu, 14 Nov 2024 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ebfc/jk3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EE198E84;
	Thu, 14 Nov 2024 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574318; cv=none; b=pVPrXl8xwKEPlzEdKOYsQIkXxcVLBLjRQR/3Iv/X4kiuPpF0gWIomRt8sXxm8zzZWiLGK1dXjhJL6wMgS+A0QK7WtVu/ZTBpVVxCfE4O3MvZZM/ZFMs+9oS1hzSfCmL64WAocE3umT01RaNPmbSyYbH8x9NJ/Ykms9cN93DRE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574318; c=relaxed/simple;
	bh=LcBAxAZAX37uBPCEepx0YxjDpWR0wCPmVubA/HyGtUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9jdaoZY7A6i4Anjf+dnIUpiwrI4CZFlQJmG50MyyzOrBMWPBK4+s2+zP6iDWA844z2qsnArUb1ap8JCIeejyPeHIncK4Up3U6VCfak7hewqHNoBFUhINRFNOVCQYL6c4OJFkG1guLgjOF6h1w7x5IXv5yv90EHaN5HkdFRUvq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ebfc/jk3; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDE941BF20C;
	Thu, 14 Nov 2024 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731574314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1HiNHG2D/g4kWwQyOFwdXskLa10Ajy4fAeLl0rHlWQg=;
	b=Ebfc/jk3kQpDApG7oMCN1lYf9XP+E+p/16H79+rUME1nmHzVZZIqMY4Wr6g2Hwd35yaCa8
	A3i53EJpyOXj3ELVHAwHYi+/LjnJBviH3Kv81HB2olb+NR7GBWFAEhCNaX4GyG5i/tgE7j
	q1H6FgqO+l5eR7csXFhSutjDl/mMTdnINKI7DECYslEgI8pR0G5SS2Kr76jQ+WbSGFJC1T
	VJIaOV2IVmsH7IgZNuBuomb/T08Jg8QYzz5KT6wyHiTbdbQj7aE/eblxqK/mjBeUs0uKlI
	/Fx7PUuK9FTGhVKUZ2TRxvtZ+pJw4eX2YS/JvpfDe4APapKHISfo1rEmqT0XYw==
Date: Thu, 14 Nov 2024 09:51:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Thomas =?iso-8859-1?Q?B=F6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v3 0/2] rtc: pcf2127: make battery switch-over
 configurable
Message-ID: <20241114085153e4e23a7f@mail.local>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111154144.163604-1-p.rosenberger@kunbus.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 11/11/2024 16:41:42+0100, Philipp Rosenberger wrote:
> Hello,
> 
> This patch series adds the nxp,battery-backed device tree property to the
> PCF2127 RTC driver. This flag indicates if the RTC is battery-backed, allowing
> the driver to enable the battery switchover function if necessary.
> 
> Background
> ----------
> The PCF2127 RTC driver currently supports the PCF2127, PCA2129, PCF2129, and
> PCF2131 devices. Among these, only the newer PCF2131 has a different default
> behavior for battery switchover: it is disabled by default, whereas it is
> enabled on the other devices. If there is no firmware or bootloader setting
> to enable battery switchover on the PCF2131, it will not automatically switch
> to battery power, even if a battery is attached.
> 
> An alternative approach would be to enable battery switchover by default on
> the PCF2131 without requiring a device tree property. However, this could be
> undesirable, as it would make it impossible to disable battery
> switchover.
> 

This has been discussed multiple times in the past, we can't have a DT
property for this as we need to be able to change it at runtime. There
is already a userspace interface to do this.

Below is my current patch for this that has been tested on pcf2127. I
didn't send it yet because we are losing information when switching from
standard or direct mode to disabled because when BSM is disabled, there
is no configuration where battery low detection function is enabled so
going from disabled to standard or direct will keep BLD disabled.

8<--------------------------------------------------------------------

From 7db70b33c3939a0ebe147c32f406b34a2f5f1be8 Mon Sep 17 00:00:00 2001
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 24 Feb 2024 19:58:20 +0100
Subject: [PATCH] rtc: pcf2127: add BSM support

The pcf2127 encodes BSM, BLD and power fail detection in the same set of
bits so it is necessary to do some calculation when changing BSM to keep
the rest of the configuration as-is. However, when BSM is disabled, there
is no configuration with BLD enabled so this will be lost when coming back
to a mode with BSM enabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..a7f73192d53d 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -48,6 +48,7 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_CTRL3_PM			GENMASK(7, 5)
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE		0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -331,6 +332,84 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+		if (value < 0x3)
+			param->uvalue = RTC_BSM_LEVEL;
+		else if (value < 0x6)
+			param->uvalue = RTC_BSM_DIRECT;
+		else
+			param->uvalue = RTC_BSM_DISABLED;
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	u8 mode = 0;
+	u32 value;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+		if (value > 5)
+			value -= 5;
+		else if (value > 2)
+			value -= 3;
+
+		switch (param->uvalue) {
+		case RTC_BSM_LEVEL:
+			break;
+		case RTC_BSM_DIRECT:
+			mode = 3;
+			break;
+		case RTC_BSM_DISABLED:
+			if (value == 0)
+				value = 1;
+			mode = 5;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+					  PCF2127_CTRL3_PM,
+					  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
 {
@@ -741,6 +820,8 @@ static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.read_alarm       = pcf2127_rtc_read_alarm,
 	.set_alarm        = pcf2127_rtc_set_alarm,
 	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+	.param_get        = pcf2127_param_get,
+	.param_set        = pcf2127_param_set,
 };
 
 /* sysfs interface */
-- 
2.47.0



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

