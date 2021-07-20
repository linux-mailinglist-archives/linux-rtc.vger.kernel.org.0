Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2523D0025
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 19:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhGTQnK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 12:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhGTQms (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Jul 2021 12:42:48 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E85C0613E2;
        Tue, 20 Jul 2021 10:23:15 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m2so26869719wrq.2;
        Tue, 20 Jul 2021 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Irrd4jtOn6498HfdXqzrUQsx/bjOrWlV0M76X3ljkdk=;
        b=D33o0g2qylPxHB47L2iv+w0ysH8u0oV58QeQwMHn2/cJTtBCBqLondU6e4pixdyoFh
         33Or13AQG6UDV/Wyu0Mn4tPp2pLh4UvJ4hbCaLnyiTfcNfwHJvk0MqKSlEqamVYIVeNZ
         RlkkH8GGKFqzcnKJRRjtvrIBalJgmmkZrUB76Okhe5SnwbYCd3FHf+deqGBx1vDuIFxO
         /mTTFtDqHG/1/GzNC0eFWcpyeGD9wsMGaqPUfeepwzXjRlT+Wxve4M/YTv6AUrx/cAM4
         ht+QgV65sOXjgu4PFMJ8F9Bn16Oxj/SopcNUJvvR/bhBVjdeJz9bri9asDaND9wtkhVg
         7HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Irrd4jtOn6498HfdXqzrUQsx/bjOrWlV0M76X3ljkdk=;
        b=oxbWbv5C53V7sPtIxxU1DGxuy1Ci40znD4A6+gLru8U8eEgf6owahUJwFFdimLt28w
         g2ilvqX+bpq6nAym12EQPMU8Mcr/Qv0FRONbDn35L5gJkHW8HEb9P8wX38yBXYKQK531
         E23CJtrx6tFTGwM1NmI4Rs60llI6lu6tVt1kNNI5mulH1ohV9/EtGqbbK1go1GqGXeSb
         yYor7R1nRe4bAkuEr2+hjBw5AIuJIsddIRlwRShFOXHOhxSlchmFN0FwBsoR8LP2zc5a
         oT4Iktzn18Z+3503QjFbpo70nYybJRVSDhwW9cKnPbgxUVDYSEm43didRDyEH9NzfEWU
         jvtg==
X-Gm-Message-State: AOAM531TojI/UAtidRnR1yDegiO/jT1n1//kdNeOUvyqXHaHUr8/7iTY
        oY0xuXQHh0qqLHc/e55NpXk=
X-Google-Smtp-Source: ABdhPJyrV+RcBAPf8vQpCa1Q1/zmv44/OHcaeK45lwFAPyy6HcdPLZqpRZHO37iwQ1EF5NKvPkOA+Q==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr36749999wrn.117.1626801793589;
        Tue, 20 Jul 2021 10:23:13 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id a7sm13899964wru.67.2021.07.20.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 10:23:13 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: mstar: Add rtc device node
Date:   Tue, 20 Jul 2021 19:22:51 +0200
Message-Id: <20210720172251.4504-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210720172251.4504-1-romain.perier@gmail.com>
References: <20210720172251.4504-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds the definition of the rtc device node. The RTC being able to
work with the oscillator at 12Mhz for now, it shares the same xtal than
the watchdog.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 982dba9d28eb..1d4419aee67d 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -116,6 +116,13 @@ watchdog@6000 {
 				clocks = <&xtal_div2>;
 			};
 
+			rtc@2400 {
+				compatible = "mstar,msc313-rtc";
+				reg = <0x2400 0x40>;
+				clocks = <&xtal_div2>;
+				interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			intc_fiq: interrupt-controller@201310 {
 				compatible = "mstar,mst-intc";
 				reg = <0x201310 0x40>;
-- 
2.30.2

