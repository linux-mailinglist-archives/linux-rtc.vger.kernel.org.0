Return-Path: <linux-rtc+bounces-6348-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGTbCT2s4GkCkwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6348-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:30:37 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC540C61E
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B0CD315C2BE
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B66F39A077;
	Thu, 16 Apr 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="ad9Ktzz4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23772399375
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331474; cv=none; b=A3Hn53zDXnjrTJaAXb7s/7Dul2N6FHaJDCv88txCFIcrxXkEUYYbnlLzjnNCvbZsCN5MBReRVQ7y4stJ8/U/l0E6Gg/S8wrVh7AvaqhjMRL7785y4XjRsAPbHEhkkH0Mtavn1glQ+wXU3N+mOlKp3vwKX8uZN+vhohS+qUbnm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331474; c=relaxed/simple;
	bh=lpsJVVMGaMMep3FQ1HqvPEWk+behLL9g9H4dE1HgfXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQl/0joUCtbEYM3K1qWAfctE/mwAKcr7NaVyUVr4s/SskoVO1E44EZ7z4vc2dtmtwfy+ue1p5kEC4CP10w/AWMC7UpOv+3j4IPj+gOa7CG1R1Xa7nSFQxaL0gEAcUHbglh96wrce61ngLOr6dqaoS2dJg2ytNdtPnIKCM6QuuYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=ad9Ktzz4; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12736a0147cso596394c88.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776331471; x=1776936271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe0z97i7tkU8cjlRSgeT8EiRHH70cUTTYMxbnlOsLf8=;
        b=ad9Ktzz4QtydbqD00ELZka2jl4336M4sFJ2UWZcLr3g/yK2wwR9m0wcngU3N1SJbdl
         duyrXRRtjKZ9rkhUEK4diAmxOMvhE7N+3Cl3rRzTs3JFM7drvVo4QM+NHk7b3skKdt5T
         xkClmyJYkKf3LvUgRDOIvRKgyTMgQQZogJbAzGu28cyFGm6p9XwWgBzzST7Erc+BKPEb
         o8DUpToXCxH7/KCcs2HjfZS4Res9kmjMU6gOQ8/vLILhAh3tJb9EuuMYfGwXwQ5V1Vss
         zVFddqnxwTbBD/ZRg72UjJbIjWNMHp/RZNx+ZdI4JMY1fQSxwTrvC/ZzVEV6z4LSUMOC
         c7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331471; x=1776936271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qe0z97i7tkU8cjlRSgeT8EiRHH70cUTTYMxbnlOsLf8=;
        b=KJl49F4UfjUKMDo4DbQaZgjFMOwF39Clo7Oj8JmhrPQpnVfqriVqach0kXVrBtrHE8
         WkYMRq4qbceDsvl8+eJhDCnAgid334PkbXqVXXvoSicD8mXgVhSntk5C8ial9u2Xnhk+
         AZhFRZD29aoBa8WSqfUxZqLK6E12PN2APmYoWTkGBhBGpTJ/BvX4l+Fgx3IWG2WVDPdn
         c1TQHFEqxll+YYFPiEEV8ciN7+mpb0iXfsOd4RfggxhGF4D7b8DUDZsycLStKzQD/dWB
         CfWKEkouYLK1rPhuxYUZ73kCAhkyd6RLt/7++GJ03H4dzlZF2J8BZxZ2ut0a5dxlQ8+q
         i/gA==
X-Gm-Message-State: AOJu0YyYhYYQC5fvtewnqE+kiI/K7I2cX8DYmyc51eJ7NQQbC+P/ybnZ
	mCtxICFtVhv5i5pbZemgFtlOA3RZzMJPCTMMcF0EP+0rX9Rg6iaJRJytPxIczKEdDLkbNJlxH4V
	fQ8zqwMJw
