Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425F33F4F4E
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Aug 2021 19:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhHWRRJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Aug 2021 13:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhHWRRI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Aug 2021 13:17:08 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EFDC061757;
        Mon, 23 Aug 2021 10:16:25 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so330307wmh.1;
        Mon, 23 Aug 2021 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxfU4hWH4ciaa87KiutkqT0bdAg+UYy0+Bwkt7eXstw=;
        b=DQE1rq5GI4duIJUWfHtryvxhKChz+3QryiGactvg2cIKNx15DUwvyFbBDVfkrwRqUw
         aM3Zyxzsb7VeEiSpxV5RVa0Kh7hrkRV9k0ALfQSv+4IWETaamKl9gwMY6mVC9RKd42Mr
         KjvN7NXAoZQNV/w8b40pHb9SCpy5zD1IFYguD4rOo2x3Km58NVhDYr7kehpmxeCI7c/O
         PMzgN+8L3oRSeyTOpyjUZHrHN0Wp3jFqX1oujMQxVquK4uAA/VgL87JkUaewrZbiym1I
         XZBnOjmDBXHy5B0p3yvv46Q9YuVFdKqNalssNVuXWYgQdzcJ3+84Cv3nkfDIRU7doTf2
         fmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxfU4hWH4ciaa87KiutkqT0bdAg+UYy0+Bwkt7eXstw=;
        b=lycJgF48YsvixPoR7cQo8lqmqf9HVK0E3MGVjypPPueVxHnzGuv4Fr1Qvme/uRAyfd
         mq6LrFIbJ9k0p2SMfRQ+cdFMK8n0ahwAb9WyrmMWNbcuGHPpUvQ19tvhUfzenD8OS0P4
         V23gXofAw/Hnj4LrqT2ePPqOyohDpYb/NR9npVT/8dHVnDhpQni/1J+OP0WHbx2kdkse
         ZdSpm0ax4jsQM7wSNoXKzIUT6fIBwkDnUsRFWxYN5dzLySCntFeX0Nt/u2U5Kn1WFNDN
         kkPJVvzzuMtBUrRXI5+VPkS7dk+WSkP2n26PM3/1BymlJI+Gu9yPau5dE0NmVbGJ80H2
         Ogsg==
X-Gm-Message-State: AOAM532U8ti67UgHfm3gmFO6GrNwn/vTDeeVbQ4zyHTopghqdYd4MMOz
        37Ps8ocVTjPbzWHrPqP1iso=
X-Google-Smtp-Source: ABdhPJyaBw8itjnEkV5Aq7qtJ2SkPIx3F7l1lqtxafvtQhPgSwh3eIDXaSbpzuadoGHj6Xg/HDQa0w==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr17567600wmi.131.1629738983809;
        Mon, 23 Aug 2021 10:16:23 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id d4sm15854207wrz.35.2021.08.23.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:16:23 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] ARM: dts: mstar: Add rtc device node
Date:   Mon, 23 Aug 2021 19:16:13 +0200
Message-Id: <20210823171613.18941-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823171613.18941-1-romain.perier@gmail.com>
References: <20210823171613.18941-1-romain.perier@gmail.com>
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

