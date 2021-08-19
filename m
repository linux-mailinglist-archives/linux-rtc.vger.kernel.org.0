Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCA03F1E9D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 19:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhHSRDs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 13:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhHSRDr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 13:03:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96B6C061575;
        Thu, 19 Aug 2021 10:03:10 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u16so10134996wrn.5;
        Thu, 19 Aug 2021 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxfU4hWH4ciaa87KiutkqT0bdAg+UYy0+Bwkt7eXstw=;
        b=erdUUx4NsWw/ZkK8fTHFfMwqHdJ6pDKFLyWErxeo4fD4ge/9SWLnDaOrfy0kk3qb9B
         XpEm1oFYajr763UMEw8Zg+zvgT/t4pF/mcJ+wT9Vb4k9I/ZZkoNxtQ+iZqRzC7+60XcW
         FtlBlQZ05f2uBaeCLGTaT9/Ox6gtNEvb0tWkwoBzdFUgTAnqE31mlsVI7yI/sC9dwSwF
         OCJpwZFYgaKXGNLTjyaJmJipE8e45dmbmyUL2z29Y2NmPo2k2LUyI9jM4CgdIkCps+Qx
         CrOztU5H474PwhGfdAiepR5xPXHI5nqA1UfMXAf0FPuRiec1dwgq5YiTD0eDlcFUyksY
         FEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxfU4hWH4ciaa87KiutkqT0bdAg+UYy0+Bwkt7eXstw=;
        b=AFlFBww5wBUCDwHX+cklfAWeQAt+cP/bh59C85xGJzICKn+MSpR/llpzWRfR+yJ2du
         qFHJy7GOPHV5kqqKWH5lDPN+AEIfWAAwE21D3lpZyxXwUxe4PAcSgN+TS0VZhCdj9sGv
         35sefEaeOPuWHZ3cwWxORHxAm+85LK4Nnp67Z89MjXR7PMm8H0vMkOF7tSZ1Prnld2m6
         bgumF0CC/gzbgrxz1/W/QOCqI2L6pCbWGNhhv1N8XdOwjiKG1xZIQ8wnXT8gDml5KHBY
         8AdGODepul4WWsitmvAvxSpgxwYiOz3uT1KAizyh6DU//m03NR5wpRhPRpCx3x0rnM0o
         q5ew==
X-Gm-Message-State: AOAM530M2K2ThJcHqy+3j84K8naBoisIQtIS5nQ38hifp73VAMpTpvn8
        e3S4jhIQc5hZfcp3lrY6GXY=
X-Google-Smtp-Source: ABdhPJyawlCq/3fqUZVpfwDQFrBgNGfwdO11R1sTNih/XMmyh7eqg9cMNsRoinHH/avoA1dGp69IIA==
X-Received: by 2002:a5d:464a:: with SMTP id j10mr4995061wrs.190.1629392589616;
        Thu, 19 Aug 2021 10:03:09 -0700 (PDT)
Received: from debby ([2a01:cb19:13:7900:ae2b:c45b:3c7c:7e51])
        by smtp.gmail.com with ESMTPSA id o14sm3463804wrw.17.2021.08.19.10.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:03:09 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] ARM: dts: mstar: Add rtc device node
Date:   Thu, 19 Aug 2021 19:03:01 +0200
Message-Id: <20210819170301.10520-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819170301.10520-1-romain.perier@gmail.com>
References: <20210819170301.10520-1-romain.perier@gmail.com>
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
 arch/arm/boot/dts/mstar-v7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 982dba9d28eb..89ebfe4f29da 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -110,12 +110,20 @@ reboot {
 				mask = <0x79>;
 			};
 
+			rtc@2400 {
+				compatible = "mstar,msc313-rtc";
+				reg = <0x2400 0x40>;
+				clocks = <&xtal_div2>;
+				interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			watchdog@6000 {
 				compatible = "mstar,msc313e-wdt";
 				reg = <0x6000 0x1f>;
 				clocks = <&xtal_div2>;
 			};
 
+
 			intc_fiq: interrupt-controller@201310 {
 				compatible = "mstar,mst-intc";
 				reg = <0x201310 0x40>;
-- 
2.30.2

