Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F372346BF0
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Mar 2021 23:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhCWWPa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Mar 2021 18:15:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33489 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbhCWWOx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 18:14:53 -0400
Received: from localhost.localdomain ([82.142.25.162]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MysiI-1lbZ1c1mny-00vzCx; Tue, 23 Mar 2021 23:14:34 +0100
From:   Laurent Vivier <laurent@vivier.eu>
To:     linux-kernel@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] rtc: goldfish: remove dependency to OF
Date:   Tue, 23 Mar 2021 23:14:29 +0100
Message-Id: <20210323221430.3735147-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323221430.3735147-1-laurent@vivier.eu>
References: <20210323221430.3735147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:muYh0q93WOCKkWLsm0sUezRNH9I0M/PIEsaJJ36tIf8ry26GiPD
 JqQYw7lR/Wll0SeRdy+DwzRVc7Zrw/yUPSin6WlncsW2QMXsn8DAv7LRRJYv4ZEVLDaKgJm
 87M+Uff//RE8ExB5TWaPeqUjQvubscdsj2GtrnhPrEg2sYpCUOy8FGiAhKKSBQ6aHL61Xso
 TeQFJ5Q2Yddho+HRwiUyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r/xfUei7NFU=:V0VEqZr/7wMHGdImg69EUJ
 TbSkvwDE+STB+6Z/ZnZQ5viggs8v8/HtbLvvpHN3EWYOLGJD2RHtXfxu5zVUkxsduhndCfaS5
 OzdccFrH/OP81NpUwY8hqpUYtwZoehxguoc7YyDsjFlEg3N090hBRfkK3ixW/gETVs2Z0cHYa
 mrttkxyiFs5GgCWAqd+a27Sm7ld26g8tWr2Jf4JFTDgxBeyjJjZt9obxTK3zZ5knDZwtpTiJC
 xmubcE38BQcZ1KgAwVTAA1AzZVMUDE6PrY6bz4IPOSpWwAGF+5Nxl4q0zmmGePrR4sI2qTQK8
 QzbXSOarO8StGu1Dc27XR4fg/JgKNRy2FxMft+NrNnpLDgNgxL3Ukh2sYlHnvtYrHiYIR+/La
 zE2Zl692V6aD3fLmRNJyVf0niuJuBVarls69vvGHTWnJrS4Ix2GWUHtmdW3PDve8QH+czgZ/I
 G881YzCmSA==
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

We want to use the goldfish RTC on a machine without OF.
As there is no real dependency on it, remove the OF dependency from the
goldfish entry in Kconfig

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ce723dc54aa4..5a35ddddd8c6 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1898,7 +1898,7 @@ config RTC_DRV_HID_SENSOR_TIME
 
 config RTC_DRV_GOLDFISH
 	tristate "Goldfish Real Time Clock"
-	depends on OF && HAS_IOMEM
+	depends on HAS_IOMEM
 	help
 	  Say yes to enable RTC driver for the Goldfish based virtual platform.
 
-- 
2.30.2

