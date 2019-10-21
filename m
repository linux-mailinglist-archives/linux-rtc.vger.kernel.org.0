Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E614DE3FC
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 07:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfJUFl5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 01:41:57 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:39244 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfJUFlo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 01:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=References:In-Reply-To:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MaN0NWKL5Bdv3e3tYNuLCBicTuDCa6sM76hJ6MzSU74=; b=Rrm8+QSfpi4oDQP+XvSYd+htM
        lrbOniQqxCx/5Et9ZMUlgsPJwvhNR6QOFB5wNE+G1TF0D30FdueeTRX5mLDIh2HdZRdqHlNaYuf/d
        1jVZGzWJvHCT6XDQeOVkkwwM4/MlKzUlsvdMG/kHyJgZRXmZ78+OhxenKsZRr5zA5dkvw=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRo-0002hF-7X; Mon, 21 Oct 2019 07:41:41 +0200
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRj-0006oh-6W; Mon, 21 Oct 2019 07:41:35 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/5] mfd: rn5t618: prepare for irq handling
Date:   Mon, 21 Oct 2019 07:41:00 +0200
Message-Id: <20191021054104.26155-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021054104.26155-1-andreas@kemnade.info>
References: <20191021054104.26155-1-andreas@kemnade.info>
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
index f026ada68f6a..7d7e0ec4e325 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -219,6 +219,8 @@ obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
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
2.11.0

