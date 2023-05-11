Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3C66FF8F6
	for <lists+linux-rtc@lfdr.de>; Thu, 11 May 2023 19:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbjEKR4y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 May 2023 13:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239026AbjEKR4s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 May 2023 13:56:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18549026
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-956ff2399b1so1690593566b.3
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827775; x=1686419775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq3xdaWbI38VbfHI2H2l4imhWRTMT3X9WaNVdUPW3NQ=;
        b=hE2R2qAE+wJQ4exZRg2a7m7xY99SkSY6KF/r1j4oNUbZEMCqiDRKPbV0hbR5WXOYcw
         mz27le+L37SqkFA4ytw7VHnUlE402c1xJ1JxCarYIZ4t7rU+B2YNfyLivGu8nqCQPH8R
         n56myZts5jZTdiy25B9/j0mEd9f7zqcfep4BcoalLEQCpbZsJAVrSs79KwX27LWLYsYl
         lKU+bBd8q/xZJatUPahBnRdGNSTm7VoD88Iyo5GbqGrI2jKFofuxUu/e47Pcs0I01+GU
         ZKhI39Qrl6B4psVgUsRyH+ZRmMDrjwJ+Kw6BhngPTXgVOTmsb0TGYs/UswAEFWNuEu1k
         dSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827775; x=1686419775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kq3xdaWbI38VbfHI2H2l4imhWRTMT3X9WaNVdUPW3NQ=;
        b=W9X1squdUAZPUPX3Y0hVm9lfKQuKAHFNWIC9TO92uWvEts42zDMOHJg6UTcC4xseVa
         tms9e+hFtm6oYIAGzNz9d+CZhRNNupUSanN/yz3Snp1YOsYNBPbuHI4uhGa3V7zpKk0G
         vA+YgpPm7tW/D9hVJ0VtV7wBsY8qCJX3vzoNkEf9OQjFz8DpMQ1QTnnnCSlhCGYLC6vc
         n6QywRaJgv4jxVKDaQj6cLD2qcScsA2wjUm8AwW7hcn792PIN9ACyFiwESwFdhl6oo1S
         Tk1/HCrj4+UrbjUF01G1XXXBLBKg26+/48f4g2ewMBvT0kORnryKBxliyhN8/iZRdUxC
         2GaA==
X-Gm-Message-State: AC+VfDzCrMgLmTxP5voEB4a/wbyFQisjmE14brMDi4UKeO9p3/tUYBfY
        VC+zZ6hRaJCTqZQX1P9fjSfGXw==
X-Google-Smtp-Source: ACHHUZ5TbI5yiZxzcAVL3WTsRXuiksWbaxiLOHY/lXw+vzlHCKWlwKQT6uqTl3XSx4urMCkxZbmTzA==
X-Received: by 2002:a17:906:d542:b0:953:7e25:2156 with SMTP id cr2-20020a170906d54200b009537e252156mr19528034ejc.51.1683827774746;
        Thu, 11 May 2023 10:56:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id lf23-20020a170906ae5700b0094ee700d8e4sm4247029ejb.44.2023.05.11.10.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 3/4] rtc: isl12022: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:08 +0200
Message-Id: <20230511175609.282191-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511175609.282191-1-krzysztof.kozlowski@linaro.org>
References: <20230511175609.282191-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/rtc/rtc-isl12022.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index e68a79b5e00e..eef66453841f 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -89,7 +89,7 @@ static int isl12022_hwmon_read(struct device *dev,
 	return -EOPNOTSUPP;
 }
 
-static const struct hwmon_channel_info *isl12022_hwmon_info[] = {
+static const struct hwmon_channel_info * const isl12022_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
-- 
2.34.1

