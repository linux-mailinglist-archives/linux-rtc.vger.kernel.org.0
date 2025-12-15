Return-Path: <linux-rtc+bounces-5541-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D80CBD364
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2AE3034612
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE47314D2C;
	Mon, 15 Dec 2025 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy8jFwWd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BFA329E43
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791518; cv=none; b=oxo/vmeyYigmFlfNzoF6eVkZLPaFoq7DXzQMASrefBA8lqxERVNuQLmBrV4HSEW1MoK7Ma1O0PNp1kGnNnOhYzgsfNLnDzBTInC0aCnAsmxwPFef1KQw6iLWph8iErIG41tGj7xXCQ9xhgA/cYH4lgW01beqzaC1oCx2YTC9ecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791518; c=relaxed/simple;
	bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHQlK9opPhToKqQfDBQpQvz2aatgl4JRE88VkvCQd9iIwGiTZXcSQPZcelgN8kkbO8ciHduI4nM1Xc/v5hBxai/VhAwdarIlXGyy9rh4TtZD/nEcVC2s5eLIVJ+wLJGnUUipwwyhNWsxQF509baDCt/yVFQ9sfdBIvQ4yXYsb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy8jFwWd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d6f647e2so15518895ad.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791514; x=1766396314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=Gy8jFwWdyq01jOa0Q0ynLuujy0EuGZlIlHRAIGA4IjNavpV6M4Z2HxeRwZP48HyrHN
         PGKQoXOpAPpyCUFpawZTnsxSSgi4VZ3AC710mJUNN+yA1Jtb8hJ1YSrEipnT467pYBqb
         dqI4HgWloWGOD8fPxlt4RtJx0jrWvBvx0itxg4ysmbFEXtRm8zHPNNxB3dRyCM3Xfswu
         ZCdY2fALE8oxTPzoUjKBfDBUd848jRK1YaCpoJfrnQeZn5xsbuhQH7ILUBIHMcomwf8V
         QWrIVSX4CVoxQesKL6rwuMAND9oAbgakExzi0mM5Zdq3TEQco2ZJIrV9wyazqBd5F0qL
         o+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791514; x=1766396314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=Us5JsvAZ62pSKpJ3xUWCndi7b1LUBNap5zxDc7irdFEM+llvyZLkVFbCuSW+10wDaw
         5dTYaZKNBN6G8ABY9U8SAxAKTqJKyHRm5EFVi+ryrqqQf2uXoIio00as3zFEo21vvSsr
         MVjjIHks/hJNsC5G+nYD4Tt2sMz38x3m8xinfo1urUPocJ5OimVa+aKZP5G1V3R3xFrq
         z0vlFy9ab1Tg+GqBB87uCT0RJDNHon61jRnD/pdGqlj2mF5XKW5HLPkulEhb2ZpCze1M
         ym+pF4U+v4ilA3z6kYUWSw3wo5oYDmL6yfbKhRgud/7U4WoJOuj2pgq2+QlCLi4TrgYX
         jW7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCKwfayA4qwSRsPF4aeY/EI5vY3oXhBXwrcnWSECSge0qaGv7ClcIZ1VlU9N9wtZhvtlm0HHVIHPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3kNHeAu1voVpaK11QGMpIN+1yhgQzEYXBYcEaPuFrl3WMnXz
	JbmtzeBMjkgqcg6gPtNRauEcHqvtWkhvqO2pCOWR6Khzt4sreI3q2wZP
X-Gm-Gg: AY/fxX6Q2mK18mRGGi0gw7Ycx2hW9vCAHURtINJMgC21mY31lcwPcIXX4vefCG1i/oU
	GtF8KoUI9U5BvC+Q1GGXLTuDe0dg2cAV4toA+Ch4EyGQLN/B/31o5HK2YTqRoO/w3kaVgwa/U9o
	8JHxfmarDvYxAkt//Rshj+Q49hnnduStmOvfnEAErKIphfiFTzW+HwiVr64iK0o4RZyfkHkxD8N
	Eer2uEKRU08/kguucCXO4IvcfEZVbAgqhIxfxGoKGQsX/LT1AUP9/hbcN6nZa6qIQAmxwK5IHTF
	JyYHPT3h5843Z4fv+FaDQwLAIMw5D1FuI4vA0cglZS+AaYkORMDkoSTFuuLKh5qd0n5iSTVGYBL
	OraMHHeIF3R8uQgEAQizF9QY/gS1ZJdxIRV/lmqioHCUqsN5JEdCiYDJdN+lkDyM7U3vJKgAEQL
	9EknjNyODg4qp3wssMumdownyj4thYuDP7qa0HuAcSeutmw8ZKzQqglhdtYZkHALcnAheLXtUTX
	eW0poTZtIL4ffDSwcTkS/vdnk1vN7X2FAHUGWH93DI2Mh8f4RhkUGfBQkmfILY1+hcxUHI+qXyh
	W8ivZJ5fGHcSnsDK2E0zEJQw+kYGsfN8b7G8s9YTQ6lALdCwY+w=
X-Google-Smtp-Source: AGHT+IHCWcOyM5Z8EFFrTYBLBI/0yDbLna48TS9+7DgDOr+UeDJqde5BU1SxSQK1fSOkyBfxFjFufQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr91903265ad.51.1765791514107;
        Mon, 15 Dec 2025 01:38:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:46 +1000
Subject: [PATCH v6 2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-2-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215nvvLy0yve6ff3amrhrC/MEs/XVOlOearId3L73z
 ZXPa/xqOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMtVcHIcO7jXJNT6ydzK7gs3uBz8fN7s5dxvHcn5/gV9zZPuPmj+Q0jw5UGyV0
 R228vqDuoltO+7rvPRi+Wc5+OZAcpMMaal/3s5AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..9099a7a22f1f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.52.0


