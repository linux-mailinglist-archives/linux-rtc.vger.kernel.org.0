Return-Path: <linux-rtc+bounces-1218-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9AA8D215F
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 18:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2BA1F2511D
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD5171E54;
	Tue, 28 May 2024 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="MGDH8O1H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C332C60
	for <linux-rtc@vger.kernel.org>; Tue, 28 May 2024 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912812; cv=none; b=ApMJAKRi+bOUZ3vooS5HUhRgmdxloSz300ertqjkYCa+Gy7yGBnA9ukYeQKjWoC4aM5upZ5EIrJ6pio0z0yDmZAzOT+35/kgpgmE3XClLiOV8XpyhXVkS4DYjGDo0jZPNTEgsrd++P1TG6XKtHFmLRU5ff43gW6Ei1/w0frsNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912812; c=relaxed/simple;
	bh=+wN0e271L/t/wx/sJDWT4BtMAvIfz+xHX5fck+lFHxM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BKEgchS7wyM7VnRrsXol2chGhJtQN3oB0u0E6HAIYOUtuPdkeTxQ4uT29cmhJXpN6JLrHAMcKTwyTp5NYOBB9F6EZ62vLcKEZkczNH2nuGg8Qr6XFzKD2ImeDcvWa1FQp543g5YGiw9CV6y4xOkPMaKlFgcKTDKtVfraeYEjsgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=MGDH8O1H; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E9D87A0314;
	Tue, 28 May 2024 18:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=TvEc2xJY0IuFeMki+N/9BPo4VzXUdWZ9op3N9ZH/nYM=; b=
	MGDH8O1HzMgnZbjaMX0YgF2Gi8HKFavRRzO7SCPJXDjIVwvamJ6BEQsj/QWZCeZY
	ajkvUeeHMYHRAHuPVd0VLIEbu08L5/dVeSta6zcj9AFC5Z6IxyjsbuZ0jQKSowiZ
	MUuBfviYT5an1N9ci0tPLZRCQ/LfwFJahlMLIPcgiyZ6ZFI4jGCVSuQdN7PwUGaF
	hq7kRdi2yTabjKVw5qTSgxWK8/xRNlkU6/Uo/MTuKsqz4THYM2NsMxmtZuFSmyP/
	mx7b8Y2MksqN3x1ZEgKmZ4DRSYcoDRJLsoynhGO326+KhmoFIa/lB6cT5MmpYM/S
	nn25sFtcaera2pqExNPtGqcBwUH3lesKV4++nyBVZyy8U2QWtkehkJpwx2eYCgUA
	Pp9Y1zsj5wUgxBaO0ZNx/myiwsKFNJ5pxKgFrjCFYujTYHMNTeDrhIgjB8aj0xJ0
	H1cFe0MMjR8h7Myw2lGVefgXRHo9snHL7CK5CC7YbvuFOtXxp2xo3PFZjEd0l85g
	hIymQc61U75IALrwrRyel6Z2zJbSdpcywWx9dCO/9yvPCi0BnUDt88Yk4AE3S/P4
	KhSUvp7Q6EHqTN6cidRQy9C5RObApgwQgpkNZrKBYwuF0l77BQ/fBYDks3Ub3KnG
	BN9ggHA4mDVqkUw+VkyjP2TJrA3jw5R+sUhA94RPCKM=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH 1/2] rtc: Add UIE handling ability to rtc_class_ops
Date: Tue, 28 May 2024 18:13:14 +0200
Message-ID: <20240528161314.404383-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1716912807;VERSION=7972;MC=2547996780;ID=93593;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957637165

Currently, Update Interrupt Enable is performed by emulating
it with either polling, or alarm interrupts. Some RTCs, however,
can directly provide Update Interrupts.

Signed-off-by: "Csókás, Bence" <csokas.bence@prolan.hu>
---
 drivers/rtc/interface.c | 8 ++++++++
 include/linux/rtc.h     | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1b63111cdda2..9e1eac441c54 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -581,6 +581,14 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 #endif
 	}
 
+	if (rtc->ops && rtc->ops->update_irq_enable) {
+		err = rtc->ops->update_irq_enable(rtc->dev.parent, enabled);
+		if (!err)
+			rtc->uie_rtctimer.enabled = enabled;
+		if (err != -EINVAL)
+			goto out;
+	}
+
 	if (enabled) {
 		struct rtc_time tm;
 		ktime_t now, onesec;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 5f8e438a0312..63dad8dfe278 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -68,6 +68,7 @@ struct rtc_class_ops {
 	int (*set_offset)(struct device *, long offset);
 	int (*param_get)(struct device *, struct rtc_param *param);
 	int (*param_set)(struct device *, struct rtc_param *param);
+	int (*update_irq_enable)(struct device *, unsigned int enabled);
 };
 
 struct rtc_device;
-- 
2.34.1



