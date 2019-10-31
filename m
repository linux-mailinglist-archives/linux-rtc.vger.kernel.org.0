Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22B35EB91A
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 22:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfJaVir (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 17:38:47 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:48564 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727580AbfJaVir (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 31 Oct 2019 17:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DSUQtlTA++8PBBCrpKNlIubjy8u8hmzgB0nADb0un0k=; b=SSarLkK6vNWkuB5ogC63r6jSHr
        FWmu89jil22bEHL3Lggi4MeWo714wE85/amj4mstZBsk9ESsyUhgjuSbRHBqn9bLXuAgCOO31fWlm
        SEK6VM5Y/A6KKxEVJRevFsuVrCYsbFXwTTbZ5/mKXz1kbZufCfD2FWvE6PzL5YQUiPFc=;
Received: from p200300ccff0b24001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9Q-0005lJ-N9; Thu, 31 Oct 2019 22:38:40 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9Q-000304-9I; Thu, 31 Oct 2019 22:38:40 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/5] mfd: rn5t618: prepare for irq handling
Date:   Thu, 31 Oct 2019 22:38:31 +0100
Message-Id: <20191031213835.11390-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031213835.11390-1-andreas@kemnade.info>
References: <20191031213835.11390-1-andreas@kemnade.info>
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

