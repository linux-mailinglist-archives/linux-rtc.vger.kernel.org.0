Return-Path: <linux-rtc+bounces-5530-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3ACB6A63
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Dec 2025 18:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCA653055B8F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Dec 2025 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167423164DF;
	Thu, 11 Dec 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fD0ls+X1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C29315D5B
	for <linux-rtc@vger.kernel.org>; Thu, 11 Dec 2025 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473363; cv=none; b=sF76S3Ls+7FMjuI8/Ix9jdR343IZQinYwBPyZYvnpkMAMCMFFJp6zNo9A0oUQNC6RqDWXqaTsA0zetdHzVftA5bia8Yj5rv8pfsS/3gwR9/MYofZBZrZB25ODgcm2Edk/0/jBZEh3l2eLPcVkhtaRlhrtEirsipy1oTfYqicdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473363; c=relaxed/simple;
	bh=KbP7EtIirsjcRAVahUftVfemTrSz9aRFfaaIcH7+JL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKXoo3r9Zu2ZoskWazGv5Ymp3rR8zB6wQ5tPcSxRYMpZ5nLrtDgjYjV7bADzpF48tGP0eQ0SAaJoRJws7hojA7T1TB35AhmyWlD3TRns18fNM0kg7Nj9Zv5GeWOD7xwMSeaoHh80i2S1gM5SzdLAxoni+frYsYVKRq6ttA/Kv0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fD0ls+X1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so2899405e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 11 Dec 2025 09:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473360; x=1766078160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JeA5gq6kRi4Lyd+VAOvX0wqPm9BAkVnCbcQJTu0Rxw=;
        b=fD0ls+X1rltarPRenZleAvJyz8C+3IVfKR0xvSm4/hnyQtYR7iRCgSPMPKF+0GeQwc
         4P7B1sJG1eBOEMSmngDfVM60Y/qvU8Xv502UlV7mgXyIU8Wdiiyl8KW3OqMF7iTWf7zL
         uF5n1H+ab1PNRrpGRq/28OIPNyULw810D02ZowoG8fWizu3mVEV7piKAKBvjjsE5kyz8
         DjEFeGtoynZgIX2mgCUNayp2ytrFKuvz7FFMwAAknew1sfBuQODuMe7ggA1B6gI9dQHB
         Q6aYyAfa0Rx1M5o4wN3mYaZvMS5CmecFFyJTyz+bX91BbUyeupd/iFD4fip16RVwO7U/
         ieYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473360; x=1766078160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JeA5gq6kRi4Lyd+VAOvX0wqPm9BAkVnCbcQJTu0Rxw=;
        b=t15uIVaMKqFi8egdUpjIRNRoNYuqA4a9L61D5+G6EyAwazCsc054+ptGAqo3J5oq4s
         mqTwxEgXtLFAJFCToJPCgXXFJ+eQVZ/9Yh3WnFkdgAA2ZSZs+Y9OIW9AxLvaCSsazUfz
         3QnAEZHf+KOWtb6YDxQgniZftzigjleLAldb0BDvjOPfviTTWqDImxvK7F+JLBHidf75
         PY2hiuNGNysmPOtR9k6y09uFyPGS2V2S7cQgiqSK1uqL0Dt8DeG6AOIeVLAU5ktzz+UE
         Xakww4acLoI6UKmDe7QXaf9YI8GGLkmh8sTwI4ve9N/NYf2rQvjpAm7nW7J0oTuNFBBL
         49DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGelcLJ2oRGozoLrbUC9KNijzyTTe42D7QxNToJ/Wiki47wO9k0eYsu2yjSgA7zV/FyuluK4bM4yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWnHUOQdRzRhP1QCBn00PShaUJ57fVuxq9mT13XXQTv21O37z
	5E7DYlsO+iDPzmuYc0ZNrm02SbNiq1/nEwX9pMJH5cLcAA7eoJ/6LcuUWOOBBH7FMNM=
