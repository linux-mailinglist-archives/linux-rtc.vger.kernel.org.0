Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4272017D3FC
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Mar 2020 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgCHN7L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Mar 2020 09:59:11 -0400
Received: from mailoutvs5.siol.net ([185.57.226.196]:40370 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726259AbgCHN7K (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 8 Mar 2020 09:59:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 58ED1521ECB;
        Sun,  8 Mar 2020 14:59:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ORomHiAvpyye; Sun,  8 Mar 2020 14:59:08 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id EBC30521ED8;
        Sun,  8 Mar 2020 14:59:07 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 5BFD0521ECB;
        Sun,  8 Mar 2020 14:59:05 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 1/2] rtc: sun6i: Make external 32k oscillator optional
Date:   Sun,  8 Mar 2020 14:58:48 +0100
Message-Id: <20200308135849.106333-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308135849.106333-1-jernej.skrabec@siol.net>
References: <20200308135849.106333-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix TX6
(H6) don't have external 32kHz oscillator. Till H6, it didn't really
matter if external oscillator was enabled because HW detected error and
fall back to internal one. H6 has same functionality but it's the first
SoC which have "auto switch bypass" bit documented and always enabled in
driver. This prevents RTC to work correctly if external crystal is not
present on board. There are other side effects - all peripherals which
depends on this clock also don't work (HDMI CEC for example).

Make clocks property optional. If it is present, select external
oscillator. If not, stay on internal.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/rtc/rtc-sun6i.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 852f5f3b3592..415a20a936e4 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -250,19 +250,17 @@ static void __init sun6i_rtc_clk_init(struct device=
_node *node,
 		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 	}
=20
-	/* Switch to the external, more precise, oscillator */
-	reg |=3D SUN6I_LOSC_CTRL_EXT_OSC;
-	if (rtc->data->has_losc_en)
-		reg |=3D SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+	/* Switch to the external, more precise, oscillator, if present */
+	if (of_get_property(node, "clocks", NULL)) {
+		reg |=3D SUN6I_LOSC_CTRL_EXT_OSC;
+		if (rtc->data->has_losc_en)
+			reg |=3D SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
=20
 	/* Yes, I know, this is ugly. */
 	sun6i_rtc =3D rtc;
=20
-	/* Deal with old DTs */
-	if (!of_get_property(node, "clocks", NULL))
-		goto err;
-
 	/* Only read IOSC name from device tree if it is exported */
 	if (rtc->data->export_iosc)
 		of_property_read_string_index(node, "clock-output-names", 2,
@@ -279,11 +277,13 @@ static void __init sun6i_rtc_clk_init(struct device=
_node *node,
 	}
=20
 	parents[0] =3D clk_hw_get_name(rtc->int_osc);
+	/* If there is no external oscillator, this will be NULL and ... */
 	parents[1] =3D of_clk_get_parent_name(node, 0);
=20
 	rtc->hw.init =3D &init;
=20
 	init.parent_names =3D parents;
+	/* ... number of clock parents will be 1. */
 	init.num_parents =3D of_clk_get_parent_count(node) + 1;
 	of_property_read_string_index(node, "clock-output-names", 0,
 				      &init.name);
--=20
2.25.1

