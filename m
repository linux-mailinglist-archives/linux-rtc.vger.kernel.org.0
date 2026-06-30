Return-Path: <linux-rtc+bounces-6795-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZD4KFH8YRGrCoQoAu9opvQ
	(envelope-from <linux-rtc+bounces-6795-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:26:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE96E78C7
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=GvVU7mDn;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6795-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6795-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64A830FD9AF
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44CC3DEFF0;
	Tue, 30 Jun 2026 19:22:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825333C4B88
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 19:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847347; cv=none; b=YGFDjz4Ny08WaZRP5NWtdsA2k/MU3K+fhbcV03RPUPShvsW0ELCZ+EY8bZlVrp6ERlIbsGObje2b93k+VpPRm/v1odqtuecoG14nYz+vasF228MaJleKaAUzbLyNG7c44W8cqMYihFdSlZ5s7zJPKFnOtVWbIpz2aXhx2XZXRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847347; c=relaxed/simple;
	bh=M+XvosyzJ8TSi5AvxNpLv/Ixt1HoXNLEnKfRvMPN5ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCjaNRzeTVUa4MUOxyXXgfob9S/2TCWwZeqNtJ3BQ9ROJ1fF8bGKGEpnvRCHW3Dp/TsrTypMruTSWCry2D/3O9kJ3GJ6BSp+Ff5UtYMVbhTUuWJVjpAApEJatnDBiKc7GpbypuGVTcCBQDmULd2JodM1TVxji4TFA0uFxsaKQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=GvVU7mDn; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 193A124002A
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 21:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782847344; bh=T0kNAdohQK0MQTdo+yXKpflnXa9nQ4nl0a7dVhmSO+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=GvVU7mDnYiJwm4dh6e1K8dVkGBSPcwJ+7JPc0Y474VjoN/xMFYvwsc0yEC/uuBXIj
	 xI4gi1s18bChZmstkqeFW2kFK4DF8sLU4kJVqTlO22A5sJeeeN7UaG7H0w1TdPS+ZS
	 bfpf9XerX8MDsL+Uwzc/QabZgMWtZfkQXi2DE+erMH3xIIH0dsT/2FDs5+Nxw7HYGX
	 nCtQNrqwru2qPQYE21G7PzhDot2nDdqIbuIl4kWkiSHP4/SWsEqUy1R+sXxsuk+MGE
	 Ggs2LHLd6bPeN//vKNj40WEDL2FM0OrC4RgJi6QR1RvBHEVrwZetE5UnL8TRpkAwmc
	 6JjSeurk6KuAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gqY1p439Gz9rxD;
	Tue, 30 Jun 2026 21:22:22 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Tue, 30 Jun 2026 19:22:23 +0000
Subject: [PATCH 3/3] rtc: s35390a: make use of interrupt signal 1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rtc_s35390a_int1-v1-3-1b2239e16be2@posteo.de>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
In-Reply-To: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6288;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=M+XvosyzJ8TSi5AvxNpLv/Ixt1HoXNLEnKfRvMPN5ls=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqRBdq4r5I7SJGXtgvlz/5Jul6ZryOS+ycez+Om
 OAcJ7jMps+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakQXahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9KIJg//Wjr6jFrX3Divd6scYKyAGTe5H7gHahA
 HbTBV4KCNtsZzntGHb8FTIEq3Rh/hO2yF+cPVSCoVz/8ugjHHTe6Wk4kIrWHfIQM/kAska6q/qm
 gDVMLtoIUH3UXQL5ZDIiWcrzP5kTVRXykAZ4yTwtm8lh+TC+3A2Oz0946zAQL6RJnrhBM6n4kGO
 NL9LpOFXdoKd1Jfa15GaHz+Yj6g7y7yULG3FXPjEPjYLSwI2YPkX12Xpr2i40T36W/9f949wtxG
 VLLq89BqFj09LrshGHf+XQ1xIErTcGGmsHCsYppR10GdBiY5wpoZ+2xPHvQQ6VfGZCsCzYZ7o6N
 WrKThTKHNV56O5vpQv6VI1HDfQQ1Ai4Avo+MTxNlOxymDX6IeHsWvImuZVFS8O5goFGW6P4SeQw
 Im/8IrqZJl7eOV7WV96lMzP8DuLLNSYU9K4Fhi0Q8Jr6lp9ZTUi9B/RWZVJWKmx70N4Eqp97LgR
 djP6XH5HwFqtIC0eB2uWaMn+LRv3BxfVkLjN6ibCU4BOptQgD59PDeo+he3qrCRtYzsJKNoCJFv
 TIcyRzs0FTaVL9LpC/jO0kldfbwQheAKLF07Q0h3/3sG23WILFPof11OgCUiNH/uXfuo5neb+mG
 v2t8/2QzFZX9kiWLm6h2ZImN020Lk/NBXLVvKi8HUQwUcb5pLrI0=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6795-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,kleine-koenig.org,lunn.ch,gmail.com];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.probst@posteo.de,m:krzk@kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94CE96E78C7

