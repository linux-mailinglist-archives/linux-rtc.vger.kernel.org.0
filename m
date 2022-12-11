Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7C864965E
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Dec 2022 21:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiLKUvm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 11 Dec 2022 15:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiLKUvl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 11 Dec 2022 15:51:41 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B06F766E;
        Sun, 11 Dec 2022 12:51:40 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DEB70853A7;
        Sun, 11 Dec 2022 21:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670791898;
        bh=cTgcwNIP/RurFg/ugsyeLDgSwONRtVIV9t/Z3Wx7l3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qeqrTis87Aup88XZ3vumlu5ed7RFQYy8pPsTOzqvwb3tRLViSTnnInqgaPYN5ZoRA
         f65ndjKoBUtGb6qXzVdssLQ9872PxY+4+0joKj+A+mb+ITSBQjjRogyHZmysY0qcTq
         S19nCY/wuAeqIB26bvYlaMnzxX4udrWSGlwUrT3ZNcfaRVJkuQLbtX8eZ+HXoldNLm
         zLXuWt07ptKd//MHYez+flrLi2yjRrYjaIKqwdvUw0yTkfZ4Kyd/JGCgb/9klnRGN7
         NUG/hT9EPCZNjXqhuZcfR0s0CQG8I5pjSI8xC/I4sJbXCBhOYkNvMShC5J1GREmfpc
         bX8phvDX43TNA==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: rtc: m41t80: Mark the clock: subnode as deprecated
Date:   Sun, 11 Dec 2022 21:51:24 +0100
Message-Id: <20221211205124.23823-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221211205124.23823-1-marex@denx.de>
References: <20221211205124.23823-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The clock {} subnode seems like it is describing an always-on clock
generated by the PMIC. This should rather be modeled by consumer of
the clock taking phandle to the RTC node itself, since it already
does have clock-cells and all. Since there are no users of the clock
subnode in tree anyway, mark it as deprecated to avoid proliferation
of this approach.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Add AB from Krzysztof
V3: - No change
---
 Documentation/devicetree/bindings/rtc/st,m41t80.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
index fc9c6da6483f5..03ff833f5fe9d 100644
--- a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
@@ -40,6 +40,7 @@ properties:
   clock:
     type: object
     $ref: /schemas/clock/fixed-clock.yaml#
+    deprecated: true
     properties:
       clock-frequency:
         const: 32768
-- 
2.35.1

