Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64171600B5F
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Oct 2022 11:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiJQJp5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Oct 2022 05:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiJQJpn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Oct 2022 05:45:43 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7996852802
        for <linux-rtc@vger.kernel.org>; Mon, 17 Oct 2022 02:45:39 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso9553574wmb.5
        for <linux-rtc@vger.kernel.org>; Mon, 17 Oct 2022 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQluJxl/klXvfXml78hOzw/XTHtauRqRbRJ9oGeE1vc=;
        b=b3E+FamxdKtEwlcfgVz5A0x3glVjT/g6IjEm4Gs8IoxWdx1uRxEqUKEVMiBA+uMeAe
         BKhkW+i8SBUwRuvR3mk4XK0cFfqS9rtLxoFjvDJn6CLypmj3KLRUgWNXaOIWZaSdH2jz
         Zd0nrKA6FM4UHkH60bhV04nEy3CeunN2M5zDT9dlb/OXZZ3pbJoO5Mw+7lkVaUwn7Vr+
         F02Nng1Y3zIOG8J2exjdtO1uAF5iXa0ZNOu38qDa3vGowp5TO/CyvsZ9RQMm4qTs2nIB
         QcMyh3IEmuU3CLuIfJYXTrEI3lM1HTuYM7cL/IkTtqchrqg/8Xcoe6GT18RPcASMfuul
         5vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQluJxl/klXvfXml78hOzw/XTHtauRqRbRJ9oGeE1vc=;
        b=HKbSzMlpsmpQO5JjLiUdMYhVx0Tapr3STnvWEpzEZItYHjtwZjhax9urbAI8+r/mGi
         bwrW5r2GyqufdBkVilbyL7yW3oAAdB33BqzRkC182UA27RFzGHKLOWVauD19TiD1tVRJ
         7uAr7m8zwM+SnjFjZ00jTqgduHPjMsDnOsuBmVCpM9gquNwRFhMXMUbcbUKfCUan7yEI
         gfhg2kax+/G+gl+p/Heky4VpreJj3KKS5vweMzMDJ5DVVwI7uX0YC8j8SPdkwvprMmUq
         REeGY9tWE69pHloqnwZTuSwp8vLPxYZa0OHI+SKtFARn0L/QGBT0fUz111RcSH62GGKr
         3TLQ==
X-Gm-Message-State: ACrzQf3VLRvvkkP1BasR8E244BfAu4cTx5+EDoHRVQLsl6DeuWD8C07l
        WsoK0Gc49aqzeYiL8p+QaHRSwQ==
X-Google-Smtp-Source: AMsMyM7zKGLo9KF+/sGqvsaN3PpizZtPfa0smIAa1BWv87B/7ovBxLhavcFTfbZYjZ/IyFcauhYzUw==
X-Received: by 2002:a1c:7716:0:b0:3c5:6e61:bd1d with SMTP id t22-20020a1c7716000000b003c56e61bd1dmr18538568wmi.17.1665999937704;
        Mon, 17 Oct 2022 02:45:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b0022ca921dc67sm7824305wra.88.2022.10.17.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:45:37 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 17 Oct 2022 11:45:34 +0200
Subject: [PATCH v3 09/11] rtc: pm8xxx: drop unused pm8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v3-9-531da552c354@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-rtc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The PM8018 compatible is always used with PM8921 fallback, so PM8018
compatible can be safely removed from device ID table

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/rtc/rtc-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index dc6d1476baa5..716e5d9ad74d 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -461,7 +461,6 @@ static const struct pm8xxx_rtc_regs pmk8350_regs = {
  */
 static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8921-rtc", .data = &pm8921_regs },
-	{ .compatible = "qcom,pm8018-rtc", .data = &pm8921_regs },
 	{ .compatible = "qcom,pm8058-rtc", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8941-rtc", .data = &pm8941_regs },
 	{ .compatible = "qcom,pmk8350-rtc", .data = &pmk8350_regs },

-- 
b4 0.10.1
