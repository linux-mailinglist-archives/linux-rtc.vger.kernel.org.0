Return-Path: <linux-rtc+bounces-5964-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBL1LmLPjGnbtQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5964-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 19:50:10 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0C6126F0D
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 19:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F012A30071C1
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 18:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB148353EF0;
	Wed, 11 Feb 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0uuZgsi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B43352F83
	for <linux-rtc@vger.kernel.org>; Wed, 11 Feb 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835805; cv=none; b=aNam2SDssZorhChCwmba0GvnQI2H66SiZhnw/G4viTSVw4s/52xTxEV0a3YTi/Sz6DmfcshcvNEab3r0+1a+ZebtTfpuRLo0/BpwkZsS+8a2m/siVtHnHYK2zULQEsvMXIvbV/CcUzyJYmwpyz4CYQYCkk40HcvjySO5o7FnYIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835805; c=relaxed/simple;
	bh=OCqMqTV3Fk0GHlGjVJ0UFzNI1DHV1XFUgzJgSRR9AZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8mjqcmVZNnxR1CFS3usZ6HgH0eH/Xa91mT1AS2JSVtCrJ+5Bun2Tcqa4wAgjooPqKgSPNC+BdPA3z3NFFvW2YdAEkE9JUqsfU7OycsFRoCPPVAeMQqDWkctWOrjXkSF0JEui4Qmp3uKHyLnuMeH+2lwp7WZrozq5Nsb3TLtn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0uuZgsi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso22568895e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 11 Feb 2026 10:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835803; x=1771440603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=Z0uuZgsiO0lWjTfML7tP2pVKbRNZAS5fx+tesPWj7cYnm9JP0eOXq52j7IrWibv65w
         c7JzebPje1YUmgV0c7zbiLt+TDP7uUHwwUI4tEtS2csG8SEGsmE6rdq7cRwOtIo+cRP0
         s7nsBkvt5hroFyVUaHDqRTJryFzPho9X7G8tN5B/OkhUIRO55MsYESJ9ilh1VPegOQJ1
         UHfJV1swyoo+bIiCniccCYSJO5+8eB4zQ8DPWUzDID3KQki5F6c7I/vumE5VtjanW+68
         UQ3u9tcLEnFoCmnT6RflUWAze86xVe4v7565GFOloHk+sDsVt613PaTA61tfjSo+lQGo
         AFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835803; x=1771440603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=TCSIKN824UIrF/zeYlvIx+44w2l5ZOVgbDI/H7BdZE3h+ANI30UkIzNTG7nH2DZpl2
         tvnP+U8vGHgsPYYEGhpL52pKEXkkHcI68TkKGycnfHp7z8xUDhexzJ7i/5ktYNQ7lHVh
         rgasoOXSW2SXYya1JPcS11QSZ+XBtMVb6wPd13pQReEE7A7sy9M5O7DlWvS1W9EharUt
         zWLAFi96pzubgGO14YIfT8GPr9zd7GNYQfCfoIYxmn7iuktvKBwKMUTZ1agCMpgtopQi
         2LYkYjYkLpeu9ruJ1NuvtrGlrZIIZjAf1JeIDrZvM0/XEdEJP8oQZKAnlmcdh1ct99Ph
         YYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVt+GPU8omkCH3p3JVjG2TI7SZCqT5VJsWjiWJzd/9/+IkQQ1TidFu/xn5zSMu2cXz6atyTi+vJLdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfElWhtqZkUWbHzruEQbgwogBtl5DZj1EKy6zwEneSZL9IRNH
	7mqT+7UPgtsgyKDT60yVQX/Nq8SQ65OmdxWA0H1Iat76DdVFa+21aPNP
X-Gm-Gg: AZuq6aKPuNzBy0S+9V7QE6TmsJT1N1LphJ4gwlJjvpLve1aLyHIeNWPPAirE1d5aYSL
	zZ8moM+EVo70JYwvMQ8yFLoe6C+yxu374fxQ1KMlzF7Jw8W9WECfG+ugfpkqmfUSiyxr8mgG2Fd
	jdwTxEhpam+ulR2pyAXTYsNNCJUFaLoykPQx755kXiXeohEYOoV8AFigdHUaJvJPF31jyBMHZ+i
	2ytdk1TwyxM3ASy2jcSw8PjxY8/GHgJvsvkaO81Z/CA2z41T4SJi/0wKtARIi46XgPFy5oZv34+
	k+jgQe1zGgNcyl1L2xnNfoQXuX1juaH1PRQxXupoz5CXD1wH9COgBIiZjoEMIiG4N+0T+UjI52J
	7OzXyGrJdYVDOur/GRAyjVFRPPsz9jakdLcnrg1CNin4Fy69Bf8iratP8+NQ9k9u+K2aagzNbTQ
	WdU9G8CgDhq/Ur
X-Received: by 2002:a05:600c:4f86:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-4836570e562mr1994595e9.19.1770835802620;
        Wed, 11 Feb 2026 10:50:02 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm93175855e9.6.2026.02.11.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:50:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 2/2] rtc: max77686: convert to i2c_new_ancillary_device
Date: Wed, 11 Feb 2026 20:49:41 +0200
Message-ID: <20260211184941.6756-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211184941.6756-1-clamor95@gmail.com>
References: <20260211184941.6756-1-clamor95@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5964-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E0C6126F0D
X-Rspamd-Action: no action

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/rtc/rtc-max77686.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 69ea3ce75b5a..3cdfd78a07cc 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -686,6 +686,11 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
+static void max77686_rtc_release_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -713,12 +718,17 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					   info->drv_data->rtc_i2c_addr);
+	client = i2c_new_ancillary_device(parent_i2c, "rtc",
+					  info->drv_data->rtc_i2c_addr);
 	if (IS_ERR(client))
 		return dev_err_probe(info->dev, PTR_ERR(client),
 				     "Failed to allocate I2C device for RTC\n");
 
+	ret = devm_add_action_or_reset(info->dev, max77686_rtc_release_dev,
+				       client);
+	if (ret)
+		return ret;
+
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap))
-- 
2.51.0


