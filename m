Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100303DCC9F
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Aug 2021 18:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhHAQKB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 12:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhHAQJx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Aug 2021 12:09:53 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4210C061798;
        Sun,  1 Aug 2021 09:09:43 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j2so18380877wrx.9;
        Sun, 01 Aug 2021 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Irrd4jtOn6498HfdXqzrUQsx/bjOrWlV0M76X3ljkdk=;
        b=gs6U3eiL1KjltW6y4MiFi5EsWYHt4Yx/XntgKQ/n1j8Xk8hOZuoLbVFBD53MBo4lFC
         yc69MxSsOe2qmcJlqaMQKb8qhVOGH0GrTKydZ4TS/RzYDFWCfGdP2u2q5dJ0n0N9qYYs
         nRBsuOLZU+tyJ6dBhoKMJfoA5wZrFq9eo3ZWxQtdeO8HBgmgl2hgXAUHlPMEpYXlh3rc
         vdFSi6yy6BjDshszY1wSyOR7/eNtzkbcW1Ctzxx8KO/NslfEm6WdEKQnu6JcbQ7rmtaF
         SNOVIxVNmYwSx3CF4eWoW5N3e8O72QhLPWykd+fb3xD4ThwiT+4QN+95uLrZEeoVatxe
         ihbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Irrd4jtOn6498HfdXqzrUQsx/bjOrWlV0M76X3ljkdk=;
        b=K4t9KCz35QKLTKqHqnhbN1gBX76+PPfsBtgdTBLqmw3iTDFQbsUaRSdxuQT+K++OUE
         5RXhu/gcUTYNaqGzqMb0R/aEAo1jtT6KEVDjmXngCq84nFxfpqB6KKB3lOYiiTJ7ISNP
         13sIFIytPHn1eqDSbcAySNLs9ezD/wzoIxtKAhf9PRAx8H7bCRjQZ2zulZGT0hBLDBho
         uguCy311xABpcOY9UOyEQ2O7Q4EyyWvm7wNmjvSBJkVOHzFS4twQWORKxXyLhQvZMGZ2
         JS5PFBeCDgT3+XbaNU5DPQaF/XXwVaA1nAXNMi0fn5Z23pAIflOaFBrDPy6eyXKylEXf
         rlqw==
X-Gm-Message-State: AOAM533hVTfosZi0PT9O8qY7QT9bu0SRfS2MKfBgfv87cngU1Meb5LEl
        svB2gBLmuT24188Dw6J9F+M=
X-Google-Smtp-Source: ABdhPJxTowqFvdlDg1aQ9rOi2w93d2I1rV4UdL2UhVKGao2Yfhw8OUHCTcl/QgtVW/RkBvHWfwsSBA==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr13551915wru.421.1627834182374;
        Sun, 01 Aug 2021 09:09:42 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id 140sm7875835wmb.43.2021.08.01.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 09:09:41 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] ARM: dts: mstar: Add rtc device node
Date:   Sun,  1 Aug 2021 18:09:21 +0200
Message-Id: <20210801160921.233081-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801160921.233081-1-romain.perier@gmail.com>
References: <20210801160921.233081-1-romain.perier@gmail.com>
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

