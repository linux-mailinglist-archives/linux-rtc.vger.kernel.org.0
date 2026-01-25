Return-Path: <linux-rtc+bounces-5858-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKXMAYAedmkoMAEAu9opvQ
	(envelope-from <linux-rtc+bounces-5858-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:45:36 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737CB80D07
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3584C302737A
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E73326938;
	Sun, 25 Jan 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGliBi65"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93255323416
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348607; cv=none; b=Un0tEjjos28EgAn2g+OzMbr9EWTqrfwU4lQBGzAq5hmesMuWJQFX4BG6aLFnBfq/ue8yO2TptMP4AC4KsrEG3dc5jfpsrMYtC0paqYIKsrM4MCAqJXI/dS5Bthxp1qcC+fCJ3QSzIMfZxLUahI7ElNBHBL7Ko2kbB8evna+5UIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348607; c=relaxed/simple;
	bh=UpT9w/j7zvETDPr3pit94FmYLQ42Xbc6IpVqIuRWkm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcTHexylCLLbS6I2SQgY5hTrLolbWUSwx0+2+TYRQ6WDO7oF3lFAYBzVpKTax0pMTbLxnPTqev9dOYzcvXsiTEivdtE9RmA1XlLcQ59yHuWsRbrFXOTDxmBwaOUBtGyxQKN/G2OH7vl3tSWDfOWcadcfMrYZ2FcTv0lOg3DDgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGliBi65; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435a11957f6so3055609f8f.0
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348604; x=1769953404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee1LhLt59IQBOhKFGdg8xp5N7suKg45Yt/yHFoSdDPo=;
        b=PGliBi65kNX3NrDkikj9jo1gtjw1tZ49ragVXBs7VKYRH/yU0fsvsavM7itKgul1Zd
         Y9NoK0GQI78Ny4rm/FKNRZrLQ0lSlWTjszm08rf3oJ3hKOxscedMuq0/2ED8afHpBuuV
         jPvpl1N62K0NvrH1sYcNccDAn4KGcqOebMvZqVHo4McPwF6l3coYVddMsxi114dq7Ozj
         nRKP28J9dlq39Qzmn7UIeRc5ieVAoS6SLmKheXO4/evnDuTHztSssZFK2vu2E8Jmo8xA
         mhtVuNQWEiBlMXvMCAPdFrbsqk+6zoOnLcES/akk/MRu2c1C9oRv/ae/UwyJoPPX3qJ1
         TBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348604; x=1769953404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ee1LhLt59IQBOhKFGdg8xp5N7suKg45Yt/yHFoSdDPo=;
        b=t+ZcwmRXLekPOZGmzsKgC1pi30uIv391R6wlDlkFUBXHhez1aiEOhYwD8ofEA+ZtY5
         5L0ovaeVQorTdi7tOb/tXJlzbkB6PpxXcvO7R0dnLV+7Yml1yRs7Zf6TmF+S7ACdWnI4
         BvYmWx1Y+1WnPkaEix8PhpzouwSxvN3FzQxFItb2Cww2vpOjRWNSoyJFry5aUqsnwZI8
         6yAN6xrWuJKj2quBlo9GrCYbMnscmxcN/jipMDPFNJ46OkxtOB81ljPTErFNcKVC3cXD
         SW9F3IPZNYhNFf0Zu49ch0+UpvCx3NBWZYnz0U0q2y0l+bYD/6Ag4zXDrUchNm74e6T+
         Bbnw==
X-Forwarded-Encrypted: i=1; AJvYcCVuHJhxjJRiGN6vK1Zi7CpEIs0EyBl/e7PiJ1lXYn5QD33brMttd2Fh6+qCdkmMpVUGywi1xzInkXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6QXbVIxZBi82ieL0SsHSlpOsvQ7CDEFAT+nWeyDaC6frZj03K
	5KDhg+reyHucJh+ZGF89XejCUf1yd+DJKKZcD4BvoOutM1oGdp+7sdht
X-Gm-Gg: AZuq6aISbS0+uK3pMqpgRZ4EHhoXPXMgkau8KXnXzgtqJpsNMnKS5QeARGhYINGkK0D
	RuHIAOU8SgIjEWNcjx47c4jPPcdjig9GbrnEIRjv1xI7gBGz6wwEpkZ7nrhL6bNyDo+EFBjoqMF
	VooQtsgeQ1Vrvzabug3BzAWUrE8jZS96kBBN9yFLPk28XZzELQ8ghi3Gxma4PW4y7c9CiDVSPLP
	hYS/eZDeVuYvevGJ+exosm1F4vOob0y5ZeSMJPEB5ofa7YPBmiwI7a8W9c4xkxksLrb7XQDmYs9
	GKWUPVMIKqmrbu6Mes2VX0uXkZKU8So49ow/IQytKsCov6C/4bQdwb88YxFyiwZpwxV5EI/yLHN
	xA6jiimwwrKXUyd6uqQ78pIGLm0W2do2pKM+FRgRjDkZlOynRCAbLj+DSeKLb4OubYvETtOWC0i
	KnfJB4Ku7nvV0=
X-Received: by 2002:a5d:5849:0:b0:435:b020:30ab with SMTP id ffacd0b85a97d-435ca0fbbfemr3062531f8f.15.1769348603864;
        Sun, 25 Jan 2026 05:43:23 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 10/10] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Sun, 25 Jan 2026 15:43:02 +0200
Message-ID: <20260125134302.45958-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5858-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 737CB80D07
X-Rspamd-Action: no action

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index ebe525153c33..c475eef30f22 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -206,6 +206,7 @@ static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", },
 	{ .name = "6556002", },
 	{ .name = "mapphone-cpcap", },
+	{ .name = "mot-cpcap", },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
@@ -343,6 +344,49 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
 	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
+/*
+ * Mot has usb-phy and charger similar to one in mapphone, but
+ * since Mot is based on Tegra20 it is incompatible with existing
+ * implementation.
+ */
+static const struct mfd_cell cpcap_mot_mfd_devices[] = {
+	{
+		.name          = "cpcap_adc",
+		.of_compatible = "motorola,mot-cpcap-adc",
+	}, {
+		.name          = "cpcap_battery",
+		.of_compatible = "motorola,cpcap-battery",
+	}, {
+		.name          = "cpcap-regulator",
+		.of_compatible = "motorola,mot-cpcap-regulator",
+	}, {
+		.name          = "cpcap-rtc",
+		.of_compatible = "motorola,cpcap-rtc",
+	}, {
+		.name          = "cpcap-pwrbutton",
+		.of_compatible = "motorola,cpcap-pwrbutton",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 0,
+		.of_compatible = "motorola,cpcap-led-red",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 1,
+		.of_compatible = "motorola,cpcap-led-green",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 2,
+		.of_compatible = "motorola,cpcap-led-blue",
+	}, {
+		.name          = "cpcap-codec",
+	},
+};
+
+static const struct cpcap_chip_data cpcap_mot_data = {
+	.mfd_devices = cpcap_mot_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_mot_mfd_devices),
+};
+
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
@@ -398,6 +442,7 @@ static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
 	{ .compatible = "st,6556002", .data = &cpcap_default_data },
 	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
-- 
2.51.0


