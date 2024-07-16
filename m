Return-Path: <linux-rtc+bounces-1505-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEDF931F15
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 05:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 033B0B20DE3
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 03:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BE4BA2F;
	Tue, 16 Jul 2024 03:03:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA2101D4;
	Tue, 16 Jul 2024 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099018; cv=none; b=VhsB9rk+h+PAA9gxQRtvwEiofJVphx+/jBfMuItTXB/cATU3/Vuvt99BfILfZcO1QXBdiSoDLA3tJ22viDLumY5hM+cLEatY2fmM9AoFt2p2ok3J9mWChY7AbNZ5d+TCO0/0bvGtPxPe+cPGjB9fc16p5fHW3macmCg66Fnq8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099018; c=relaxed/simple;
	bh=Qpb/xQXuIOKgJiuFgZVFJH4zCl5bOj+M3rTyJeLsIxw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ugrvQLxWUXzoXyXrGXqt8Pag/4F7jr7XHAzQEIbNRavlGIOOv8mLipBpB89EKbAaSLtuqDYbojr2dWOrlTtD3YO38SGK1sf40lAPuBV1ddgf/GsIwb1GMyFqU9kpK4c/q+3G9eKiUEj+iggbxFr/A6rJc3eQUBvp3ky1Sw8alhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACHj+f54pVmJS+NAw--.51704S2;
	Tue, 16 Jul 2024 11:03:22 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: alexandre.belloni@bootlin.com,
	ladis@linux-mips.org,
	tony@atomide.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] rtc: twl: convert comma to semicolon
Date: Tue, 16 Jul 2024 11:02:52 +0800
Message-Id: <20240716030252.400340-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHj+f54pVmJS+NAw--.51704S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF18Ww1xKr1xur4xXrb_yoWfAFg_Cw
	1YqF4xJ3WkJr1qy3W8Aw45u34jyayjgF1kZr1jgasxA3y2qr18ZasFvrWDAryfXw48GF93
	JwnrXrWkuFW7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
	6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjoKZJUUUU
	U==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: 7130856f5605 ("rtc: twl: add NVRAM support")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/rtc/rtc-twl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index 2cfacdd37e09..4e24c12004f1 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -591,8 +591,8 @@ static int twl_rtc_probe(struct platform_device *pdev)
 	memset(&nvmem_cfg, 0, sizeof(nvmem_cfg));
 	nvmem_cfg.name = "twl-secured-";
 	nvmem_cfg.type = NVMEM_TYPE_BATTERY_BACKED;
-	nvmem_cfg.reg_read = twl_nvram_read,
-	nvmem_cfg.reg_write = twl_nvram_write,
+	nvmem_cfg.reg_read = twl_nvram_read;
+	nvmem_cfg.reg_write = twl_nvram_write;
 	nvmem_cfg.word_size = 1;
 	nvmem_cfg.stride = 1;
 	if (twl_class_is_4030()) {
-- 
2.25.1


