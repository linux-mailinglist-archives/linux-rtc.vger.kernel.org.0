Return-Path: <linux-rtc+bounces-2669-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C29E5439
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 12:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C702834C7
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 11:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CE220B816;
	Thu,  5 Dec 2024 11:43:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853EC209691;
	Thu,  5 Dec 2024 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398995; cv=none; b=PZoTds1UyU0XwmbxHAZUJijeWsFawYfTPeAKx67WrotVC6ehEnPoCsv4cALO7XwZb5MtCTACFbnqGxYtYGxUQxmLpqLfgQ6vdmEr1xYeo/2hROEPKBitKp5pi9yM+GkUqN++M8txwfmjFcII1qMXAWNfAMGK7kL23o4g8AelgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398995; c=relaxed/simple;
	bh=KtQLCMZ7iHyVdozQv7fcFaIpAl5CUnSrYVHp95gFZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=frFbDqLg8E+lpJyQQNLUmAcWZJ2Kzu4+sPU59k/rOAKcyLXOAvr9bfXl74t+RBGoFouWhghNnbJppYBZY1w0g8disExTmTVRvQKf9Y1HBpMHwxS3rcOZu0A1J3FYSx0Ul+BbrBFoYwQtejxaidAqOfWq5NYhRUUb4+w8/RpvZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.135.20])
	by gateway (Coremail) with SMTP id _____8CxTOLNkVFnGoVRAA--.26374S3;
	Thu, 05 Dec 2024 19:43:09 +0800 (CST)
Received: from ubuntu.. (unknown [10.180.135.20])
	by front1 (Coremail) with SMTP id qMiowMAxbODLkVFnFeR2AA--.40380S2;
	Thu, 05 Dec 2024 19:43:08 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	WANG Xuerui <git@xen0n.name>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn,
	gaojuxin@loongson.cn
Subject: [PATCH v2] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
Date: Thu,  5 Dec 2024 19:43:07 +0800
Message-ID: <20241205114307.1891418-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxbODLkVFnFeR2AA--.40380S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQECEmdQ2z8OfwAAsy
X-Coremail-Antispam: 1Uk129KBj93XoW7uF43tFyxZF1xGw47JF13Awc_yoW8Cryxpr
	W3C3WDursYvr48Cas5Jay8WrWay393Jr9ruF4xK3yF93Z8Aa4UXF4FgFyUJrWDur95AFWY
	q3yUCFW5u3WqkwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8
	8n5UUUUU=

The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
otherwise the interrupt cannot be cleared, which will cause the
loongson_rtc_isr() to be triggered multiple times.

The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler(),
which is an ACPI interrupt. This did not prevent loongson_rtc_isr()
from being triggered multiple times.

This commit moves the clearing of TOY_MATCH0_REG to the
loongson_rtc_isr() to ensure that the interrupt is properly cleared.

Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
v1 -> v2: Fix commit message function name format and add missing blank line.
---
 drivers/rtc/rtc-loongson.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index e8ffc1ab90b0..90e9d97a86b4 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -114,6 +114,13 @@ static irqreturn_t loongson_rtc_isr(int irq, void *id)
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
 	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+
 	return IRQ_HANDLED;
 }
 
@@ -131,11 +138,7 @@ static u32 loongson_rtc_handler(void *id)
 	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
 	spin_unlock(&priv->lock);
 
-	/*
-	 * The TOY_MATCH0_REG should be cleared 0 here,
-	 * otherwise the interrupt cannot be cleared.
-	 */
-	return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+	return ACPI_INTERRUPT_HANDLED;
 }
 
 static int loongson_rtc_set_enabled(struct device *dev)
-- 
2.43.0


