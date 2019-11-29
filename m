Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB02810DADF
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 22:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfK2VV2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 16:21:28 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:52126 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfK2VV1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Nov 2019 16:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DSUQtlTA++8PBBCrpKNlIubjy8u8hmzgB0nADb0un0k=; b=GPtAJH36BX5+F4IUx7wTVfDxgZ
        fDDDVsBDjpnYgGuiUfCEEMEdGOSwyVTt3Tl+Z/tow74mnMFkEcvwEOP01uiv0tArgTAQLc+fsoItK
        GLU16hgFdQNQjRsrOrJrcKEKG843DFAN68u7ljOnn8nwctHn1sa/W4E2Ira45o7Fu19s=;
Received: from p200300ccff0871001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:7100:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ianhb-0001yK-2L; Fri, 29 Nov 2019 22:21:23 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ianha-0004mW-Ps; Fri, 29 Nov 2019 22:21:22 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/6] mfd: rn5t618: prepare for irq handling
Date:   Fri, 29 Nov 2019 22:20:41 +0100
Message-Id: <20191129212045.18325-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129212045.18325-1-andreas@kemnade.info>
References: <20191129212045.18325-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rn5t618 currently lacks irq handling. To prepare implementation
in a rn5t618-irq.c, move main file to rn5t618-core.c

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/mfd/Makefile                      | 2 ++
 drivers/mfd/{rn5t618.c => rn5t618-core.c} | 0
 2 files changed, 2 insertions(+)
 rename drivers/mfd/{rn5t618.c => rn5t618-core.c} (100%)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c1067ea46204..110ea700231b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -216,6 +216,8 @@ obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK808)		+= rk808.o
+
+rn5t618-objs			:= rn5t618-core.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618-core.c
similarity index 100%
rename from drivers/mfd/rn5t618.c
rename to drivers/mfd/rn5t618-core.c
-- 
2.20.1

