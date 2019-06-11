Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784153C44F
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 08:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403762AbfFKGcC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 02:32:02 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42962 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403786AbfFKGb7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jun 2019 02:31:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C75BD1A0EF1;
        Tue, 11 Jun 2019 08:31:57 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 932A21A0177;
        Tue, 11 Jun 2019 08:31:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 74AA7402FB;
        Tue, 11 Jun 2019 14:31:41 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com,
        daniel.baluta@nxp.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 3/3] arm64: dts: imx8qxp: Add fallback compatible string for RTC node
Date:   Tue, 11 Jun 2019 14:33:33 +0800
Message-Id: <20190611063333.48501-3-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611063333.48501-1-Anson.Huang@nxp.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

The i.MX system controller RTC driver uses generic compatible
string to support all i.MX SoCs with system controller inside,
this patch adds the generic system controller RTC compatible
string as fallback compatible string accordingly.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 12044be..40811a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -162,7 +162,7 @@
 		};
 
 		rtc: rtc {
-			compatible = "fsl,imx8qxp-sc-rtc";
+			compatible = "fsl,imx8qxp-sc-rtc", "fsl,imx-sc-rtc";
 		};
 
 		watchdog {
-- 
2.7.4

