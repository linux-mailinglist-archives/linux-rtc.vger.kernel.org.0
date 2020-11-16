Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835D42B4ECE
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 19:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731235AbgKPSDh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 13:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731246AbgKPSDg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Nov 2020 13:03:36 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3DCC0613CF
        for <linux-rtc@vger.kernel.org>; Mon, 16 Nov 2020 10:03:36 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id z3so9938553qtw.9
        for <linux-rtc@vger.kernel.org>; Mon, 16 Nov 2020 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uhhjskNczt6EXJpCT6nl1R8+GBTmS7Y+GAifabQrLTM=;
        b=LvZfRF8PLDGQQ8xnrYGPJ2UfRFGvy2IC8FwZQXLccMOdC0We4Bc/tpjIjHQuy761l4
         ysVdLW1AbgJEjyz8NA8leYheMRV42FtG7kJcBE6r4qsxGnNEGKUQGJUpPHFFRX7Xa3Jj
         k9BHQjf98aFKf8rOkYtqFD7C/6dHcaA10Rrl8YbZeA7d6cgegz3h6UqzZfI4gYnTsXPW
         kzQmmVh98/y8bGZzeoDSpxEMC74+63Nsmpo3Cv0N2NluRGRwTUhld0bBhEsaKnBWicI/
         lL1dOGKvkjhDHU6ZPLtMNx32d0dhuK12LRoNXfmDS0ZANM86LT0+I3B2/O6eCLdWhGIc
         eMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uhhjskNczt6EXJpCT6nl1R8+GBTmS7Y+GAifabQrLTM=;
        b=dGbpn8Esj686k+R3lZMppGAHs4yGy+m1Qp5LymJnTTqjny5p+oA4fhUdQMRkW4jam6
         Kt9xeul04BZLFZDLho+yjwXk85mvVKZmZESw8HUaMffGF/H4f7k8SJg5PEZV0fe0ucm6
         xPWFfzoaYWfIGRSoj1VG8jmySowcpFmZ6UnOObyXOGkfWeutC2XR3KxsTuCQ6MMJhZMV
         naiada36c3hNaJvn8q/HpZAqhzHB75atwJNdr+u+NRyO3LIefCb0mm6ootkH63N/wCDk
         RdKVbRkuv9FA+UrLCvrdYGZY0RkqnTaJI/yTsAjKZLGbgsjnvdJplD2PdFaYaI/Tn2AM
         nyYQ==
X-Gm-Message-State: AOAM532M6EE29E7/rOWorcBv92wTWPYHXYb2WJjH9sRIC2tV4FzvwICH
        6mo04Qsgg/v1umnXOoKCWYI=
X-Google-Smtp-Source: ABdhPJw2D2rpc1+YfQxak0dRSVg0ypOLuOStSbpDXeai4Zxq6JM5CodFkk/PqELqVCDqqHkS6ZnM6w==
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr15043721qta.309.1605549815787;
        Mon, 16 Nov 2020 10:03:35 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id e18sm13227697qtc.39.2020.11.16.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 10:03:35 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] rtc: mxc: Convert the driver to DT-only
Date:   Mon, 16 Nov 2020 15:03:26 -0300
Message-Id: <20201116180326.5199-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
by removing the unused non-DT support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Remove CONFIG_OF ifdefery - Alexandre
- Remove pdev->id_entry->driver_data non-DT assignment

 drivers/rtc/rtc-mxc.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index a8cfbde048f4..018bfa952d66 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -70,27 +70,12 @@ struct rtc_plat_data {
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
-#ifdef CONFIG_OF
 static const struct of_device_id imx_rtc_dt_ids[] = {
 	{ .compatible = "fsl,imx1-rtc", .data = (const void *)IMX1_RTC },
 	{ .compatible = "fsl,imx21-rtc", .data = (const void *)IMX21_RTC },
 	{}
 };
 MODULE_DEVICE_TABLE(of, imx_rtc_dt_ids);
-#endif
 
 static inline int is_imx1_rtc(struct rtc_plat_data *data)
 {
@@ -329,10 +314,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	of_id = of_match_device(imx_rtc_dt_ids, &pdev->dev);
-	if (of_id)
-		pdata->devtype = (enum imx_rtc_type)of_id->data;
-	else
-		pdata->devtype = pdev->id_entry->driver_data;
+	pdata->devtype = (enum imx_rtc_type)of_id->data;
 
 	pdata->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->ioaddr))
@@ -438,7 +420,6 @@ static struct platform_driver mxc_rtc_driver = {
 		   .name	= "mxc_rtc",
 		   .of_match_table = of_match_ptr(imx_rtc_dt_ids),
 	},
-	.id_table = imx_rtc_devtype,
 	.probe = mxc_rtc_probe,
 };
 
-- 
2.17.1

