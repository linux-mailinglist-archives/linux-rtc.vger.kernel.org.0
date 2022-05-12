Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B06D525059
	for <lists+linux-rtc@lfdr.de>; Thu, 12 May 2022 16:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355466AbiELOjm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 May 2022 10:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355480AbiELOjj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 May 2022 10:39:39 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AAE26197E;
        Thu, 12 May 2022 07:39:35 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E66A20000B;
        Thu, 12 May 2022 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652366374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AeURFA21azT2WZg6+haUTuGeT1PTBOnmz+vdgDPsEgY=;
        b=ilKLNYSfgOwFBEfbc8RX7DQBztB1FbGT4h1wcKqiiGxaFOR8Eqpm+E1419K6mehHwu1Z+M
        8rcDmk7Ek5N2YdWfhnll9IpB+8aQIeuaVOGsB1FTHc6c/bfC6JiLB7zSnrn2bUQdxaMgpF
        XA82/A7AyPNopP9jMAS/jxqVE5TnHOjapKMNzU8ZCr0w7hoWtxJ4LTGXFJxo4CurqXGzx2
        IFXP/f0RKYn5pWChGdSJpOYfzNkGfMvNdpZqbwwcagHt4OdMNWnZWnSncUcZy9PLU4tw6f
        5IyHzLrfLbtbcLsDAuE3ao9g99R0iAu3PuEGpR4m7RXe5VtlpaKQ9gQnevXLSg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v5 5/5] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
Date:   Thu, 12 May 2022 16:39:20 +0200
Message-Id: <20220512143920.238987-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512143920.238987-1-miquel.raynal@bootlin.com>
References: <20220512143920.238987-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

After contributing it, I'll volunteer to maintain it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cf74e4eacce..cc4a3cca022e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16847,6 +16847,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
 F:	drivers/iio/adc/rzg2l_adc.c
 
+RENESAS RZ/N1 RTC CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-rtc@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+F:	drivers/rtc/rtc-rzn1.c
+
 RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.27.0

