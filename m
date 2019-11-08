Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71FAEF3CC9
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 01:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfKHAVT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 19:21:19 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46472 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfKHAVT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 19:21:19 -0500
Received: by mail-pg1-f195.google.com with SMTP id r18so2953315pgu.13
        for <linux-rtc@vger.kernel.org>; Thu, 07 Nov 2019 16:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sUrg1u1IWK1tNm4u5aLXFT6bLOic6TyvKqwrmKQXTKY=;
        b=GSCyg2730CUffuEbQxyhA0hL+x/P5Re/HTn4gZ0iDUDtpd/QgJcGpoEEQKVCouzenv
         MMnBHbDcWA13vg235x/x+4l3coMtGzAlSvLzhwHFMlVPL6SyUDgOjqtp7igjO9kHezeH
         TY3e5VZcHGUE9k1UY1sslLBhZC3InNhXLwefPOyhsSRdO9X1fXUwdqnlq42/FQttxukh
         wbLshorzF7MOvbkse61OWJ4OhxqEULEct6TMAmpa6TI/svfzhZIRzGsQUN8kyK12FOae
         wcnkonv72gMbz3M7jGgdPQi0OjOmkDqw3sO/kE8dBj5e0l+UEtrlWrj/7Rz+crbdLgv5
         w55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sUrg1u1IWK1tNm4u5aLXFT6bLOic6TyvKqwrmKQXTKY=;
        b=LCahgMdhypk3Tup8ijBR3hxzHcv9jDBcez7ZB2c5lgo/MY4LXne0DLtRMh7PTELsDq
         3L5p8ayW7w2k06pXu0L14manvURluXbRFYB6Hbc4uMnD0mz4exGbAXAhoekkgy4AsPy7
         6sfqA4IZWCLv3bsB3LUVzkqUVNUG6Uk8+ByLU0SnaCDu59GtGTgTBB1422FV/e2X1mqB
         8tXlbu3n+6CwxNisQ1wsDobMWeBXyzshPNgKEcnmW+TNdTfXyrMg1unZih5eRcTJPC3E
         PAw4xlDraalRE6l7wEtc/UXZDOj+spLXqyklVUb34tivn/SHSaxFzE30g7NzIl99wvOw
         zIKA==
X-Gm-Message-State: APjAAAX5JszQwwaSGWKhwLXobhR4jAERP4zWfHypJS3rv2uQccoSP9zg
        uGK50IUo29KHzb7S0kpn9WS64rhUlw==
X-Google-Smtp-Source: APXvYqxjaJNWJwDV/48YAJOrnj0vROF7RGHn2LUrOyPdXmTeKu13gtIh9SClDp6/qeHODTucPeQRyA==
X-Received: by 2002:a63:2066:: with SMTP id r38mr7904779pgm.229.1573172478143;
        Thu, 07 Nov 2019 16:21:18 -0800 (PST)
Received: from localhost (b152239.dynamic.ppp.asahi-net.or.jp. [202.213.152.239])
        by smtp.gmail.com with ESMTPSA id w5sm3892605pfd.31.2019.11.07.16.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 16:21:17 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, val.krutov@erd.epson.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: rx6110: Remove useless rx6110_remove
Date:   Fri,  8 Nov 2019 09:21:13 +0900
Message-Id: <20191108002113.14791-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rx6110_remove is empty, remove it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-rx6110.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 71e20a6bd387..4586bf6003ca 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -370,11 +370,6 @@ static int rx6110_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int rx6110_remove(struct spi_device *spi)
-{
-	return 0;
-}
-
 static const struct spi_device_id rx6110_id[] = {
 	{ "rx6110", 0 },
 	{ }
@@ -393,7 +388,6 @@ static struct spi_driver rx6110_driver = {
 		.of_match_table = of_match_ptr(rx6110_spi_of_match),
 	},
 	.probe		= rx6110_probe,
-	.remove		= rx6110_remove,
 	.id_table	= rx6110_id,
 };
 
-- 
2.24.0.rc1

