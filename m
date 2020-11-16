Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1722B49AD
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 16:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgKPPnO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 10:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbgKPPnN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Nov 2020 10:43:13 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E713C0613CF
        for <linux-rtc@vger.kernel.org>; Mon, 16 Nov 2020 07:43:13 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id q7so8925308qvt.12
        for <linux-rtc@vger.kernel.org>; Mon, 16 Nov 2020 07:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IQokPdFEZfluC4ijyBw8XznizMKctgFn2XHTZjld/Hc=;
        b=CO3tgbD5dc7CSfnFvzvN/c0PQBY8gt5CwbauNJfpbrxHUJpOLzowfVBxV1LEaDpXu9
         rosuKuUzFdbNMTf2IipU/DF0d7PJWUpLj1ou3Mg0z8kNMxTtTguAeiD3x9NkO0eDefHE
         azGuuCoWretqF2WBjt3ua79tueb+Em5P+zBpptsG95ZfT/wAF5p6hv0N+uybHGZOts3V
         jA8Mc0bsQEqXBLKHB8Uf/u7FvTbBvOBdisvS+5fqtP8LsiTiG9cgX2/0UWamtC5K674Y
         OGrawicUwC77js4Zp7Imq+uwtC1HISrZrwffI9hF+KbicX+WWuacXQyNFVViUhysvZLL
         CcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IQokPdFEZfluC4ijyBw8XznizMKctgFn2XHTZjld/Hc=;
        b=oepUNQTXIpOeMaAiyg2kszPHP5GKPufQBCDyeEc5tU+IoSPbNqMyvGKWrBa3mqLQlK
         OhpCeoVJo1MSbyMtjFK94XRVat9Zo3/1WEUvBZ1/eNMWRaAQ1zMjlFvz9NPsqS24N6Jm
         lYrH11eLelrrl4zfEXbuCqADtvXZSThYXuk/7zpclKowdV91umB1Nif6ti4Rs6h8gCDf
         EXmyGO5rWyJTGnsqEhTsY3kiZWBaWXr3uytpBiAnapprwHBKbH9kH8EsWQKl7MK9Tkv3
         f1qIwGuVKoXzEYJGNUQGvjl6Iz8uWBG8OmtsULZLwFiqQM8wB3u/51prE4E4QSfwAtgm
         2xYg==
X-Gm-Message-State: AOAM533nV+6eSjMnpjpRK4vHQ2j29dxKGroyUP1tLNF8/xXts12yYrG1
        qWsI0l+R40+hkpYbLxZp4n4=
X-Google-Smtp-Source: ABdhPJwQhamC2aeq6ZkH94NzcBfvlaF5z4/0ojpaWNXPh9Zj0MNMa8NBFBScGKZYiNo9BB18NZq0tA==
X-Received: by 2002:a0c:f9c8:: with SMTP id j8mr16581048qvo.17.1605541392272;
        Mon, 16 Nov 2020 07:43:12 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id x5sm12873960qtx.61.2020.11.16.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:43:11 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] rtc: mxc: Remove unused .id_table support
Date:   Mon, 16 Nov 2020 12:43:03 -0300
Message-Id: <20201116154303.15055-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
.id_table support in this driver was only useful for old non-devicetree
platforms.

Get rid of the .id_table since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-mxc.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index a8cfbde048f4..78d7fba00895 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -70,19 +70,6 @@ struct rtc_plat_data {
 	enum imx_rtc_type devtype;
 };
 
-static const struct platform_device_id imx_rtc_devtype[] = {
-	{
-		.name = "imx1-rtc",
-		.driver_data = IMX1_RTC,
-	}, {
-		.name = "imx21-rtc",
-		.driver_data = IMX21_RTC,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, imx_rtc_devtype);
-
 #ifdef CONFIG_OF
 static const struct of_device_id imx_rtc_dt_ids[] = {
 	{ .compatible = "fsl,imx1-rtc", .data = (const void *)IMX1_RTC },
@@ -438,7 +425,6 @@ static struct platform_driver mxc_rtc_driver = {
 		   .name	= "mxc_rtc",
 		   .of_match_table = of_match_ptr(imx_rtc_dt_ids),
 	},
-	.id_table = imx_rtc_devtype,
 	.probe = mxc_rtc_probe,
 };
 
-- 
2.17.1