If configured, use output pin for interrupt signal 1 for the wake alarm.

Successfully Tested on a Synology DS923+.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/rtc/rtc-s35390a.c | 61 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 4cfe7034c516..6875bf039cbf 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -12,11 +12,13 @@
 #include <linux/bcd.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <dt-bindings/rtc/s35390a.h>
 
 #define S35390A_CMD_STATUS1	0
 #define S35390A_CMD_STATUS2	1
 #define S35390A_CMD_TIME1	2
 #define S35390A_CMD_TIME2	3
+#define S35390A_CMD_INT1_REG1	4
 #define S35390A_CMD_INT2_REG1	5
 #define S35390A_CMD_FREE_REG    7
 
@@ -36,6 +38,7 @@
 #define S35390A_FLAG_POC	BIT(0)
 #define S35390A_FLAG_BLD	BIT(1)
 #define S35390A_FLAG_INT2	BIT(2)
+#define S35390A_FLAG_INT1	BIT(3)
 #define S35390A_FLAG_24H	BIT(6)
 #define S35390A_FLAG_RESET	BIT(7)
 
@@ -50,6 +53,14 @@
 #define S35390A_INT2_MODE_FREQ		BIT(3) /* INT2FE */
 #define S35390A_INT2_MODE_PMIN		(BIT(3) | BIT(2)) /* INT2FE | INT2ME */
 