X-Gm-Gg: AeBDieuXy8aFZBUiCSioCrbL+LKeJ4RTtWVqUjcUnVwK4U85+kuoEaMpPcIWrcyDTDp
	HBjDNzhyrtXmX7DEbMA0scHtu87hUtLgk5KIQVeS61qH1Mw7o4nmBLT5LV4CLxkzKJHLc/zBDf5
	xhj7j/dTwFyFM6436Rp9hbNAf9w71MHDV5XyArNixhgP+2K9KKD5hcH0olfXTQCWIT1mnP27Dpf
	+waDbUwQwHYESE4GvFngKOi/MqxFSdtqNI504jN47t3HGcxZzFTbRe+xpTt42KhZ5fqRi+lrFOv
	9xGpHoK59hitvfmK2R45cpAtZ5FjWkY3cjDhOkOTOcY7H59p8SGhM98XMuKYtJYDSdTSBUc5Tky
	1KI3oX2nHg5RA526W0n+KzAzSDCxkxLE3uVcSKmIouPBexCMwZ+NLhHKQw4P+wy6DZxd05a3e/f
	Ybh5oWux2zyGDY9N4aRGC3tuTuXUQbcDfRgfF/6fIJNUfRqLUN8ON5ieXyj6U=
X-Received: by 2002:a05:7300:f190:b0:2d5:eb89:4563 with SMTP id 5a478bee46e88-2e17d815c94mr377087eec.2.1776331470959;
        Thu, 16 Apr 2026 02:24:30 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm6423815eec.26.2026.04.16.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:24:30 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v1 2/2] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 02:24:14 -0700
Message-ID: <20260416092414.3210383-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6348-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arista.com:email,arista.com:dkim,arista.com:mid]
X-Rspamd-Queue-Id: 8ADC540C61E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the RTC is used on systems without a interrupt line, userspace
tools like `hwclock` fall back to a frequent polling loop to synchronize
with the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a configurable settle delay via `ti,read-settle-us`
property. If this property is specified, the driver uses a delay before
reading the RTC registers. This provides a sufficient idle time for the
hardware to sync with the register buffer.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 drivers/rtc/rtc-bq32k.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..0cbfa0909732 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #define BQ32K_SECONDS		0x00	/* Seconds register address */
 #define BQ32K_SECONDS_MASK	0x7F	/* Mask over seconds value */
@@ -48,6 +49,11 @@ struct bq32k_regs {
 	uint8_t		years;
 };
 
+struct bq32k_data {
+	struct rtc_device *rtc;
+	u32 read_delay_us;
+};
+
 static struct i2c_driver bq32k_driver;
 
 static int bq32k_read(struct device *dev, void *data, uint8_t off, uint8_t len)
@@ -89,9 +95,17 @@ static int bq32k_write(struct device *dev, void *data, uint8_t off, uint8_t len)
 
 static int bq32k_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct bq32k_data *bq32k = dev_get_drvdata(dev);
 	struct bq32k_regs regs;
 	int error;
 
+	/*
+	 * When the device doesn't have the interrupt connected, prevent
+	 * userpace from polling the RTC registers to frequently.
+	 */
+	if (bq32k && bq32k->read_delay_us)
+		usleep_range(bq32k->read_delay_us, bq32k->read_delay_us + 50);
+
 	error = bq32k_read(dev, &regs, 0, sizeof(regs));
 	if (error)
 		return error;
@@ -253,13 +267,18 @@ static void bq32k_sysfs_unregister(struct device *dev)
 static int bq32k_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct rtc_device *rtc;
+	struct bq32k_data *bq32k;
 	uint8_t reg;
 	int error;
+	uint32_t settle_us = 0;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
+	bq32k = devm_kzalloc(dev, sizeof(*bq32k), GFP_KERNEL);
+	if (!bq32k)
+		return -ENOMEM;
+
 	/* Check Oscillator Stop flag */
 	error = bq32k_read(dev, &reg, BQ32K_SECONDS, 1);
 	if (!error && (reg & BQ32K_STOP)) {
@@ -280,10 +299,13 @@ static int bq32k_probe(struct i2c_client *client)
 	if (client->dev.of_node)
 		trickle_charger_of_init(dev, client->dev.of_node);
 
-	rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
-						&bq32k_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
+	bq32k->rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
+					      &bq32k_rtc_ops, THIS_MODULE);
+	if (IS_ERR(bq32k->rtc))
+		return PTR_ERR(bq32k->rtc);
+
+	device_property_read_u32(dev, "ti,read-settle-us", &settle_us);
+	bq32k->read_delay_us = settle_us;
 
 	error = bq32k_sysfs_register(&client->dev);
 	if (error) {
@@ -293,7 +315,7 @@ static int bq32k_probe(struct i2c_client *client)
 	}
 
 
-	i2c_set_clientdata(client, rtc);
+	i2c_set_clientdata(client, bq32k);
 
 	return 0;
 }
-- 
2.51.0


