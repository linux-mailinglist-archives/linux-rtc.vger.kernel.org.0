Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89ED5347EB
	for <lists+linux-rtc@lfdr.de>; Thu, 26 May 2022 03:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345655AbiEZBPQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 25 May 2022 21:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344426AbiEZBPN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 25 May 2022 21:15:13 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9922B972BB
        for <linux-rtc@vger.kernel.org>; Wed, 25 May 2022 18:15:11 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-d39f741ba0so550185fac.13
        for <linux-rtc@vger.kernel.org>; Wed, 25 May 2022 18:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/L+ULNoH0Jr8ZIXvSTcwS379FOGyICNt1gezCJsi1w=;
        b=Fs3G0dq0DjlnxyUvLl1QO9zpMM3E3qbFDd4glvZvYeTClpZH2zjUJpRdN/af+v4tU8
         oNrNsR9HFsdRKiMP78R64m6M5UFOEPxUml7wioLvw1BaOzlFt+VmBLzhW2NaFznTqsH2
         K+U1ETWkaC+wdm/K4hRq0Ho05n+NfhBM1gFUdIAsE4t8i/TNYwI84Vl4KcfdkizGc1Qn
         kE+BhlpjmzimayQU+uxQ9y31X6Rh4pKuk8AAV2d/IsfckoZw69A0DfoQKEd0iuckJBxT
         E2AfW5upBLHUlR7oICgtcAQRQ+H7AHgF7TSjXZIimT/Zl/Kj1t4wXnHqwrx33wOStrwl
         //dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/L+ULNoH0Jr8ZIXvSTcwS379FOGyICNt1gezCJsi1w=;
        b=s6XVkh4TH1xVnSoK8aOMBWTu5yMekohb/5I+ozgzxK5f4PCS+aLELY+IMpcRcbbUzc
         +Km/vPF70xSZ0HcI8ar4GuqL/Vd0xme8EDHLfZDxHNq6dDynd5tql1UiRHV1aeSfWXWJ
         gZ6QzjMsIBl2Ve63KoSEj2dsiFxe80RJ5JMBdU+/t7hx/8qycBdvPfDh8ck6ZUE7xiDr
         vpNqWzVTb8swYG46JKApAirS8wnNdAwKxB8PLF5Lflb8s/WIHN3AWgafGeIdRpEWq0EH
         0Z6AkNAV9+LYBUYB8wB+8Y8BT8CwNJnvNTJCdWZiFRshjt3EKIz0QUObERjbWjUVb9oT
         9S4Q==
X-Gm-Message-State: AOAM533X31werCfOoYrEVLMFrl9+SPZUO2QV/eJzL7RGmfBAg9+b7hGs
        Zj11JptzqQShajKoWAIBQx8=
X-Google-Smtp-Source: ABdhPJyl319twJGXh1ZsS2EcS222iaadSOKWQ5xn5yJUooOrdhwEIE6r1ODpQ+wnU9KBqUfY0cxe2Q==
X-Received: by 2002:a05:6870:4581:b0:e2:77aa:54ac with SMTP id y1-20020a056870458100b000e277aa54acmr7462042oao.190.1653527710947;
        Wed, 25 May 2022 18:15:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:8e74:fc8e:b11f:9d42])
        by smtp.gmail.com with ESMTPSA id b8-20020a056830310800b0060b1f3924c3sm98625ots.44.2022.05.25.18.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:15:10 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     nathan@kernel.org, linux-rtc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] rtc: mxc: Silence a clang warning
Date:   Wed, 25 May 2022 22:14:59 -0300
Message-Id: <20220526011459.1167197-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Change the of_device_get_match_data() cast to (uintptr_t)
to silence the following clang warning:

drivers/rtc/rtc-mxc.c:315:19: warning: cast to smaller integer type 'enum imx_rtc_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: ba7aa63000f2 ("rtc: mxc: use of_device_get_match_data")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index 0f08f22df869..53d4e253e81f 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -311,7 +311,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->devtype = (enum imx_rtc_type)of_device_get_match_data(&pdev->dev);
+	pdata->devtype = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	pdata->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->ioaddr))
-- 
2.25.1