+/* INT1 pin output mode */
+#define S35390A_INT1_MODE_MASK		0xE0
+#define S35390A_INT1_MODE_NOINTR	0x00
+#define S35390A_INT1_MODE_ALARM		BIT(5) /* INT1AE */
+#define S35390A_INT1_MODE_PMIN_EDG	BIT(6) /* INT1ME */
+#define S35390A_INT1_MODE_FREQ		BIT(7) /* INT1FE */
+#define S35390A_INT1_MODE_PMIN		(BIT(7) | BIT(6)) /* INT1FE | INT1ME */
+
 static const struct i2c_device_id s35390a_id[] = {
 	{ .name = "s35390a" },
 	{ }
@@ -65,6 +76,7 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 struct s35390a {
 	struct i2c_client *client[8];
 	int twentyfourhour;
+	bool wakealarm_use_int1;
 };
 
 static int s35390a_set_reg(struct s35390a *s35390a, int reg, u8  *buf, int len)
@@ -275,7 +287,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
 	u8 buf[3], sts = 0;
-	int err, i;
+	int err, i, reg;
 
 	dev_dbg(&client->dev, "%s: alm is secs=%d, mins=%d, hours=%d mday=%d, "\
 		"mon=%d, year=%d, wday=%d\n", __func__, alm->time.tm_sec,
@@ -293,9 +305,13 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 		return err;
 
 	if (alm->enabled)
-		sts = S35390A_INT2_MODE_ALARM;
+		sts = s35390a->wakealarm_use_int1
+			? S35390A_INT1_MODE_ALARM
+			: S35390A_INT2_MODE_ALARM;
 	else
-		sts = S35390A_INT2_MODE_NOINTR;
+		sts = s35390a->wakealarm_use_int1
+			? S35390A_INT1_MODE_NOINTR
+			: S35390A_INT2_MODE_NOINTR;
 
 	/* set interrupt mode*/
 	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
@@ -317,8 +333,11 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	for (i = 0; i < 3; ++i)
 		buf[i] = bitrev8(buf[i]);
 
-	err = s35390a_set_reg(s35390a, S35390A_CMD_INT2_REG1, buf,
-								sizeof(buf));
+	reg = s35390a->wakealarm_use_int1
+		? S35390A_CMD_INT1_REG1
+		: S35390A_CMD_INT2_REG1;
+
+	err = s35390a_set_reg(s35390a, reg, buf, sizeof(buf));
 
 	return err;
 }
@@ -328,13 +347,21 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
 	u8 buf[3], sts;
-	int i, err;
+	int i, err, reg, mask, mode;
 
 	err = s35390a_get_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
 	if (err < 0)
 		return err;
 
-	if ((sts & S35390A_INT2_MODE_MASK) != S35390A_INT2_MODE_ALARM) {
+	mask = s35390a->wakealarm_use_int1
+		? S35390A_INT1_MODE_MASK
+		: S35390A_INT2_MODE_MASK;
+
+	mode = s35390a->wakealarm_use_int1
+		? S35390A_INT1_MODE_ALARM
+		: S35390A_INT2_MODE_ALARM;
+
+	if ((sts & mask) != mode) {
 		/*
 		 * When the alarm isn't enabled, the register to configure
 		 * the alarm time isn't accessible.
@@ -345,7 +372,11 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 		alm->enabled = 1;
 	}
 
-	err = s35390a_get_reg(s35390a, S35390A_CMD_INT2_REG1, buf, sizeof(buf));
+	reg = s35390a->wakealarm_use_int1
+		? S35390A_CMD_INT1_REG1
+		: S35390A_CMD_INT2_REG1;
+
+	err = s35390a_get_reg(s35390a, reg, buf, sizeof(buf));
 	if (err < 0)
 		return err;
 
@@ -437,10 +468,10 @@ static int s35390a_nvmem_write(void *priv, unsigned int offset, void *val,
 static int s35390a_probe(struct i2c_client *client)
 {
 	int err, err_read;
-	unsigned int i;
+	unsigned int i, wakealarm_output_pin = 0;
 	struct s35390a *s35390a;
 	struct rtc_device *rtc;
-	u8 buf, status1;
+	u8 buf, status1, flag;
 	struct device *dev = &client->dev;
 	struct nvmem_config nvmem_cfg = {
 		.name = "s35390a_nvram",
@@ -452,6 +483,9 @@ static int s35390a_probe(struct i2c_client *client)
 		.reg_write = s35390a_nvmem_write,
 	};
 
+	fwnode_property_read_u32(dev->fwnode, "sii,wakealarm-output-pin",
+				 &wakealarm_output_pin);
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
@@ -460,6 +494,7 @@ static int s35390a_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	s35390a->client[0] = client;
+	s35390a->wakealarm_use_int1 = wakealarm_output_pin == S35390A_OUTPUT_PIN_INT1;
 	i2c_set_clientdata(client, s35390a);
 
 	/* This chip uses multiple addresses, use dummy devices for them */
@@ -489,7 +524,9 @@ static int s35390a_probe(struct i2c_client *client)
 	else
 		s35390a->twentyfourhour = 0;
 
-	if (status1 & S35390A_FLAG_INT2) {
+	flag = s35390a->wakealarm_use_int1 ? S35390A_FLAG_INT1 : S35390A_FLAG_INT2;
+
+	if (status1 & flag) {
 		/* disable alarm (and maybe test mode) */
 		buf = 0;
 		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
@@ -514,7 +551,7 @@ static int s35390a_probe(struct i2c_client *client)
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
-	if (status1 & S35390A_FLAG_INT2)
+	if (status1 & flag)
 		rtc_update_irq(rtc, 1, RTC_AF);
 
 	nvmem_cfg.priv = s35390a;

-- 
2.54.0


