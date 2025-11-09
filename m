Return-Path: <linux-rtc+bounces-5303-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF386C43905
	for <lists+linux-rtc@lfdr.de>; Sun, 09 Nov 2025 07:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BCE6188B676
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Nov 2025 06:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B4121ABC1;
	Sun,  9 Nov 2025 06:08:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273DB1494C3;
	Sun,  9 Nov 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762668521; cv=none; b=d1FvJoPVw/22ST2jMHPOvgUjZkxrqrkcQYa5H9bwAyPSJgd17B4pneUG4WLyFwBfAS7RKk9Xh5g1TPqXCSJMbv9/mE+Sbt5cYpeDTJXpCRHx/pGYiy0NhXfvVMnVwNOAyEcVCD5oEC2v3nxyv8TuZ8sEW9Hw8sJXLkHWXkB1pbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762668521; c=relaxed/simple;
	bh=JzGe8gBqJqRG3DdvZham7oPo7ql6kFZuuuNn+lKnDPU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=S5tyrZiKaDX1xGL3c8RsEds7bcQbAFvUuhVLfm5zRIQEsSgxRfDUE0kFPVXvrwFOqlH41S0YyURHM8JREXtDaxen3j//y3uQVNSpmPUgu++Q+OdSm69144psijO84Pz7xpcGujoQZrKnazKjP9Rt1K0eTJULmKYNBEGbqva8LvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowAD3jMzTLxBpN0cSAA--.2587S2;
	Sun, 09 Nov 2025 14:08:30 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: Fix error handling in devm_rtc_allocate_device
Date: Sun,  9 Nov 2025 14:08:17 +0800
Message-Id: <20251109060817.5620-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:qwCowAD3jMzTLxBpN0cSAA--.2587S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxAF13Gr47GF1Utw18Krg_yoW8GFW7pF
	4fCa90krWUJr48Gw17u3WkuFyYgw4SkayfGF1xGwna9F93ZFyqyryxtryIqw18JFWkGay3
	XFy7Ga1rCF18C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUOo7_UUUUU=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

In rtc_allocate_device(), device_initialize() sets the reference count
to 1. In rtc_allocate_device(), when devm_add_action_or_reset() or
dev_set_name() fails after successful device initialization via
device_initialize(), rtc_allocate_device() returns an error without
properly calling put_device() and releasing the reference count.

Add proper error handling that calls put_device() in all error paths
after device_initialize(), ensuring proper resource cleanup.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 3068a254d551 ("rtc: introduce new registration method")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/rtc/class.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index b1a2be1f9e3b..db5f33a22b14 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -379,13 +379,17 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 	rtc->dev.parent = dev;
 	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
 	if (err)
-		return ERR_PTR(err);
+		goto err_put_device;
 
 	err = dev_set_name(&rtc->dev, "rtc%d", id);
 	if (err)
-		return ERR_PTR(err);
+		goto err_put_device;
 
 	return rtc;
+
+err_put_device:
+	put_device(&rtc->dev);
+	return ERR_PTR(err);
 }
 EXPORT_SYMBOL_GPL(devm_rtc_allocate_device);
 
-- 
2.17.1


