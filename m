Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816B53D002A
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 19:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhGTQnQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 12:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhGTQmq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Jul 2021 12:42:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F750C0613E0;
        Tue, 20 Jul 2021 10:23:12 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u1so26890990wrs.1;
        Tue, 20 Jul 2021 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zhLiMJZRNY6qUDk4IIbiRtvY/5CeP3owVFf8Rh0foos=;
        b=c7ZsQEReXTuJMEibJsFZnTOqVmK4iaqbAXocjphBZKhR4EIAWSr8lK1YMZtsLvOlFf
         9EaJ2bRTt+9ZN56hL7nEyi1Xwse4BhfWzioHmeY7NE272x0c23LvSuhepcYRVP4v3/f5
         T+MaRN5VHFzyyVhn2muBzl/FQCvLRGfHfH7CrezRhY+qGFFPxfteT4F+BplHVQ64VrCh
         YdLqoEK73t2pwye9yR7eNPFZB1mppp7zXDkfLUEvDlPYzNj+QS6XLg3EJxNOcSE9gsVv
         vsUZSIHPRE+gw6LUF7fhuZvfokWOu6OGkgbNosDtwtIiNsnFBCE7LIqqKCn+or5df1Ob
         dcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zhLiMJZRNY6qUDk4IIbiRtvY/5CeP3owVFf8Rh0foos=;
        b=EhH+JYbiTBKGou23En6AQzHyaoVnIIdcKdOXbfovp99WpMXFtNDqvSEe/gs5LNeHaE
         /eDreybUL+9SkdLhe6KlDSWSM/HbEAtcpolVe5m5/LY8clS1d9QA/CPHKxCHg2ZEFqjG
         b99tfpnub5X2sfb1vW5PROtbKBeDnEHBnNkdHGNPz5ezAVIrLlFHw27Ah2snx2+X0GaP
         RW4VgLlZUJTrdgji+FB5fc6wR0RIH97iHRq0Aq/zJx1h4hXdIuonOdyRQ1Ka0QO+Kz5w
         fvP91jhHF66RDwFa91eLcFLlp9hwsg+h+FSLPBh2U62vktbN6pjxo6L4lhGvrj0o45Le
         6dXw==
X-Gm-Message-State: AOAM533dGqkBBeFkMKL0qPw1uCfuchctREdcYXtyfO+ms8S5C6SYbggQ
        RC5ZZG95tZ/pxEOCcCnys9zIJmY0Mxk=
X-Google-Smtp-Source: ABdhPJwkskpxG+Uu6ZM1dtd9EQWOfgynMHFAOU3QVeTkNsxtOPoX2tS4zH7DbxsanYPBBRIK6gUVDQ==
X-Received: by 2002:a05:6000:18ae:: with SMTP id b14mr36272495wri.427.1626801790789;
        Tue, 20 Jul 2021 10:23:10 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id d29sm29755232wrb.63.2021.07.20.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 10:23:10 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Tue, 20 Jul 2021 19:22:49 +0200
Message-Id: <20210720172251.4504-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210720172251.4504-1-romain.perier@gmail.com>
References: <20210720172251.4504-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e RTC driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/rtc/mstar,msc313-rtc.yaml        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
new file mode 100644
index 000000000000..978c28bc3da5
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    rtc@2400 {
+        compatible = "mstar,msc313-rtc";
+        reg = <0x2400 0x40>;
+        clocks = <&xtal_div2>;
+        interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.30.2

