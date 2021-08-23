Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158CD3F4F4A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Aug 2021 19:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhHWRRH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Aug 2021 13:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbhHWRRG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Aug 2021 13:17:06 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439C5C061575;
        Mon, 23 Aug 2021 10:16:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id z4so11666101wrr.6;
        Mon, 23 Aug 2021 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZGaaM2GSAFsysJeyN/26wnpCp1EgFQ7NteQr3i/NpY=;
        b=vKLSlgfbKqGivhMOHVM5e2WGQ67gGAIUnEwD0TgJDHk+prgqLzTBV3QJPYUXP1bR22
         F1l87kBXYGda/GU+/CmQrRdaQQZcyt/uEapEdu0MiOt5W4LPXQ7j04cj68s88mUeW/vq
         ewmUOcLakec798GwpM3RKvMhkOcjw1M5geKQ6A4+sffeid6fuFokN/IYhexturGQ8Gtu
         DIhc2qSy03dFHyOWwtZCEAI6p20LVLa6vrDBh6aFL+k71B5y+dA/YuH2MKoeUmKJ4PHi
         EVnlGiRk7edjdx3TtlO4d9NQlyIgogtybdFsnQSV+xsgunX5Xz6BUXQjQX42LCYtj7kV
         +grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZGaaM2GSAFsysJeyN/26wnpCp1EgFQ7NteQr3i/NpY=;
        b=SlBoWacGupwGGO2EaYYuaG8WgzyJcWHmkK0hflkI1XzYk3Vj+WBPaY6a1kYGoGOy31
         K5NaLyCnwYY1ZogQqMkelKNQFnbaEIKq4yVRfjrZ/RfD7CAlrED4dCO7oAnWmzfciaDM
         Uhg/TAcg0MkMBv7A0fmeGWoEY03XLr6Ysq9t+QOOoHbF0vVPrTt1kxNmgPKSkpbJpNmH
         MfCN+5aPY3jRx7bh5r/eDGKf4EZyYtYfrnPqlFUqfYj8mNnD6Ij7Zb0gCVHOnn0nksZc
         leE1ZXnQwU5Da9tAzQhibhGuAkdt1crd8rqtohS+8+aVmThYPir/P/mi3ULH+RecvMQt
         mUyQ==
X-Gm-Message-State: AOAM5302us0qMFYACzCYeJjmizIhFzvXKpkmqSWTY5cIdXa23E7qcF27
        DXVKseNbLAXxCeyrENI4YfE=
X-Google-Smtp-Source: ABdhPJzHd1A8VuxzWjUOB8EymDvNrdIaC2HaL31/e+U1yh8mi2Rl3HRK9mTGbrkNT37p/blk2DIUFA==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr14776456wrm.401.1629738981487;
        Mon, 23 Aug 2021 10:16:21 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id k1sm16275397wrz.61.2021.08.23.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:16:20 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Mon, 23 Aug 2021 19:16:11 +0200
Message-Id: <20210823171613.18941-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823171613.18941-1-romain.perier@gmail.com>
References: <20210823171613.18941-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e RTC driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/rtc/mstar,msc313-rtc.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
new file mode 100644
index 000000000000..114199cf4d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mstar,msc313-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mstar MSC313e RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Daniel Palmer <daniel@0x0f.com>
+  - Romain Perier <romain.perier@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mstar,msc313-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rtc@2400 {
+        compatible = "mstar,msc313-rtc";
+        reg = <0x2400 0x40>;
+        clocks = <&xtal_div2>;
+        interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.30.2