X-Gm-Gg: AY/fxX58r2WQ9ZxQfjyiZmaVeogDZw3+YgBRm9/p2yCd0P97TkF9LTVPUQ9BlcSyADm
	vGIVdit89rr15AqionvKSjDb5FbfGgFGgqVUE0cVJGpsJyVzMqJGupahMG8O/WMFT6LgtWnu4M9
	ohcf0sB4RjIuT1zxtVxboTcAKzRSki5quOqdeYDxYJn18lsg6fnSchCWFObtLsnLULzlK5grTMQ
	EY7pl7iT5ouqe/rrUxVNQu8HU6Rhj+LinghO0DmRVnYqVQmTYgDvy2cueXBojTxZcQJmL9di2EZ
	aa4Kg6B2xl0ydAOaICMY1mwvzL+Rq56h4v4jpMauyx6ZohfgcXzzZgXXb74+UouUt4SQG5TKENG
	QpbRT+/zlCTwKFTwDlL8yF+BsyKvcKC+r7wY8ZnE+Mq4AnOW2u1/t1Y5Jj3qdvbr4/OXsysp6uJ
	T9MVkbhuO1jgxXwyWDXLX1pJwyDfary527DzGLyQLc4mpVNe5jhmDt1YZTM0hF6uCvI+8bGTabH
	QeaYAXI/S8Zwg==
X-Google-Smtp-Source: AGHT+IG/NQc3Y5Xt3abMDqEbPYOZHmotYsONgdb/bGoMIyIIzzMZ1acDR16pUEw26tEqcueZJ6sXRQ==
X-Received: by 2002:a05:600c:8207:b0:475:daba:d03c with SMTP id 5b1f17b1804b1-47a83804375mr67687815e9.13.1765473360269;
        Thu, 11 Dec 2025 09:16:00 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89ef954asm47349765e9.10.2025.12.11.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:15:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/17] rtc: optee: Migrate to use tee specific driver registration function
Date: Thu, 11 Dec 2025 18:15:00 +0100
Message-ID:  <a586934215a4971f9920398655cb85fd29d91c9f.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=KbP7EtIirsjcRAVahUftVfemTrSz9aRFfaaIcH7+JL8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwiVjxH75Z6V50l5vwIkZOM4q9gf3DvDfDBz Rf+99hzFmyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8IgAKCRCPgPtYfRL+ TsWFB/sETCAgBSQbnWadmTkVaxUsX0RQ9keYFWz9xaj+ZG8EblKQPnZlpyxpCfxRZdba4NgHXCR p4f7Q7PUDE51bxiwpQV1v7pZM53XSF8Yugau8J/vt2j7z04FHsasETvyeLc9k24wy5OERHU/7HD 6kaptYCge7hFfQXdGGciUwf6raZqq5dww2Tkqm3Qv7x4p7mzeql9dW8ydUNN852Rkb9ySfPaYTT a6Q7ZxOqowSsSkidxfXID5+uFyELafRGsTEK7P+OPQzNQkFUebTB8uSE3D9RWWUnmSKo5SKYoK4 uvyChsBQUxiQqtP3K6Hos1EqHSmbdGSvMc78yl2iMymDW94L
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee subsystem recently got a set of dedicated functions to register
(and unregister) a tee driver. Make use of them. These care for setting the
driver's bus (so the explicit assignment can be dropped) and the driver
owner (which is an improvement this driver benefits from).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-optee.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 184c6d142801..f924a729ead0 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -726,25 +726,13 @@ static struct tee_client_driver optee_rtc_driver = {
 	.id_table	= optee_rtc_id_table,
 	.driver		= {
 		.name		= "optee_rtc",
-		.bus		= &tee_bus_type,
 		.probe		= optee_rtc_probe,
 		.remove		= optee_rtc_remove,
 		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
 	},
 };
 
-static int __init optee_rtc_mod_init(void)
-{
-	return driver_register(&optee_rtc_driver.driver);
-}
-
-static void __exit optee_rtc_mod_exit(void)
-{
-	driver_unregister(&optee_rtc_driver.driver);
-}
-
-module_init(optee_rtc_mod_init);
-module_exit(optee_rtc_mod_exit);
+module_tee_client_driver(optee_rtc_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Clément Léger <clement.leger@bootlin.com>");
-- 
2.47.3


