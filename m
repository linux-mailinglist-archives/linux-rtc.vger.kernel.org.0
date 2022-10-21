Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D77607365
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiJUJJL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 05:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiJUJJA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 05:09:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197541A3E01
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 02:08:58 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u10so3877493wrq.2
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=BU5GmauMtsJbxzoW3M8HF62Q7USBINYhrQ/egAo+/CMIP61fhSf3FXUMjyVSa2WBHf
         /Z4PSiX8Xd2LX1WvsFq28WsS4NeInp94H8nMYbEoyqo3CsGilMXyp0BLuG67ON5Yl6jA
         BXpRk5f8ERR64ZlctzLNkyf15csMfMS4E/axdBE5wsr5RGg7VB1k0v15MSHJIX1vFcBH
         8MYKuet44iMzdgqvU1gXl/i4wqanCCuXQ9v768QOOS8s2/pHu99rk9B5HhHPoZeDExx2
         ubfnNxhGHUTrAs82eDdt13qz+lkgGzmspxCUMQ8gWpJ2tb1lUvX0zPvuiHw4oNdT3chn
         oXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=QDee99DHrD2KR/YDFOC3asquKLorqtYDj85NN/+Ezdx9ZOUJVVBiWAxtPeLCSJXzYP
         LqpTv1xfaq5zkT+KhNFZUAb6eAdvOrvaOtH0ALmF2xz8ozOPbiwI1iQ//OfUavYhG8/B
         T8gVWadeTVhHU+CVLVyxe+KnGnJXrM37qK1aygK6nxoJTOPdJW8GifkGtd4r0RkymqRV
         ofDu1bB63cWxLJbIjSqSURXv+5vCnVzyPWhCP4zXb5EsIyRAKhS5+g5xtS+rMMeC5QSQ
         rg+Dw+K4F4X4EinhzEHQY8hLi5spID3cU8hb4/TBohT2iSskc7HfbwLZeVUuWcBaZzMK
         oVTQ==
X-Gm-Message-State: ACrzQf2Q9zE3bZcPPdg/1t3QwPlHbnNyJ8sn5f9lTXBtDCRM7ttT72g6
        NAujAXKcbPVpFoc++beeSKYnuA==
X-Google-Smtp-Source: AMsMyM4vO0yNr28tbHpM8g1MSlGVGP7Vj5xzvPmdhEoMPgTUDOfA9SeFrlyVcnh1b4YCh9ibtT/C2A==
X-Received: by 2002:a5d:63d1:0:b0:235:9aeb:e365 with SMTP id c17-20020a5d63d1000000b002359aebe365mr5572793wrw.77.1666343336475;
        Fri, 21 Oct 2022 02:08:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:56 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:44 +0200
Subject: [PATCH v4 08/11] mfd: qcom-pm8xxx: drop unused PM8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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
 drivers/mfd/qcom-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 2f2734ba5273..601106580e2e 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -497,7 +497,6 @@ static const struct pm_irq_data pm8821_data = {
 };
 
 static const struct of_device_id pm8xxx_id_table[] = {
-	{ .compatible = "qcom,pm8018", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
 	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},

-- 
b4 0.10.1
