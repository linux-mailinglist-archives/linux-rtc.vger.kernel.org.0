Return-Path: <linux-rtc+bounces-5853-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBkbHAwedmn2LwEAu9opvQ
	(envelope-from <linux-rtc+bounces-5853-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:43:40 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696280C53
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2829430038F4
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A5D3242B1;
	Sun, 25 Jan 2026 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOBNufn0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC531ED75
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348597; cv=none; b=cksVvp29IPTOST2k5unRkGut+LLZ8YLKgq+AGMaD/nAglcGXyFvmwYVg+yeMF0dU0k9IMikim7ShFJEKt3gg3p4v5hsdxr31gS11CDRmTyJUA4PD566kx7aLt/ol3ctylxoW8ZRstooeIMxNdGH/zu591yXGgLXq5R3y58yJVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348597; c=relaxed/simple;
	bh=VETBKA/LicLhvxo3GDTFFZeramOE24a0Fbvse+ZL4bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEQrgXvGDImk9g2iS6KsPqHqrEV82djGp0wXKY9w7WHZ5JskjOHmg2LVQ+MAwDc2inzeTLDPf/mAufkqz5agUgPPmULSVw9WVvpjuDG0Dh6iz3o6rXgUAchtBwi1RhPkFmWBiGhuOHYIt+QOv3i5JBN8ceyAoO0TeqUC3NCazfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOBNufn0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480142406b3so24546645e9.1
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 05:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348594; x=1769953394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcQpCRhkG0051Y4f6+2Qr1RKJ7Ve1KMljhn3+VzhWfM=;
        b=EOBNufn0LiItRaVbjXscFSgS84svlY6M6gaSFq7fpfZaOwR46JrPBuYX799TWG6JVn
         upLdHRAyMfdQoMqXjZsW+PT8JF+IgO6jr5KLV62/ViI+pQ30zbe2YGrxI5nOJQv3Y3Xb
         8R+qBxJprmbHnPvMWVcN5mHMIBrwd9ATu1Oz2umE/Y3U8OhaLkwi7XMbzv11yMPb1Pcy
         FHHbKAV5R21nOWYLXb1fnv88X+LqOsDsdVcYxZorZ4N8D8T+0CyQX5VGciSXGPLV5DLy
         iq+UFqzFH189iGttdJLPFrV8hEESZjp6WMUUJ1Konf2l9K8ECLw44CzMOgm7HNGRCFiI
         MCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348594; x=1769953394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcQpCRhkG0051Y4f6+2Qr1RKJ7Ve1KMljhn3+VzhWfM=;
        b=q4aVSMDsoRhWm0h0nqV2Wc/g19ESRTvkp9zUw6vhe3o+x6i/9Bj7jRiKSGyQ9EqYRW
         6qWiIhO7A9kDwMguLFG6nlA82qX6bVgeyPVNc4htaNZsB2I7MQuzTzSD9aLhgaj/m8jY
         5lTVvlO4BN8m3BhOenmj8NdIPlG4nOBZGwgbes6FBeE56bNzU6mPGdEdjG8lbwEqZmFI
         4MMbSTBgqCkZN3a1CReTarhn52tdezxiE2mK4UEwQrNXukIUlarkCzT4uEqGrUo+970D
         G5JXO9auHd9la8a/TgEJ/t4lP/bTqqH2GU+3WtZHWwSmVDqJb5QKhilhThUhmRs14vTu
         EJwg==
X-Forwarded-Encrypted: i=1; AJvYcCUvcmht46bW8TTHeUevQTCwRe+4dPJKIres5fqyiSkf32OOA16ByHvLjuKl34JjNa71Ks8yvfgWU4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wKXMFEvBrJcT1ZxDJ8B4HR+sRSHoVqaRGzyfbf1gLaNNnbIz
	9Pa/OPv4nubrrq0KEi2udSkjzDAXGUi66t4D6AqxlxYgCGdPZ3BBss+r
X-Gm-Gg: AZuq6aI/yKUCZKiRyzJxRWrM2AiyNGX4ldyJ84o254Y+ltTQX4YCPHksL3/5Ex9QpN2
	aIJuJImw7wtcqx06YfbvEmuNuJg0iFdCME65sRAtgdNTjOQAE5RFzG6swMPS6bvrDbWT5kVMLmU
	nUVVGolZYkvURHJWkB7oU6HX+heJGMmtwhJELzHEXdI/6wQWPk7fmIWpEiKkC4hEf8oDbhP2Xzm
	366UpFmf2IFaLDj/ukdkgLQ5VWHg/yMqCsjWwYdhy2iX3ZMmdnJQBSrB3YAlXQ0iESQeCWEGIgA
	lDVmEs8THhu9VhAw6UGdMYC+OVoBfGVJGs+ptkiKjCWPjN+ag29FVxhp/nQ9qOOGQRg6HRfhaly
	+sA7+vCLtp4ptzvsmOgNugY1VVbaAecIwrYlClQvivGjr3JY2SjrtDURJ4XMw1tDtOVqgE+60Fz
	DY
X-Received: by 2002:a05:600c:1f8f:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-4805cf672c6mr27723325e9.28.1769348593815;
        Sun, 25 Jan 2026 05:43:13 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:13 -0800 (PST)
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
Subject: [PATCH v1 02/10] regulator: cpcap-regulator: add support for Mot regulators
Date: Sun, 25 Jan 2026 15:42:54 +0200
Message-ID: <20260125134302.45958-3-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-5853-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: 2696280C53
X-Rspamd-Action: no action

Add support for regulator set used in Motorola Mot board, used as a base
for Atrix 4G and Droid X2 smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/cpcap-regulator.c | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/regulator/cpcap-regulator.c b/drivers/regulator/cpcap-regulator.c
index 6958d154442b..33307c6340b8 100644
--- a/drivers/regulator/cpcap-regulator.c
+++ b/drivers/regulator/cpcap-regulator.c
@@ -261,6 +261,30 @@ static const struct regulator_ops cpcap_regulator_ops = {
 };
 
 static const unsigned int unknown_val_tbl[] = { 0, };
+static const unsigned int sw_mot_val_tbl[] =  { 600000, 612500, 625000,
+						637500, 650000, 662500,
+						675000, 687500, 700000,
+						712500, 725000, 737500,
+						750000, 762500, 775000,
+						787500, 800000, 812500,
+						825000, 837500, 850000,
+						862500, 875000, 887500,
+						900000, 912500, 925000,
+						937500, 950000, 962500,
+						975000, 987500, 1000000,
+						1012500, 1025000, 1037500,
+						1050000, 1062500, 1075000,
+						1087500, 1100000, 1112500,
+						1125000, 1137500, 1150000,
+						1162500, 1175000, 1187500,
+						1200000, 1212500, 1225000,
+						1237500, 1250000, 1262500,
+						1275000, 1287500, 1300000,
+						1312500, 1325000, 1337500,
+						1350000, 1362500, 1375000,
+						1387500, 1400000, 1412500,
+						1425000, 1437500, 1450000,
+						1462500, 1475000, };
 static const unsigned int sw2_sw4_val_tbl[] = { 612500, 625000, 637500,
 						650000, 662500, 675000,
 						687500, 700000, 712500,
@@ -284,6 +308,7 @@ static const unsigned int sw2_sw4_val_tbl[] = { 612500, 625000, 637500,
 						1362500, 1375000, 1387500,
 						1400000, 1412500, 1425000,
 						1437500, 1450000, 1462500, };
+static const unsigned int sw3_val_tbl[] = { 1350000, 1800000, 1850000, 1875000, };
 static const unsigned int sw5_val_tbl[] = { 0, 5050000, };
 static const unsigned int vcam_val_tbl[] = { 2600000, 2700000, 2800000,
 					     2900000, };
@@ -402,6 +427,82 @@ static const struct cpcap_regulator omap4_regulators[] = {
 	{ /* sentinel */ },
 };
 
+static const struct cpcap_regulator mot_regulators[] = {
+	CPCAP_REG(SW1, CPCAP_REG_S1C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW1_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x6800, 0, 0),
+	CPCAP_REG(SW2, CPCAP_REG_S2C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW2_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x4804, 0, 0),
+	CPCAP_REG(SW3, CPCAP_REG_S3C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW3_SEL, sw3_val_tbl,
+		  0x578, 0x3, 0x043c, 0, 0),
+	CPCAP_REG(SW4, CPCAP_REG_S4C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW4_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x4909, 0, 0),
+	CPCAP_REG(SW5, CPCAP_REG_S5C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW5_SEL, sw5_val_tbl,
+		  0x28, 0, 0x20, 0, 0),
+	CPCAP_REG(SW6, CPCAP_REG_S6C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW6_SEL, unknown_val_tbl,
+		  0, 0, 0, 0, 0),
+	CPCAP_REG(VCAM, CPCAP_REG_VCAMC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VCAM_SEL, vcam_val_tbl,
+		  0x87, 0x30, 0x7, 0, 420),
+	CPCAP_REG(VCSI, CPCAP_REG_VCSIC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VCSI_SEL, vcsi_val_tbl,
+		  0x47, 0x10, 0x7, 0, 350),
+	CPCAP_REG(VDAC, CPCAP_REG_VDACC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VDAC_SEL, vdac_val_tbl,
+		  0x87, 0x30, 0x0, 0, 420),
+	CPCAP_REG(VDIG, CPCAP_REG_VDIGC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VDIG_SEL, vdig_val_tbl,
+		  0x87, 0x30, 0x0, 0, 420),
+	CPCAP_REG(VFUSE, CPCAP_REG_VFUSEC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VFUSE_SEL, vfuse_val_tbl,
+		  0xa0, 0xf, 0x0, 0, 420),
+	CPCAP_REG(VHVIO, CPCAP_REG_VHVIOC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VHVIO_SEL, vhvio_val_tbl,
+		  0x17, 0, 0x2, 0, 0),
+	CPCAP_REG(VSDIO, CPCAP_REG_VSDIOC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VSDIO_SEL, vsdio_val_tbl,
+		  0x87, 0x38, 0x2, 0, 420),
+	CPCAP_REG(VPLL, CPCAP_REG_VPLLC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VPLL_SEL, vpll_val_tbl,
+		  0x47, 0x18, 0x1, 0, 420),
+	CPCAP_REG(VRF1, CPCAP_REG_VRF1C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRF1_SEL, vrf1_val_tbl,
+		  0xac, 0x2, 0, 0, 10),
+	CPCAP_REG(VRF2, CPCAP_REG_VRF2C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRF2_SEL, vrf2_val_tbl,
+		  0x23, 0x8, 0, 0, 10),
+	CPCAP_REG(VRFREF, CPCAP_REG_VRFREFC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRFREF_SEL, vrfref_val_tbl,
+		  0x23, 0x8, 0, 0, 420),
+	CPCAP_REG(VWLAN1, CPCAP_REG_VWLAN1C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VWLAN1_SEL, vwlan1_val_tbl,
+		  0x47, 0x10, 0x5, 0, 420),
+	CPCAP_REG(VWLAN2, CPCAP_REG_VWLAN2C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VWLAN2_SEL, vwlan2_val_tbl,
+		  0x20c, 0xc0, 0xd, 0, 420),
+	CPCAP_REG(VSIM, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
+		  0xffff, vsim_val_tbl,
+		  0x23, 0x8, 0, 0, 420),
+	CPCAP_REG(VSIMCARD, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
+		  0xffff, vsimcard_val_tbl,
+		  0x1e80, 0x8, 0x1e00, 0, 420),
+	CPCAP_REG(VVIB, CPCAP_REG_VVIBC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VVIB_SEL, vvib_val_tbl,
+		  0x1, 0xc, 0x1, 0, 500),
+	CPCAP_REG(VUSB, CPCAP_REG_VUSBC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VUSB_SEL, vusb_val_tbl,
+		  0x11c, 0x40, 0xc, 0, 0),
+	CPCAP_REG(VAUDIO, CPCAP_REG_VAUDIOC, CPCAP_REG_ASSIGN4,
+		  CPCAP_BIT_VAUDIO_SEL, vaudio_val_tbl,
+		  0x16, 0x1, 0x5, 0, 0),
+	{ /* sentinel */ },
+};
+
 static const struct cpcap_regulator xoom_regulators[] = {
 	CPCAP_REG(SW1, CPCAP_REG_S1C1, CPCAP_REG_ASSIGN2,
 		  CPCAP_BIT_SW1_SEL, unknown_val_tbl,
@@ -486,6 +587,10 @@ static const struct of_device_id cpcap_regulator_id_table[] = {
 		.compatible = "motorola,mapphone-cpcap-regulator",
 		.data = omap4_regulators,
 	},
+	{
+		.compatible = "motorola,mot-cpcap-regulator",
+		.data = mot_regulators,
+	},
 	{
 		.compatible = "motorola,xoom-cpcap-regulator",
 		.data = xoom_regulators,
-- 
2.51.0


