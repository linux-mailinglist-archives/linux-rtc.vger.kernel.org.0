Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68553F1E97
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 19:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHSRDr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 13:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhHSRDo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 13:03:44 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2070C061756;
        Thu, 19 Aug 2021 10:03:07 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id l11so10140355wrx.4;
        Thu, 19 Aug 2021 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZGaaM2GSAFsysJeyN/26wnpCp1EgFQ7NteQr3i/NpY=;
        b=DtspEGW+nuBNf5cUEs5GTYtjS4GSRKl0rrvHkjCxMnNmUDSUNwwfKpsUAKhYL4aih+
         DdB1PoUVmW/tQtEnnzUwMM1qPdzXeF7yJ40NejDF27cjjNz0Dz8U4EMVtOebI3Eui5WC
         A5/1KBB9Nhll3zBip40nlLGb3tBjkzRfXDejwSYbwYk84T7Mb3QDb23BUcGWVQhH6U2M
         frdYoofBVpgWWpTCDZfJ8AnlnuW+VWxvLDJoPmZpe1BmfWPhF6hcE8j6wsmkqFV7D4Ru
         XcunVzzrqvh2qb3bMhJYgxXMKjfw0JD1k0WWulJPoV64aj1xZq+pkK6OdiPfQWJO4ycS
         9+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZGaaM2GSAFsysJeyN/26wnpCp1EgFQ7NteQr3i/NpY=;
        b=csfG//hZWVLqzrG8Ek1pGVS2o7LVtbAPO+OAL7uSL9jh0oUUn+XLQYfYbu1MtXHA+w
         Bsj3PnHNksTprrxFyTY45MNul7dcrxELSxEeh8yJvA2qI1G6KRlVum8g5Rc2PBscNns9
         v/DeW2kMNKqKmJyh0o7rkRMIufWhtmym/2jL60y/mTZIYiOyQGp6ibaWTsrp7aVRtXeQ
         iyLgbi/aS2IoD0486jD/3tDA8xNZzbW8qYhvP9G6OWuYKJhJgxTB+bBzqJJ0g75ZJoHJ
         sKDcR1xi5cYHFdH9KyJGvyov1jmdUqnDym4cXQ8B/9xMJYgUljlbSTdfLMPSYQAn6gBq
         pKEg==
X-Gm-Message-State: AOAM531lyCVijQOdZTgl5/xuGjDd5zdXiVxZbcQ79DGhJ3LnB86Oueor
        ScFQDirZwm0cXxPdC1FwMNA=
X-Google-Smtp-Source: ABdhPJwOdfw2qQVbBbAtSlGea8G1nJjsS4qdVFZwX8CgJdLFVafTxxXhMHvUACrSTaR4rDZTHacUVA==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr4993624wrs.188.1629392586507;
        Thu, 19 Aug 2021 10:03:06 -0700 (PDT)
Received: from debby ([2a01:cb19:13:7900:ae2b:c45b:3c7c:7e51])
        by smtp.gmail.com with ESMTPSA id i9sm4250784wre.36.2021.08.19.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:03:05 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Thu, 19 Aug 2021 19:02:59 +0200
Message-Id: <20210819170301.10520-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819170301.10520-1-romain.perier@gmail.com>
References: <20210819170301.10520-1-romain.perier@gmail.com>
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

