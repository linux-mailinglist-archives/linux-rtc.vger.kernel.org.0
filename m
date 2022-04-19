Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221045061CB
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Apr 2022 03:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343903AbiDSBru (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Apr 2022 21:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343881AbiDSBrs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Apr 2022 21:47:48 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367111B7B8;
        Mon, 18 Apr 2022 18:45:07 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w127so16633591oig.10;
        Mon, 18 Apr 2022 18:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bmNsqatsO/XUCGMhgB0TSts2yddbxUJSl9qohJ18vzg=;
        b=CQx6aS7IMGOVDPzdits/GGVrzQ1j38Zd1c3T1KicRpuWUxDZfAf6Di6BlKp+D2ITZ2
         WAEV1V6v8GOnv8P5zbn6yOTH9JF3T+zatx9RiyGqCoyaG4d5hD0rhwd4k3GIk4YujrdW
         M59rtvk5jU/D114nYTgBLXY/uansQyIL7PIBH8fK9ac46A7RZTAOzfWSuVKmyp3rFHxk
         i/4Fiekp0gc0I6ZF4ldR+EUNhcEvZKLXswLyATcvK1p0Sc14FpuNjP2k7IPTrF1sTh/g
         1c2PSKXFUyMAIdBMHPzpK0yhAF/y1ep13BwzVZNvm7kNcBRY1RbhsBZqdG+l3atBGI/G
         YILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmNsqatsO/XUCGMhgB0TSts2yddbxUJSl9qohJ18vzg=;
        b=ovQst44zM8GFDd5lgiIiJur+NACJOjk5fMfYBuQ5bEljDwW6QtfoYaquAKGPzQ62gC
         MKfs9GPiVgNxxSzeJONDMrmep5E1oO9805wAXRkntng1KCGfPX1fJVI4mnQ9ID/B+adB
         HIcRNRz8sUJgPoA2/8qvE+KWMq+gVXvy5HIfQsSlxABOK4k7Vt+jZZCLzmT8MF2+oM+1
         xZi36rmDkH/0bk3NVXSFeFzNyzJgBRCMlPs5p5gduYewmaStJm6b4bt2vfsHa68QzJP1
         rlTAyoVLGWxD1drG6w+iI8ITva92sqa0LZaDYizg5fJieoDWL3x3rPV5DXtdmGRy9y/s
         vLDA==
X-Gm-Message-State: AOAM53067po+z+Dyy05I+I7CnjI7VuJNkgvaDxmZqW8pTypemrjBLvpg
        WocH6mlcCNrFIIHpxiioNNs=
X-Google-Smtp-Source: ABdhPJzyqUqkGJlvZ80R11e0FR6SxEAHttlR36sWTtcG7u7X6FnRbWv5BYeIvmjwtHSz+QnpJL4KLQ==
X-Received: by 2002:a05:6808:1589:b0:322:9102:5503 with SMTP id t9-20020a056808158900b0032291025503mr3332706oiw.68.1650332706530;
        Mon, 18 Apr 2022 18:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5307:398a:5694:27c])
        by smtp.gmail.com with ESMTPSA id os2-20020a0568707d0200b000e42ef7cff2sm4556083oab.43.2022.04.18.18.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 18:45:06 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] rtc: pcf85063: Add a compatible entry for pca85073a
Date:   Mon, 18 Apr 2022 22:44:45 -0300
Message-Id: <20220419014445.341444-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419014445.341444-1-festevam@gmail.com>
References: <20220419014445.341444-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The PCA85073A RTC has the same programming model as the PCF85063A.

Add a compatible entry for it.

Tested on a custom i.MX6SX based board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/rtc/rtc-pcf85063.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 9760824ec199..095891999da1 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -650,6 +650,7 @@ static int pcf85063_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf85063_ids[] = {
+	{ "pca85073a", PCF85063A },
 	{ "pcf85063", PCF85063 },
 	{ "pcf85063tp", PCF85063TP },
 	{ "pcf85063a", PCF85063A },
@@ -660,6 +661,7 @@ MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id pcf85063_of_match[] = {
+	{ .compatible = "nxp,pca85073a", .data = &pcf85063_cfg[PCF85063A] },
 	{ .compatible = "nxp,pcf85063", .data = &pcf85063_cfg[PCF85063] },
 	{ .compatible = "nxp,pcf85063tp", .data = &pcf85063_cfg[PCF85063TP] },
 	{ .compatible = "nxp,pcf85063a", .data = &pcf85063_cfg[PCF85063A] },
-- 
2.25.1

