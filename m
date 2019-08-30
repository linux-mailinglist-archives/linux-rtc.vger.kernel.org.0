Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08212A37F8
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2019 15:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfH3Nr7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Aug 2019 09:47:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56409 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfH3Nr7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Aug 2019 09:47:59 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1i3hFt-00016X-MR; Fri, 30 Aug 2019 15:47:57 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH] dt-bindings: rtc: add missing rx8130 compatible
Date:   Fri, 30 Aug 2019 15:47:55 +0200
Message-Id: <20190830134755.1121-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The required OF entries were added with 47dd47292828
("rtc: ds1307: add OF and ACPI entries for Epson RX8130").

Cc: devicetree@vger.kernel.org
Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index eaee19b60960..66f0a31ae9ce 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -19,6 +19,7 @@ Required properties:
 	"pericom,pt7c4338",
 	"epson,rx8025",
 	"isil,isl12057"
+	"epson,rx8130"
 - reg: I2C bus address of the device
 
 Optional properties:
-- 
2.23.0

