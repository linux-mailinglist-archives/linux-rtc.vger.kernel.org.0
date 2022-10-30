Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F73A612DFF
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Oct 2022 00:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJ3XVy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 30 Oct 2022 19:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiJ3XVx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 30 Oct 2022 19:21:53 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1C09FE2
        for <linux-rtc@vger.kernel.org>; Sun, 30 Oct 2022 16:21:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k2so25595302ejr.2
        for <linux-rtc@vger.kernel.org>; Sun, 30 Oct 2022 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/pfXAVw4Ivwn2DWScT8HOO7Use0H7cuBO89OCz06+U=;
        b=BMExSFtnE0iCBk0yhHy/gvZ+EafpsgLJKPvP3c7I9COx93Csws2qGRfnMN7xyEHoGV
         j9rAw4/O0GppU8e65nKvipDDN+cegTsb5W0GcbBhn3zpzHG0Gcmk9rr2zBqmVUe36zHK
         EMeNEv60q2rwZfyZAwrjFmo4iHVa9FNUKwOJUSajNUaj4R7dubfbF29O+Jyp+46fJ0C3
         Tyh66AvZnF3Sz2/vXS0bX1s/oRfQkG4Bre1QhWyrb2AQ6DX1EH473CCMr8iv2ANhjGs0
         GwXxBv8Q5As8B4fsrx445z3C5xX4w7M84qquXt7Y011fYJ9Bl4Az2HY+c4sHZ6CNd4ey
         LD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/pfXAVw4Ivwn2DWScT8HOO7Use0H7cuBO89OCz06+U=;
        b=gkmdB4Uq40JZa9+ZoSHMnwJw9dh3HFdLQe+JWEP1d08s9F4V2JO+X9wnujrGX42ewG
         MUA/2oxcUjqkUn3YoGD13ErKgJ46mvx7epQ6AWX3MCqIlWaRkMQ6G7z98j+lJONQYU+Z
         hK7GU8craAjysRop4efGI6eskeUz3Uj8t8g6AOHYUKzPkIkljtjtcszX57mVNJw+lh4E
         hUK6XnlU6NyNBoQ3TmprE82Zv77UKMQ1z0NhX2s2IDeVUD40mRfKHrhFH6ZuYgutyWNr
         9537irRNeSSRgggI+dol8HrkpCXh4c/FS1Uoo1CXV0OcjZ20X8dDwA+q0RMjhXFlbKOU
         T4VQ==
X-Gm-Message-State: ACrzQf3mHMOCGrYEQKIKyPbcWnGaAVd1y4w2s3llAkFAgrEMlUv4NgN4
        +N7P73QrYe4dgDfqEv5JsCarvg==
X-Google-Smtp-Source: AMsMyM6awiKR05N4eNcj8/rHX0BzOk6+BQcSzoIpnq5PU++MvhA3fASDIVHxLFzkZvxmZSGbe/Iw1g==
X-Received: by 2002:a17:906:30c5:b0:782:707:9e2d with SMTP id b5-20020a17090630c500b0078207079e2dmr9981745ejb.286.1667172109822;
        Sun, 30 Oct 2022 16:21:49 -0700 (PDT)
Received: from localhost.localdomain (host-87-0-236-69.retail.telecomitalia.it. [87.0.236.69])
        by smtp.gmail.com with ESMTPSA id w27-20020a50d79b000000b00461e4498666sm2572055edi.11.2022.10.30.16.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 16:21:49 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH resend 2/2] dt-bindings: rtc: add pcf2131
Date:   Mon, 31 Oct 2022 00:20:20 +0100
Message-Id: <20221030232020.465322-2-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030232020.465322-1-angelo.dureghello@timesys.com>
References: <20221030232020.465322-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add NXP pcf2131 fdt bindings..

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 .../devicetree/bindings/rtc/nxp,pcf2131.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml
new file mode 100644
index 000000000000..5e0e040a2631
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf2131.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF2131 Real Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: nxp,pcf2131
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  reset-source: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@53 {
+            compatible = "nxp,pcf2131";
+            reg = <0x53>;
+            pinctrl-0 = <&rtc_nint_pins>;
+        };
+    };
+
+...
-- 
2.38.1

