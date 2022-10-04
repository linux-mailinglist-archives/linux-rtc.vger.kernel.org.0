Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D295F3DDA
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Oct 2022 10:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJDII4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Oct 2022 04:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiJDIIj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Oct 2022 04:08:39 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E83F1C91C
        for <linux-rtc@vger.kernel.org>; Tue,  4 Oct 2022 01:08:37 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso9813621wmc.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Oct 2022 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=qZ19bsx/kaW5RSDlaveR/Z1oAoKv9fyzJ240tQu1a9s=;
        b=wpyNA+Q3dmNDSH54NYgAELyzeib0IEOVsF6nbjCLXTfb9wBTET57L2josQcJXuqA0E
         K6nJxHko8cIkjsnUD8tiJe8mTZsKy+SO6TpkN5UR3uuPSRAgDuW0TV4KtUGMJjTw8fLg
         ZUZEB0vB7+dM+5X2lZNOK72DLwCzt5gRN0nrqknMUAZHKzJxxA9fGXTBGOsJo7f5DC5j
         nehhYtTyeFFl8lQV1MEyAvkg6CkMddVJsuLuwtvX5t+Jdr72b7sFw8wCEnBhDwsgy8fD
         6qBgaoOa6hvnS0YHuAcK6JqmziXF3VLhtTbtNADZKHv4zDJvRvrus1A2YemhXurs/2nr
         Ry/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qZ19bsx/kaW5RSDlaveR/Z1oAoKv9fyzJ240tQu1a9s=;
        b=WkCqmrjV9P+th8kPXPOHLC51s2quNiujkhlE7tOhh8GCNhUVrWkwhU0UNh6BNafyOl
         2jS/gy0uPJqehvY3ClZ54oQdV9/iUYy+jDnUwEj+ztRK1w2Y6F1zIlR3J9fO98zM1uDV
         zOlTOSGbBWrEn+dbTcNJM6HwzZ3MMll3quveRKdGSSKEu9XfvJqcLwXjC3hycUzvlQCl
         osbwFB6VDZN63UHVNx0WtwcUZjcW7uZiki6kuq5iQjk3e8IY94ne8NOLXkxba4KmNqwP
         /da5riD8YwFnkeEETS6tY/HmMtaLv0bptbhBeZWj/qzGb5iDSzfBEPGwSi553iUVCxcE
         JDfw==
X-Gm-Message-State: ACrzQf1xTQTmRO9Fs5iVy5aLBgBdnnxdMDlx/5clUp2TCeErO4nXg0Ms
        YQaVChk+AoWzr8wk+EgRWk4i5w==
X-Google-Smtp-Source: AMsMyM5JBji6og2zUI0F155nozCgsevHcka5zAZ8mXvn02oWmuomNow9V4CUQM/TC/MALKgVWwIVeA==
X-Received: by 2002:a05:600c:4f82:b0:3b4:a6fc:89d2 with SMTP id n2-20020a05600c4f8200b003b4a6fc89d2mr9245861wmq.53.1664870916439;
        Tue, 04 Oct 2022 01:08:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003b33943ce5esm20228866wme.32.2022.10.04.01.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:08:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 04 Oct 2022 08:08:27 +0000
Subject: [PATCH v2 11/11] arm: dts: qcom: mdm9615: remove useless amba subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v2-11-87fbeb4ae053@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The separate amba device node doesn't add anything significant to the
DT. The OF parsing code already creates amba_device or platform_device
depending on the compatibility lists.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 9d950f96280d..482fd246321c 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -314,49 +314,43 @@ sdcc2bam: dma-controller@12142000{
 			qcom,ee = <0>;
 		};
 
-		amba {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			sdcc1: mmc@12180000 {
-				status = "disabled";
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				reg = <0x12180000 0x2000>;
-				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <8>;
-				max-frequency = <48000000>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				vmmc-supply = <&vsdcc_fixed>;
-				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
-				dma-names = "tx", "rx";
-				assigned-clocks = <&gcc SDC1_CLK>;
-				assigned-clock-rates = <400000>;
-			};
+		sdcc1: mmc@12180000 {
+			status = "disabled";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			reg = <0x12180000 0x2000>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <8>;
+			max-frequency = <48000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
+			assigned-clocks = <&gcc SDC1_CLK>;
+			assigned-clock-rates = <400000>;
+		};
 
-			sdcc2: mmc@12140000 {
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				status = "disabled";
-				reg = <0x12140000 0x2000>;
-				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <4>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				max-frequency = <48000000>;
-				no-1-8-v;
-				vmmc-supply = <&vsdcc_fixed>;
-				dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
-				dma-names = "tx", "rx";
-				assigned-clocks = <&gcc SDC2_CLK>;
-				assigned-clock-rates = <400000>;
-			};
+		sdcc2: mmc@12140000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			status = "disabled";
+			reg = <0x12140000 0x2000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <48000000>;
+			no-1-8-v;
+			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
+			dma-names = "tx", "rx";
+			assigned-clocks = <&gcc SDC2_CLK>;
+			assigned-clock-rates = <400000>;
 		};
 
 		tcsr: syscon@1a400000 {

-- 
b4 0.10.0
