Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B716FF8F5
	for <lists+linux-rtc@lfdr.de>; Thu, 11 May 2023 19:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjEKR4x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 May 2023 13:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbjEKR4s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 May 2023 13:56:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13387ABB
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:19 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so81794878a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827776; x=1686419776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwVqstjWFn+Zamz+w/FH3E3T1HT4Og6RyODIsPtaoto=;
        b=HPAIRbNcmwukj+6QYxYbXl+oL7vPWFhnv0/8ihw9Vr3rezNdERj2UnpCM+ahT1b7Bb
         wbF2HDPc4sCY2ur+68TebefLrejhDRCMIC679rgzJZ3bNTyo3Htm5BeYRPrUp/Qlbttd
         ZuzdTQ+jOVhtssXisOdNHzqLhAs449PPIn3yHpvzm4HV16WKXa8KKW/NKv62jNjD0b6t
         z3fbrEaWJ2VP3BiMO6A+P6YEygX2WLN506QVLf3J6DlGJTjzj+Uo/eDHmPdZ7GSiGmKz
         JtyBm/bTXH2pTJg4ODzE6k/2VWPjThL/scFYszNeTo1glTOMaCmcPlIFY79rE/YjpVDf
         3BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827776; x=1686419776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwVqstjWFn+Zamz+w/FH3E3T1HT4Og6RyODIsPtaoto=;
        b=cFKeQ6kOaSzW04cCGgtv/n+/A+7x5XNMIaB5rUb9/NyP/ki3ZnIwG6PeaIrJ/WFkU/
         OtZkdtxOrzgQ0o2txY6aq6InlWFIvAQXoy6+jpJr+23bmzy9uJ4wOedD0Xj+6FurJBP/
         6qF0RtXah9StobON+7Givmv70cM+hhAldrU6yO6P35O+7rd2EhXGjeRTMqFs/XRqhRn2
         PrMi04BYplsuDByhsgwALNXr7Y5vHkI6PyC0ymanv2YMumSynOJI+SjwkR/jOOgLmfic
         8hsB/fGpDcgTSXRWhhocwhd6BrBegJURmOeqVEobipZ12RW3f3w6x/nIoYGye9BBpFrH
         5EXg==
X-Gm-Message-State: AC+VfDzZkPVabpc4aN7/NzNWsw1B89AQF+oFVSS2IRcfm1/Ag++YZ8rZ
        w0opLRITRYm90eCc/Xv286vInELdsLbKNaaKGsOVGg==
X-Google-Smtp-Source: ACHHUZ6FvDKkCpBJTz1P6urci5I/XEKyz/H1v9WFKWa8X6aAn+12KMTdZtrI8IXPMAYT2V9u6sd8BA==
X-Received: by 2002:a17:907:e91:b0:967:4bc7:38c0 with SMTP id ho17-20020a1709070e9100b009674bc738c0mr13383700ejc.9.1683827776562;
        Thu, 11 May 2023 10:56:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id lf23-20020a170906ae5700b0094ee700d8e4sm4247029ejb.44.2023.05.11.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 4/4] rtc: rv3032: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:09 +0200
Message-Id: <20230511175609.282191-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511175609.282191-1-krzysztof.kozlowski@linaro.org>
References: <20230511175609.282191-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-rv3032.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 1ff4f2e6fa77..7b36e7f125f7 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -842,7 +842,7 @@ static int rv3032_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return err;
 }
 
-static const struct hwmon_channel_info *rv3032_hwmon_info[] = {
+static const struct hwmon_channel_info * const rv3032_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST),
 	NULL
-- 
2.34.1

