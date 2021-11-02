Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44A1442710
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Nov 2021 07:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhKBGYq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Nov 2021 02:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhKBGYp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Nov 2021 02:24:45 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C207C061714;
        Mon,  1 Nov 2021 23:22:11 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o14so4286834plg.5;
        Mon, 01 Nov 2021 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/FiCnWHVe2ZLA8swVG1jWBiytbZWzyx2jovClyWrlJU=;
        b=TpJAhHUU0WvIhvNisTss2InEVL0Rh9P/wX4ItbPj1xKNh4RNUU+u/5NabytTNT3gXQ
         3SBoj1q0dedN7aoCPtIGxs4dGmSUHZBMicqCA+2pbHdzHlhTX9BKnT4r6wkfC2zgbo53
         /9tuCzsf/eEfXr/nS+Nk8fJ3Pe2E0mMiOVJgSpoLAKqIceNk5bCX2yiiKoxnBXnG66fj
         GEuXTh1d3N4lcIUSE7Vq6hMjflLqTsIAUQ0/2F95szuyhUMzDnD+96TRwq41wSMIEZq/
         E9HM9n8cvpbT1Nsozv98zOD8BAct/96AwuWLvKOPNaL0Ukl7PTgUISjk/MD1R0uAGvfK
         hOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/FiCnWHVe2ZLA8swVG1jWBiytbZWzyx2jovClyWrlJU=;
        b=ZYYHKLrd43qNmeRLs5qa6YjwksXZfPJVeGPApFod6uPTyBPm4VibC93TuT5YH+9LbI
         l3P+VdTws8ZV05VlngrlSrTg5U9iKpY0mGd2aHH97Yx6kgyrA9jypcnhpz5Wl+/Jqkj6
         xilUjuFv9WLuQM6EEguG0zXGb5Syey0VTulfoSSxP9wmoU3MmACBQeIKdTi6YHlYj+B5
         OKeKK1js1S4p35RkaaFWJj3oSxI/9d2aZe1K4hQBytwX7Rmx5xEYugUjbee3gARNChI0
         FI0lrsiTlJrjNs0TkCDDYw156Uz8lX7BnXroXxerRNO/wRZNR4uK74afs/JQemIJurtB
         KPjg==
X-Gm-Message-State: AOAM532KGTdeePCaUjIX7RtAOHGnB+tdy9NX6T9oY/yvG8q7gCuIA9TT
        RGv3fKnxAh524zMZ/syeipw=
X-Google-Smtp-Source: ABdhPJwcHoyUlzfKRjUlLS1F/fhoket/EgcvM0g1Cv3oBbkaD/6cRVQ1d2O2D7lpMgY7GGU/ptwurQ==
X-Received: by 2002:a17:903:32c5:b0:141:eb39:30b7 with SMTP id i5-20020a17090332c500b00141eb3930b7mr10289277plr.41.1635834130843;
        Mon, 01 Nov 2021 23:22:10 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id v2sm14859402pga.57.2021.11.01.23.22.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 23:22:10 -0700 (PDT)
From:   Vincent Shih <vincent.sunplus@gmail.com>
X-Google-Original-From: Vincent Shih <vincent.shih@sunplus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Vincent Shih <vincent.shih@sunplus.com>
Subject: [PATCH 2/2] dt-bindings: rtc: Convert Sunplus RTC to json-schema
Date:   Tue,  2 Nov 2021 14:22:03 +0800
Message-Id: <1635834123-24668-3-git-send-email-vincent.shih@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
References: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert Sunplus RTC to json-schema

Signed-off-by: Vincent Shih <vincent.shih@sunplus.com>
---
 .../bindings/rtc/sunplus,sp7021-rtc.yaml           | 58 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
new file mode 100644
index 0000000..e494c2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sunplus,sp7021-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus sp7021 Real Time Clock controller
+
+maintainers:
+  - Vincent Shih <vincent.shih@sunplus.com>
+
+properties:
+  compatible:
+    const: sunplus,sp7021-rtc
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: rtc_reg
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sp-sp7021.h>
+    #include <dt-bindings/reset/sp-sp7021.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc: serial@9c003A00 {
+        compatible = "sunplus,sp7021-rtc";
+        reg = <0x9c003A00 0x80>;
+        reg-names = "rtc_reg";
+        clocks = <&clkc RTC>;
+        resets = <&rstc RST_RTC>;
+        interrupt-parent = <&intc>;
+        interrupts = <163 IRQ_TYPE_EDGE_RISING>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c1a535..c6774d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17949,6 +17949,7 @@ SUNPLUS RTC DRIVER
 M:	Vincent Shih <vincent.shih@sunplus.com>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
 F:	drivers/rtc/rtc-sunplus.c
 
 SUPERH
-- 
2.7.4

