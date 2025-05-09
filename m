Return-Path: <linux-rtc+bounces-4069-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9F6AB0783
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 03:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F166C1898D2F
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 01:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F28126F0A;
	Fri,  9 May 2025 01:41:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A9946C;
	Fri,  9 May 2025 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754908; cv=none; b=T7K8RyeOF3XToDSNOjdBeIlCjIBTEw+XlNmYBaB7qzYAChOM0/0tbEYka+/FUgG/tyc+CCmAIFlaHUgFhHZ2QB7RSAlQRkAT0E8MrJhCxbyhSJ4eAuuizNTbs3U4muMS0BxZxrBA3agg3xTzDxKg/U+mbKt+6hY/M1Q2drU2bL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754908; c=relaxed/simple;
	bh=QPSI/nDUyiW2FjAADn1tIo0LfEblwaUPPvLyUjoQ+YI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uDXpDq2LDhWXMS6f+PN1qsRIG6WdmZsU0t7QKp2gbG3GNV+BlW43kDshuhHgbEYoRViL6ev/MU460PZIsV1qYdq7lvl2nfSMFUNFiz0KUWlM0nGX92aK26mUuDrtY2ADqMiyjmDPlTjxhW8xNntVm1Nezs+s9TRHKu7ZCu0ul5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=none smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz7t1746754851t03ce554a
X-QQ-Originating-IP: HsWACdo/6p+2+Xlv0CaWzUOgRr9FlLvbn1+uFwpn1/U=
Received: from localhost.localdomain ( [118.249.225.48])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 09:40:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3901934880426052766
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: alexandre.belloni@bootlin.com,
	zhoubinbin@loongson.cn,
	wangming01@loongson.cn
Cc: chenhuacai@kernel.org,
	gaojuxin@loongson.cn,
	git@xen0n.name,
	jiaxun.yang@flygoat.com,
	keguang.zhang@gmail.com,
	lixuefeng@loongson.cn,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1] rtc: loongson: Add missing alarm notifications for ACPI RTC events
Date: Fri,  9 May 2025 09:40:46 +0800
Message-Id: <20250509014046.7399-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: M4K5nIxZYv59t91TMkjmmNWmR+c21lQggGOkJLlnptcVQ/mtq1sTHrlX
	kJb9NqeQK9c0kAs2RGNWGeafEQLRTDVPE1MstE4KhZYQo/uB1j34Mz758Xg3jF6PLUTe/jK
	D1iH3D0thCIsap37ZYmGxCI0RP2isYgqNhsN11wM4oX3DwX8qHYf3lHuAWmH7B9qId8m+EO
	tZhiav44UxafTEXKs3pexKiKppTVkr6ffV0d9S+P7CqDJimgz4HKwF6Dy6vXKnEnAgnnTOP
	lnQ6oWlVGGHfL3MudqVzWMy2pF+PDcv39m1INUA/rrS9xUxISsiiHIJJwm9Nn3l7Y31yl6I
	dLuaUcksQoMSME1bd0F3/OJUnkGW7LHKmTjJS7O3zMx9fTVqtLlKza6+Av+hEmq14+Sl/WT
	Dj65ecBTYi8WTu76VuPq2QXAVEkMMTkqRVMcBkUdGWxtG+PO0FFCNEcESSd0y3MbT8oS6dE
	/eg0kt2Qn7z2ME1pPMEwXx+PentRUy4kWVCv1tsCg4+2SxMxnnVnAUvbnKYIZgdaboZREy2
	FygPPNTj9ZKqOKsZQXXNR43Y9/EwWSgaO2cIUWLyGX7sH6YVB1l5bQZhTRdQrGLucLXYmdd
	WlGej3vu0F/6qfgR51SFapH7rQ5Vkd6umkwYps1NXFeQGPM9fX+/kJQ81PlMAGQMKRE9FTP
	YhZaBF8RS8NLFLk8lkFBUHpK3Yoc2R3HDP7+eXx76KGGA9GlIdt3PiQvaHJurOMEn0d46PK
	ILM+oAPnp/IQPi7/MoNga4Pkwzu288OsZGBqR3NmqL+fhrVTiPDa4ehXwvyH4Uj18vfkY7X
	/7EiLFMO7yj4Fy70sNljMLwU4gTP2Sa8pyQF5vCfmQA0K9YwGx0TWYHHio9vAaP8iYjRiyE
	rRTzS8FBLZlY8hp27CFb/oGamlVJ6iakxMReWf9TY9pin8PKXrBrHJj2NlD6/pQOj0fcnlr
	FWg0yKQVOqr5QcEXF3uc1DBq03wRr1zng43afs0AZENiaz2FiKH8JdVAa1qn0f40TeAk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

When an application sets and enables an alarm on Loongson RTC devices,
the alarm notification fails to propagate to userspace because the
ACPI event handler omits calling rtc_update_irq().

As a result, processes waiting via select() or poll() on RTC device
files fail to receive alarm notifications.

Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-loongson.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 97e5625c064c..2ca7ffd5d7a9 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -129,6 +129,14 @@ static u32 loongson_rtc_handler(void *id)
 {
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+
 	spin_lock(&priv->lock);
 	/* Disable RTC alarm wakeup and interrupt */
 	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
-- 
2.33.0


