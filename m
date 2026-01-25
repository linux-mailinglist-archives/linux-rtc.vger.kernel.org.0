Return-Path: <linux-rtc+bounces-5855-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HIHGysedmn2LwEAu9opvQ
	(envelope-from <linux-rtc+bounces-5855-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:44:11 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E380CAD
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 14:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3947C3009560
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 13:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FC7324B2A;
	Sun, 25 Jan 2026 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQci+Dex"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F83246F4
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348600; cv=none; b=aM2Qr/jSYFRnCa9HSrZ3Ayu+Qv9yl4aS55Ueahp15C9pKdnvv88sTMm/o1kB/0dyD1SsLCEpdKMi7vsdmmDL77d52fAOCTwG/jHqJu3Lvc1Ws1Fj8X4+b1Wd00RS2EbtPZWyNr1xiPKqqz9ys90YotLgJhyaoQedgwgFzi/FfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348600; c=relaxed/simple;
	bh=DmGjedKkND/XSbjiuPXjmC36aaS/LlhmmKioOtF38hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eS/Kyy2J004hhryJCpQAlRE21elcFovIZrE3l2Gt4aD/mPp6ihH8QyWd+N27HnFEcwCK9UOQokJ1RUM1mS8ct7D2GMD6i7oAQDJtSbJuqIvXvpjAEbkPg1nLddXYKHIFPDnN8CSk2f4u8mXTCjtLIDRMCINDPqZEy9Lnm3U/y0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQci+Dex; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4805ef35864so1693515e9.0
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 05:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348596; x=1769953396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJR3t/I+dSBF7pxTKcEd0IpTH4h4FNjSSBlovFfwKo0=;
        b=CQci+Dex+S9w7gtUy3IvYfDMFYvAKmIoJPVEACFM6PZ+QPlDYtUCOTEpmcwTb8hXFw
         Ywre9l48mm4zMUqQ+zdcct6DwTFhOggKa+8EZopi3KmGUmv1gRK3RYwUzdEHYsS+3Jj8
         MCWtTL+P6ERRWixecUvPqIrK9LI8kkQVUBc9Wnq7Krd+IYkDmcgvMG7dlp19O1xe//Jl
         sRXKgGes5tl/9qm36Nucu5mtabsBMNqdhSAfopw+0MNl1KuW58DVsVJJeRP+koCbuM3A
         vJIMfdGRGPdaP7XysuBY84ofBh/gEtFHab+nTY3Vu/33gu/PoVPpEWXvO1tLvjgk2QJS
         8GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348596; x=1769953396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gJR3t/I+dSBF7pxTKcEd0IpTH4h4FNjSSBlovFfwKo0=;
        b=dSpeTb8wz45KvBrj6Kwc3pvd6q8PSFRhzgJ4KlSLu6bxFR1EvXrUS37a0MtFLiOcAl
         r85rO+WbnS3avcFJOVJYn49eYLsaM7D/FaHbmZoIt3e2GAHs5JrWUFxyTvkURHDaXbzI
         FnUpCgEcb4il2c1Z/eJ4mOHgiyDrTPwrlCbmNccPCFBmg705DJxraMhXlBGONOQXx+nI
         Ir1z4shhv5DTEA1hVPNZAhCeAh/h+hSDo/TOkEUQn01y5Z15iVQ2ujpH3DUSjfD23KLY
         zL/Mpq2p3dr2TRg6UsQpO6kB9SLhM3Dl67G6gw5u9U7tUWpKvUnfxnl6+5qe9/nW4g5Z
         f7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc6irmNsC1W7mnjhqdbvAgv1pO3u36AUEtdA3xxPWDULib5GSG+w0LOWy/0XRLIXFRIWvDDEOFDzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKE6wygCdKtYOMi3HC2zKARwZ8YdM17Ctv+ABYokTim/mCW1d
	lCDU++n14SBuBnd5vBdoFo944QAt7kJKSA87PqCOmFP+T3A0TudzlAwl
X-Gm-Gg: AZuq6aLcRB9rQWyY7yKyNlqC8cYNCE98szPY6IDht4vio85IbV1609l0KHOiTODO3bf
	GnWH8mrizmR7UebVIYxuXMucQ3Ih7N3+v6fvBJ5cGrlzEqkPlJhAgYcBdn3IO14+JXw8fLX6n9V
	0JKZEBIjd3jpo/C5h2X4gAVsvE3KasQjGIrYpG0MeLq1qvaTBSyTCh3jWOiMRhJVxhjLyVSKkaF
	xo71VhCaSfsN1Nwoq/xYJ+AzXrzgZoeqk9VeeDbKDMzHbWUjkhdcal7TQiLFgS2mCzxtsmQxxH0
	Zknkb2Chb69ckDTFip1iYqnjOf+DMgYDiY7qOHR1U65Adane+OipcG3QA59LtrObkGFEINV52g7
	uOgjOHzVkMtq3aMOYUEwwaRjHYHBRYsmJdB7Sbm6OlrtKiQkUPPNsN/CRbE/pl7CmkZzQ8E6Kfw
	RF
X-Received: by 2002:a05:600c:1f8f:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-4805cf672c6mr27725115e9.28.1769348596249;
        Sun, 25 Jan 2026 05:43:16 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:15 -0800 (PST)
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
Subject: [PATCH v1 04/10] iio: adc: cpcap-adc: add support for Mot ADC
Date: Sun, 25 Jan 2026 15:42:56 +0200
Message-ID: <20260125134302.45958-5-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-5855-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: DD8E380CAD
X-Rspamd-Action: no action

Add support for ADC found in Motorola Mot board, used as a base for
Atrix 4G and Droid X2 smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/adc/cpcap-adc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index d9ee2ea116a7..c25c22a1c03a 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -934,6 +934,17 @@ static const struct cpcap_adc_ato mapphone_adc = {
 	.atox_ps_factor_out = 0,
 };
 
+static const struct cpcap_adc_ato mot_adc = {
+	.ato_in = 0x0300,
+	.atox_in = 0,
+	.adc_ps_factor_in = 0x0200,
+	.atox_ps_factor_in = 0,
+	.ato_out = 0x0780,
+	.atox_out = 0,
+	.adc_ps_factor_out = 0x0600,
+	.atox_ps_factor_out = 0,
+};
+
 static const struct of_device_id cpcap_adc_id_table[] = {
 	{
 		.compatible = "motorola,cpcap-adc",
@@ -942,7 +953,11 @@ static const struct of_device_id cpcap_adc_id_table[] = {
 		.compatible = "motorola,mapphone-cpcap-adc",
 		.data = &mapphone_adc,
 	},
-	{ }
+	{
+		.compatible = "motorola,mot-cpcap-adc",
+		.data = &mot_adc,
+	},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, cpcap_adc_id_table);
 
-- 
2.51.0


