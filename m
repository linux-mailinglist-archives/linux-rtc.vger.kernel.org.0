Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295276FF8F4
	for <lists+linux-rtc@lfdr.de>; Thu, 11 May 2023 19:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239076AbjEKR4w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 May 2023 13:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238950AbjEKR4p (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 May 2023 13:56:45 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D42C9ECF
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:18 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50be0d835aaso15864114a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 11 May 2023 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827773; x=1686419773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blxzVw5ZIRppHWsDqH1Uz1DLv37Tw0S0eWN39CE26xY=;
        b=PCiS09Mtp3jTfvU/PIeslpOX0gEXgltnNeOCp7MxNnmSaPrQ4IDqlpIacMJ8KyUWvh
         m+ClNSoIBsenJK6wexQCrgc/tj9WbbRW9pOEfDzmyKi8Zz6MKTuq0uol6pJZcIp2bhYw
         rd61WY7zODd4R4K8Opdlto7PP482k7XCGS+3WESaZ0Mxg263s09THRNVoV45JFELDv//
         5qIFmN/Es1kxRIUKa9DNdp4URnRoXOwPxNOYTNyj35Ntxr71e8nk9oArhvPTyDZrk+O7
         9l38Ll5UJVeUSQDfXUXCqf9rI3PcAu4TtzUkbQJ7wL6ZPkzVLNpEANi8QWmMaMHe08VV
         FUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827773; x=1686419773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blxzVw5ZIRppHWsDqH1Uz1DLv37Tw0S0eWN39CE26xY=;
        b=Z5wJ8d0a80WlNVZYazxpm40rX3kpuPpf1eXxq5ZS1gYURFXRpGZLOX23Loqvwxek9j
         26Cw8+NK/vkDnQeQ8EBNYNz2q1j7QAma3086zuZE2a8UnzJYHAf21iUne4AyRCIbgLi7
         HleUCvYZoDsp7QRe8hqIFPYEhmZRY+H4TPSSzxUlo329cFKQTkxAXqLIJgOsp4UrtOAZ
         oXnyztVu1CruYPmnxHH1mjp1NjGxX7It3F+0rI/ArzlQfuUeKl67Sk618FGDwROUnuyT
         iTsHOQzUWJk0cKfrB7B2CNWZT1CURpu0HZQy/fsZeJpPSWvtYi6/h6KHUlmTdQmPm8u+
         /W3Q==
X-Gm-Message-State: AC+VfDwlfW2zncLSjE/5FFrKvFdzkVkW8WmirVxj34+Azbvxz3M0Rfcf
        Mj9ud4WGcaoBgDJGK5u4H0wRlw==
X-Google-Smtp-Source: ACHHUZ62nod24sIcYklrKeiETNWewOdWZVgMa8O/DUFPIND2jx1iCiGcnKX2rRP63Doav9NoiaI5kg==
X-Received: by 2002:a17:907:3686:b0:94a:56ec:7f12 with SMTP id bi6-20020a170907368600b0094a56ec7f12mr21091597ejc.30.1683827773470;
        Thu, 11 May 2023 10:56:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id lf23-20020a170906ae5700b0094ee700d8e4sm4247029ejb.44.2023.05.11.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 2/4] rtc: ds3232: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:07 +0200
Message-Id: <20230511175609.282191-2-krzysztof.kozlowski@linaro.org>
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
 drivers/rtc/rtc-ds3232.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index dd31a60c1fc6..ce46016c9fd8 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -359,7 +359,7 @@ static const struct hwmon_channel_info ds3232_hwmon_temp = {
 	.config = ds3232_hwmon_temp_config,
 };
 
-static const struct hwmon_channel_info *ds3232_hwmon_info[] = {
+static const struct hwmon_channel_info * const ds3232_hwmon_info[] = {
 	&ds3232_hwmon_chip,
 	&ds3232_hwmon_temp,
 	NULL
-- 
2.34.1

