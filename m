Return-Path: <linux-rtc+bounces-3971-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B3A943C8
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Apr 2025 16:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E167189FDBA
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Apr 2025 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879D61D6DB9;
	Sat, 19 Apr 2025 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVV0n4P0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DE17A302;
	Sat, 19 Apr 2025 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745073645; cv=none; b=Tv5x67xdP/ylV2mBSKy7GjkaVPBza3SEK160w+M91s39AgguoC+6kdicZTtLxH84R6yfr8UyXeLcQrRlovlwFkwVIateHono3Y5REKejRld0B1UYAanF+uX1AJUs732LEx8+MTieICMTPPCPIsWoecvLR7fMYb3X7dXsuryErOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745073645; c=relaxed/simple;
	bh=mrXA5nymjJGg2oomVKmdxd6U7DblU0gA+8l+cHdxjZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lOG0YoQ4z/tKrha0mViI8nf2aiPc6xf6d2vE3JpWeQH+/dmxHgmj8VnUz+tyTMsYNqDKC861WyKgwsqvh4eer6Fzr5JLH/aRnijwtmWmxMfUwbQRXwZAAv1hlBSmxSwLvxUEFTn5ANKxhptietgxK8PNO7hdE+CGmA1nCigMbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVV0n4P0; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so1820752a12.3;
        Sat, 19 Apr 2025 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745073643; x=1745678443; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmd0prqSP1IKD2wQALW7REfquKEBSU4mDSAGi0S5v9M=;
        b=dVV0n4P0Dj/bCzbsCtdVQZFnVwcb5zw/95PEIomw1aESTxAaawfAq43XAnOcjDTSzM
         xlC4jorHX7UJqS1qytgOEHc9THKDPO5Qwq86Itsw+chWquwBofiLj3uDMm7/qoIkmngS
         +xQjpcgiMXkmA4dgKobh/lji/GFpGC4f1WxQ23moK5HFDF9UuxdrfoVQP/EMY3JwZbMw
         /dDsCGWPJ4qwzzgM4xlXmIpUYrB72L8oQBptV4NvdPKRo2QGak59eJBY7yyKE/i3ox+Y
         BH0OxAhI4+eizfokEMJ2gpxhAOz0ancetZn9ZXlefIUSxdQ197FybsVpwrBb1iql0dPs
         X8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745073643; x=1745678443;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmd0prqSP1IKD2wQALW7REfquKEBSU4mDSAGi0S5v9M=;
        b=Q0Io2SvB3SyeuvRXIFL0XHfcUgRVp/h2wWy8Czvw/jd8kSF1mhATDx6ak4Uv4ilanu
         i2fygiOJ44pd2wVF/tEAnZIj1xURSS7t0xq4upqs/kwRp8h58SQnqy3rwOER6Zbe2+Oc
         KIVDgBGWfItp/ocI16dIRZfnWYXs8uZR1L03P39Y1A0pkGsq+PxhV1yNghz4kp7y+/YU
         mknnhMxMAXZ1bL26Mczige55Fwc7g/QWSzDnLvEs+qZxxYe+Yeh8qy9Xl/saigXcsNhU
         CKfAuC/d08Qo0RIHhjODfI0s643odP0v7OA/ziP69dhfVyPQOx2ExSEM7Pfxd4GBhjBe
         e9DA==
X-Forwarded-Encrypted: i=1; AJvYcCUz1pWLjZEJR2KNMBlJA2t+zwjePxz1lXFpKpdWoTjDnnltcDn4po3Hlry6zsO7AGtX6cOTbAhFMI8WRgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqt2TlC+QjsM+Rbh90Az4rQPAYdqgIqFAn2dMWlB7JHEHIOJsz
	o5vYV04LAK5OSBXbsuXs/W4BtEajlYsaBLQXnTDP/a/cI3T+RWSuXacaEm9Z8Z41K2sd
