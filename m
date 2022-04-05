Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36284F4879
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350514AbiDEVkf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573379AbiDES7w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:52 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F61CD338
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:53 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 41237CB3D7
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:41 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 88418200008;
        Tue,  5 Apr 2022 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5VgkvEnP5b6St7Fp3o3CiWue0Qq0QtYCZ+H9lR4xV74=;
        b=EvtzmemGu+VW/O34YilZ5smr0nIJGAu9gZYrdqsRAzToOBgE5O/NtykvyGz8iW62mjbyeP
        Gf+p3cW+qxE9XVv7MasQidJQ5VJV80pjuiUNCJpOHiOT5msDV5pPAb8pD5zhDdyWOsXFDT
        viy5tfF48XQgDh+hc9z+BAdv3NkQaGxJpcVYOdVjNR9AcTphoHQmBcvJNjViX9j3McLUSa
        56ZxjXFzwBq8hQUHBMrL1PlIkCb7buze6Ec1sPTk+kn09xlI+IzchQSAqvm7JOihXtcRgB
        CaUEVMA3tB5r/nAVKMzsjEBuGJtPbroclRf8aPD1T2zNnMPJTW0XiA5jIyRM3g==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 6/7] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
Date:   Tue,  5 Apr 2022 20:47:15 +0200
Message-Id: <20220405184716.1578385-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

After contributing it, I'll volunteer to maintain it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120d3ae57a4b..a2bafa05ca60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16849,6 +16849,14 @@ S:	Supported
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

