Return-Path: <linux-rtc+bounces-5570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B16C0CBE4CF
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 15:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB43830341C9
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 14:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB4733DEEC;
	Mon, 15 Dec 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hk+iJVev"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56729D291
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808269; cv=none; b=Dgvd4yjfdDN8OYbh3H6n97pc62USmrZgo7sLpjQAjXlxEeurpc76WQFTLV/00AxaYJpaAy1m5bNX1ygNGUtxl1hmk8ioi6Dyi0D2SC7onrpb/HUDKa9khtrIxhKaTYUagAniHyFjmurEz54WmsmQHZ3hWQ7/eCNHKW5uv4Ak1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808269; c=relaxed/simple;
	bh=8xBlw1gjbdzbNdrRW7jRBiV40wdZTcJoR7/j5OL6ib8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pM+QoJ8F6b4uKL59M/NrxOT9C0ELq1/W2ltr/whYfwi2dv5Gt2OOFGj/I0ageeDvdRpNBc9qjBbRWrBsBLaAKoDnNSUgODtJRgF04668DUzjjSVFNPFVWjpeNfq4evMbNthw9JmR/zNsNZU89vORRRto618L56k8+LuqvDyjUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hk+iJVev; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73161849e1so789470666b.2
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808264; x=1766413064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeVmB6pdOKliNGaheWVpdrKRlK51LVSf7JP1hhbHQFo=;
        b=Hk+iJVevmFG0yUznMDhz5rkSqcCiNI+NtEwqvJR+sWCWn5n2LKv3obxB8o74Q6xwb3
         4yj4m7sPLzGNt8pKTvr0re83D5gSUWWImzOslNcaE4+Eki7SvvfBeXbjdYwDp29Xi4BC
         Do1YVFi4FoSQgCx5G/VDtJo/2dTGcAt050l57ztQpuipOBgujpYgmHNgVsUM9vc6LJyj
         vT3UybGbC2+PElTXUEi+qtBwReP7J5y3WRtJaMFAKTwyRu2eDm+Mzu00IaGjisfrfIDK
         RvfFrwK5717nxC0NHGpnwQkl9smpFsNG1Q756F1gUL1tCo77xUvHqFdtTvIDLj6hwYVb
         R29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808264; x=1766413064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MeVmB6pdOKliNGaheWVpdrKRlK51LVSf7JP1hhbHQFo=;
        b=VbUG0tHSVPrje5ifcwByFAZCIJVwK5GWoO/bqROs6KXmvcnsDrrAaT+fIH/coDgDtX
         uCWgziiwr8Jv01NiNmne5L3xbWGEHyjDCEfNpCwHTot4mXWvwaUXLV5y4tXGtre1fktV
         VvPPHGwOpc7jPBbpv6yzs4FYXBhcmAuJN5mKxtL/N/nJdA6I/xwwh2tgCDJbnh/fEhna
         tSpIViB/xj3YXvHca2A2f7ErVgKmzvGIawf/3PrvtOqtkthpFnQJH5W4xlrUuOw5VtCH
         PhyXQI9mZRJ5/k8g7i/SwLqANA/7xcA0UwD91zM8PvArrPfK3p39nTgIiJxsnAKtoI9s
         DhEA==
X-Forwarded-Encrypted: i=1; AJvYcCW99TJHHxXKP7lIG/qTPhqL2YI47gsTaPI6YPDtN+p8Ld+Zdr+QddGgswidaI3NjQ3kCuLEWESoEt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziNmPnSs/aMsJ/UKisKCFP4XI0QDALsY2j/AarBqBlnEEuptui
	C5tKxwBTWyvCF9vjzw7CezOUst8wk2Bc3atjlIF1UGQYvA9aqkLFUCmaY/ZLeZxNALE=
X-Gm-Gg: AY/fxX6/kqOntDHSaVYDahjiCJ5GiytHdpN7Ok0HHsBUErSsKhHLz/lFV+hdXrcbz0V
	15NSLwc921YaC37yyY6URTiKTS4rYb6vuK5HCu8RHE9vUD0cfT3XI7kPOZbw5wH15QXUcL9mH6g
	iOSzijg8CkpQkZaWs37QEpMqRiINW9ciGC8aWUyNK/XTMtVQ15kY9xKC4qTxoten015OgG4QZDG
	3SXGiJS6b9MDsRLaXvG8eiA9cimG1yBX0ZGBug9p9EayyEidA+wu21x/sOHzRoWM8lhHU9IIaxG
	VbKTCOyNuO28+L3o1BIKvNO6jkte52B1ut7XcPmR/eZijA2L0uCtOVOFKttPPGcu8JXDT4DGmOG
	EwqQ3sOUw/xZcYFTCSE2c2VQiurUK8SwfJ3k/Lth0yy6U+ZVYr1v8ZFBbRsZVEo9R86E20Lx0hu
	rTVR0xVne5FH1izKYgYhj32T4rNniercGlD8sRJmMAiMx0C6BawKyMM3l9vnq22Q7Hco3G
X-Google-Smtp-Source: AGHT+IGjuIlGhVLGV8y/XU/LQ0KVHoNFed57MFBl0SJ8RGXpjTQqBLrhIQJec3QABMGxBdUrXwOG6A==
X-Received: by 2002:a17:907:9816:b0:b79:c233:c8a7 with SMTP id a640c23a62f3a-b7d23665c82mr1069817966b.21.1765808264061;
        Mon, 15 Dec 2025 06:17:44 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa5d1e89sm1393673866b.69.2025.12.15.06.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 06/17] rtc: optee: Migrate to use tee specific driver registration function
Date: Mon, 15 Dec 2025 15:16:36 +0100
Message-ID:  <6da13fa15497f8bde6e2621ebb11ab74764f890a.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=8xBlw1gjbdzbNdrRW7jRBiV40wdZTcJoR7/j5OL6ib8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhb75mJ64PBhRfXSJJzfGImqsFztPlgX9E8Y hTlBWg5zv6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYWwAKCRCPgPtYfRL+ TsC4B/9HAtoQkHHcfMd9S0b9RyrKfMyDk9Oj7QkjAjCz5NCrRVQJwW1Szu4f0ATJxzGMnnC77H1 KwvApK2BvtqK66JJi96d1LwD0CMVlbji/IB4YsGF/lFpiBHiuBLxd7yg5iXBqvX87v+jorwAq77 7Wsrzaew2TImyvruUOTZwf9M1By1wkdIfaKg+ebLVwVJyWDzPVQxVja2stgsP2pooGyhhLdZeq3 1bdSzHk0G5rWmqfCtivdifouKeQwshMxGn5u8XcYMBmeMTG4f/1MkBa/X1Ri56FGv0VX+YiRyHY qbYRrIwYVd21yg9XFfq6shF2miyMo1Te9ZxC4KQ6IdyupLqK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee subsystem recently got a set of dedicated functions to register
(and unregister) a tee driver. Make use of them. These care for setting the
driver's bus (so the explicit assignment can be dropped) and the driver
owner (which is an improvement this driver benefits from).

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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


