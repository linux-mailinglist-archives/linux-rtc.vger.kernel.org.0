Return-Path: <linux-rtc+bounces-4206-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB42AC99D8
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 09:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97F801BA0BDF
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 07:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C18923505E;
	Sat, 31 May 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7uqYUDI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4321CD1E1;
	Sat, 31 May 2025 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748676313; cv=none; b=fyBJSl2E/dM/5ilO3kJKk2BT+YukH4E1WhLr9OU3dbzWFTRrzZntwGyr4USpaK8gm/dpKO8TfI0e5gD1grlkK+lIwsiRHwSxQcl7ki+tqxuVbQnWGJTgt4+l93/EiINedqnsEPywGyEKO9Qn7X1kUPqzBLhYtDVKLKeaKRul7YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748676313; c=relaxed/simple;
	bh=sEJs3eN1pXM9A35ABPY3FL2cpEkPCsb4SdnpHf5Oysw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HawkIBBDcAygsNFfzQbs3V8LEuW/uZ41usHC5459wRyrnI5BGUxsbrzpM1i6sYUUIWKjJ3rk6BpTruLK0GuWF1BRVFvG7xNxzgzKH+fG9DPem1LHvYsHarJYGxnxeVJoQJrwhPfjayuJoVGN3yORbToHri3vOQnSQh7IsHZWTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7uqYUDI; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-74264d1832eso2920018b3a.0;
        Sat, 31 May 2025 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748676311; x=1749281111; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tb9gy41WCYgYTze5BunX9HwNT2eQ+EQ0m35v75yOUmk=;
        b=S7uqYUDIZGv+Kz43oPPm7+//bfP7p+0vdvI05pRfSy9j2TTlSb1X6zhFdte2gj1rpu
         Wzvw0HkDodbx1A0PIRltgn6TkEVu+reeO5orcuz4E1VlAMHDII4ceMy6ohTs/ftwkwPG
         I1ziYZjzKuJa8H82rxPwzF86YkN5BTABGJl1A0xCw7oI3/2+4w2DWBipFBpDvXpMv7NL
         U0USr9nq3KIBd8Ycs229Kc5MTbJALbGG4aOz6rljjUlUtneZgjUjCdSatOQsNGHJudfh
         Gc+eK56FR4Uv67A3XEdBdnVeRJn8hL0o3vXW6AMYEL+JZGfD5pxi/9Px6lgK6MOrC86r
         R/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748676311; x=1749281111;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb9gy41WCYgYTze5BunX9HwNT2eQ+EQ0m35v75yOUmk=;
        b=dIq3sogJjBcaDMDhNK3EiqK4o6vZvYQOtI9Y2qncjazXzvYCm3yAxENKBxHSvbdzd9
         IUA6wEpH4NYj77XNN4ivW9T5vZSa/tGjbdIx2d9v3OgBw4xP55ItksScYO/Oxijm3E2V
         f0fZ97Vf4PUOm2IL6F0FYh8pNRUXJUPw6tDEUSlhVHMQy8bDZNoy+gsobXT7g3OvXNBw
         /OxKNxTwBx7OhReUGCr6uRSaXde86vycdoG+1srXSLrA5xYINO8XqN7+iobrW9AohCvL
         ayFLb+pXj6FvGjNm0ygd+AOCsgQNMkAx+2OlGy2zABejH/gPRScv3CbOlgj+qzB/Ef2D
         qLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnOD3eYrN0GQw1E/aLPt6Hzafa0IgC54gOQDSUTBgiylqD1HqbgPsje/Jh2E9npxLsnMqE/kudGgdpRKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4GDYKoiU6HyTMoOkp3wn+m06PmZ8ey+b8Qcq4af98Cc2Y5xO
	2LGpl3MbbKGokTmICLBBZ4YpaCRJ8quFGcHU3uys6eZFe/hj38gONN+z
X-Gm-Gg: ASbGncuSOxGEIbQzkHNN3rJEqcalZKZh53xr/tKqFr/mD+5KaSZqlcy13zVmyf0UQMw
	MFwu+KwZW4zWop8fy8KrAiglVgEO35v2k+lQ7oA3r6SzqyZMFxLlVRGfLGNgIlevUQHFAhWhaHU
	aGLkp+szaFMTxYiQZb0pFD9+XzIS1dUSh5Qy5AL9y4EFRF2FJpT/zufmsr/ezNjNhdVvpqoSd5k
	G2LMO80D959GnPdP0dFMnkK0ENQnuJfg9hUzHMwimmO6dmKyU4UBX+PTU+HB8CVHVxee8H0L7iP
	xj/ogBpgTemYp0DKYJG3wpIwmrCOIfrCt1/jX0NJCsV7HUSq/CPnOwJg42q955i/AI0ICw==
X-Google-Smtp-Source: AGHT+IEHz/d2PhDuz8MAfJqDuNx8fU6jAudf7ehnCahFtjAR8/ORj9wyQ5AF/9aDjb3wguzDHWmGyw==
X-Received: by 2002:a05:6a20:7349:b0:215:d565:3026 with SMTP id adf61e73a8af0-21bad1573damr1434429637.20.1748676310781;
        Sat, 31 May 2025 00:25:10 -0700 (PDT)
Received: from [127.0.1.1] ([240e:341:e44:6f00:3985:d8aa:a949:3e22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9643fsm4101113b3a.2.2025.05.31.00.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 00:25:10 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 15:20:40 +0800
Subject: [PATCH v2] rtc: pcf8563: fix wrong alarm register
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-pcf8563-fix-alarm-v2-1-cac4b1716167@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMetOmgC/32NQQ6CMBBFr0Jm7RgKDhRX3sOwKGWASYCS1hAN6
 d2tHMDl+z///QMCe+EA9+wAz7sEcWuC4pKBncw6MkqfGIq8oPymGtzsoKkqcZA3mtn4BYlrXQ9
 5Q7pSkHab51SezmebeJLwcv5zXuzql/6z7QoVdropDfVM1OnHuBiZr9Yt0MYYv6xPZdKyAAAA
X-Change-ID: 20250419-pcf8563-fix-alarm-5e787f095861
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748676045; l=1668;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=sEJs3eN1pXM9A35ABPY3FL2cpEkPCsb4SdnpHf5Oysw=;
 b=/S3wCjKhAbXZmbfcU+bjQSA9mgsA8tmAEEnQwaUKVlN6zA4xGmGHWg/tJ29izLwpoQb/Lq3lN
 CWSHcjE3GQBBHofbANOiYTx9JwPzhxfQxcHY/ld9IMK8DV1zckGvJ0x
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

When the regmap framework was introduced to this driver,
the PCF8563_REG_AMN register within the set_alarm function was
incorrectly changed to PCF8563_REG_SC.

The PCF8563_REG_SC register is the seconds register.
This caused alarm values to be written to the seconds register
when an alarm was set. Which means the alarm would not trigger
as expected and the seconds register would be overwritten
with an incorrect value.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Since this patch[1], the set_alarm function has been setting
an wrong register.

Link:
https://lore.kernel.org/all/20241010084949.3351182-3-iwamatsu@nigauri.org/ [1]
---
Changes in v2:
- Remove irrelevant changes
- Link to v1: https://lore.kernel.org/r/20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 5a084d426e58d09cfedf0809695a96a27627c420..b2611697fa5e3adc61f687e39385d10736dec677 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
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