X-Gm-Gg: ASbGncvqeBSzjy3x2A7ARonZZXPBssWU5sfCLu/aIqLVYtFQ36/C3voobSHBES2gOz6
	LWUejQIbquKKiHymfiVJMmiSm16nromHyL/NQdmTegZHPE1Fr2vDVXTbOPSQIOp0FMl9o1G2Ene
	8qKgbTxMCngGzB+bpl6FMPKhClIed6+F89o01X/TU/GJ96H923CXbAv9VYVQAAC24HrYgr4YRwV
	CtXJZzWGK+mAqcSQw99qfajR8kExnuco4kM4+39WgowdV6rfTJvoDT5Gg7XB8m0BnYpglyKaiij
	YrCeOzOOxOD7ThCNUrgEVkYLJkejfx+hdfHLwqL5JUA9NAtP
X-Google-Smtp-Source: AGHT+IFDoZkZ33dQU074USKU5rq4bM3O6MvYLq76SchXoElcZ+8BDAACn6PocZ6euZR1hl3XWTa0Lw==
X-Received: by 2002:a17:90b:2d0d:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-3087bbc22fcmr9760935a91.24.1745073642676;
        Sat, 19 Apr 2025 07:40:42 -0700 (PDT)
Received: from [127.0.1.1] ([240e:341:e5f:8f00:f9f7:ff5b:41aa:214a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee872dsm3158428a91.10.2025.04.19.07.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 07:40:42 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 19 Apr 2025 22:37:10 +0800
Subject: [PATCH] rtc: pcf8563: fix wrong alarm register
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIABW1A2gC/x2MQQqAIBAAvyJ7bkErU/tKdJBaa6EsFCKI/p50H
 IaZBzIlpgy9eCDRxZmPWEBVAqbVx4WQ58JQy1rLVjk8p2B112DgG/3m046ajDVBOm07BaU7ExX
 5P4fxfT8r4VyhYwAAAA==
X-Change-ID: 20250419-pcf8563-fix-alarm-5e787f095861
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745073435; l=2187;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=mrXA5nymjJGg2oomVKmdxd6U7DblU0gA+8l+cHdxjZA=;
 b=CgWYz/ijZ3G/15M6aJ9gfMR2yQt9Irzib3Rt+NiJP81/s0ICFOgn1rU4hL8ti5Vt5smgDMznX
 LCgWRlP6nV8B5k0vdiV55jTPee0Nhz2rc9+pVeCEQHAYVQY4tZ+EvBS
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Fix wrong register and align `pcf8563_get_alarm_mode`
with the naming convention used in ops.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Since this patch[1], the set_alarm function has been setting
an wrong register.

Link:
https://lore.kernel.org/all/20241010084949.3351182-3-iwamatsu@nigauri.org/ [1]
---
 drivers/rtc/rtc-pcf8563.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 5a084d426e58d09cfedf0809695a96a27627c420..61e2f9757de9f24407f9262657da0d1586ce124e 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -103,7 +103,7 @@ static int pcf8563_set_alarm_mode(struct pcf8563 *pcf8563, bool on)
 	return regmap_write(pcf8563->regmap, PCF8563_REG_ST2, buf);
 }
 
-static int pcf8563_get_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
+static int pcf8563_read_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
 				  unsigned char *pen)
 {
 	u32 buf;
@@ -127,7 +127,7 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
 	char pending;
 	int err;
 
-	err = pcf8563_get_alarm_mode(pcf8563, NULL, &pending);
+	err = pcf8563_read_alarm_mode(pcf8563, NULL, &pending);
 	if (err)
 		return IRQ_NONE;
 
@@ -262,7 +262,7 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	tm->time.tm_mday = bcd2bin(buf[2] & 0x3F);
 	tm->time.tm_wday = bcd2bin(buf[3] & 0x7);
 
-	err = pcf8563_get_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
+	err = pcf8563_read_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
 	if (err < 0)
 		return err;
 
@@ -285,7 +285,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	buf[2] = bin2bcd(tm->time.tm_mday);
 	buf[3] = tm->time.tm_wday & 0x07;
 
-	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC, buf,
+	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_AMN, buf,
 				sizeof(buf));
 	if (err)
 		return err;

---
base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
change-id: 20250419-pcf8563-fix-alarm-5e787f095861

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


