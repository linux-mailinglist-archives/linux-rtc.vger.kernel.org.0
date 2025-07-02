Return-Path: <linux-rtc+bounces-4415-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB8AF6426
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 23:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FFC53BB1F5
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 21:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645C12D641F;
	Wed,  2 Jul 2025 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="R9bum3YR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5F2882C5
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492230; cv=none; b=pqojbn6gFRYA0RZhg+q5Vvt9j82xzccnOyPyuin0l8W3FLDzGQkDSEQS6kHQG0tfFoPWtlwJhyFunlR8lhX/1gAWl832W9xN2jnDqERbvBaINADvdgQTJRcF8cnQQBFrOpYhV2U6doQvF8U+tn73iA/1gV9aCwPiRSvAFFPRYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492230; c=relaxed/simple;
	bh=WB/IrpIB/wfBJbu5dFJUlcKQY59F+HJ0MTfMkd8sfQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKeYL3NRxrv0OPlRVuQIXqTw4hW2/a3MMXgplIXBpSu9j9R0HCQQM2WY7RJ/KolnRhpBY2WqvRjsi7gFGC19Bk3lXY7krp6CgxCeoSFFLFBz2vajMKe5Q5kGi+6O2Gvl3uXJcALZok33EmJQzCOU+/wzryjJwJYbgmygX2N0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=R9bum3YR; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad3400ea3so68095976d6.0
        for <linux-rtc@vger.kernel.org>; Wed, 02 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492227; x=1752097027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=R9bum3YRUI7UInsDEmkEa3gyb9TT9B94Yfr7hlcPcUAUpwyqK25pNA7A2mDwoMoHkZ
         B7YiQbmaFJ2j/9clB9KfnP7Cqn16jpzk2P6ajpLyg0eYANj9LAxSG+fL5Yd+IbxPI5RG
         5fzMgo/ApASZ2NoLfHfH6rBd8E5fVcCZzzZIDpmnEDTBvh7pfrIQBphyTkvUeKj7VL53
         XjGJVoXX6HgYusbCikekUfoDDEl5j2bP72zwrfH70R5heoX+SoNWNlnHI7cAlUqv7wHN
         zrzARjvhn4IwbfObJmVXZrK+zMUF8X2KjgT1yB+BZD5h8VmZHbacqd/I7rZum/ax/Exa
         SI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492227; x=1752097027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=RIutixaO9XdQiLGysJVjGNHiywOJtRL2lr98W8fEJ63NAYFgLvArA1ZniMA8744yZN
         nM7jUclX0B6PvfV7oIU7Yy74lYrc7z3Z/tIifzYCej+42gCZRHYNuLbjT52hIvLr4I8Y
         foBGnEK/tDH0MKM+obLqIVGJiUkK2jVAsWmZG8WTtShtGvTL+KZCerGnGhAhkp3tXcFX
         jWl1q6qf6PZ/iQg9isClKNpb1Fws7RsZbD1RnWs9QzM0FZYatykK5x63Fj+U4xtCryzb
         omnISiINK9TViSBnwKrWQsy2ipGOmRuIgwcOTUIaHTQIIKlDfN1XFJh+F6OwEU+cr41V
         0oVg==
X-Forwarded-Encrypted: i=1; AJvYcCXPzsfd7HdgXVqsk/ETrhPv8/JSfoGQN4K0r568MY/K3xH+QSIbsmwmx4qQDm9QMRY5zi6dFmMG/OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zuLCIs8WEmoJytS2mVPgfAFF/ka1aKR/nLdB4hW2pLf5BifN
	A9Vo875vv3cfBoVdFo9y+ErO9n0GkrnUHwHNSZPgxHx1TO0DlO8ogtA5acboSclZHjY=
X-Gm-Gg: ASbGncsZUYzeqq+POnrPu+k+Pi6gWkzFd/GfM/NDfc6/PlqxtnJ0H6WHlT1MfCRoAN9
	QELtlUv91qGC7H66gvQ/P88GV51Q8L3S1yZ3PyV/ZM2dmCvOPzJy/dFXBkF+druPVdsddnqTQq0
	nqoEFIAL1AtLBSJf2p9Ae1OQR/fwdorH0eUxhA8owMlvYnpVdXrH0DWyHDUsq/sjFOrg8CvDpE+
	rTZMmbDI6jSLalB9OaSKZjBcHSGUz7j3wa7vK9dxBHMflANxPH45dWtnlL60FeptDlWmow4Wrf6
	PJXXhKo9n0PdZ+Mgy6xrBze9K6GUE8w0wJL7ngOOWLvJUaB6m+Nzoff93ArbzGATFNti1C7yAMB
	G5MMNYgkgo7baJLCEiBI4XHY2edOP4kSufTk=
X-Google-Smtp-Source: AGHT+IGRObx6Rpk1Zs9IQPZXVPL/wda/SaVAzAggTxX0GxDaBqWEjwz2sqTqj864Fw46dZI0C1TGsA==
X-Received: by 2002:a05:6214:2342:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702b1c1ed54mr54743616d6.43.1751492226919;
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Wed,  2 Jul 2025 16:36:51 -0500
Message-ID: <20250702213658.545163-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices supported by simple MFD use the same 8-bit register
8-bit value regmap configuration.  There is an option available
for a device to specify a custom configuration, but no existing
device uses it.

Rather than specify a "full" regmap configuration to use this
option, Lee Jones suggested allowing just the max_register value
to be specified in the simple_mfd_data structure.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v2: - Allow max_register *and* regmap_config to be supplied

 drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
 drivers/mfd/simple-mfd-i2c.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3f959f4f98261 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
 	const struct regmap_config *regmap_config;
+	struct regmap_config config;
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
 	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
+	if (simple_mfd_data) {
+		if (simple_mfd_data->regmap_config)
+			config = *simple_mfd_data->regmap_config;
+		else
+			config = regmap_config_8r_8v;
+
+		if (simple_mfd_data->max_register)
+			config.max_register = simple_mfd_data->max_register;
+		regmap_config = &config;
+	} else {
 		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	}
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..706b6f53155ff 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -27,6 +27,7 @@ struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
+	unsigned int max_register;
 };
 
 #endif /* __MFD_SIMPLE_MFD_I2C_H */
-- 
2.45.2


