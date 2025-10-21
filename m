Return-Path: <linux-rtc+bounces-5119-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A49BF5CEA
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 12:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2714353668
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 10:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8D732C929;
	Tue, 21 Oct 2025 10:36:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F882E0B69;
	Tue, 21 Oct 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042973; cv=none; b=EpI0fxJrVdqV3AhwuAueATV/TwRaWgeNC4xk3+C8eKfH2Q6tX5uRhNNox1jkpAmmzVskMyOjn9mYbiKM4cRNvRbT5UQzBy1qitZyUJ7eRyMYZKsHjcgWmd8qvK5J9HB2a+xOW9RLL+AYqCdrFtYUT0kFQadp/4u/IyyQqxHOIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042973; c=relaxed/simple;
	bh=z5/ouA/lkPvRzzd66BOW2E3EPXfOyczpHSlNwGkFNUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBL1F31rsVeDpVf462Q6oTdewqWwJctg+CmwBuXU0xj27aoTXEXfjHIw1lDvrsQwT8fZxD77THuucFSzVO5IAd3aHBKlHo5AGqOXJQZDUB7KFpw5vUz6zsfZ6mC8gns5DdjuDT7D28miRyp22LQHto0TER/MpMPXTgTJrtbX5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnyhMRYvdo3tXeEg--.23830S2;
	Tue, 21 Oct 2025 18:36:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com,
	yiting.deng@amlogic.com,
	xianwei.zhao@amlogic.com
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] rtc: amlogic-a4: fix double free caused by devm
Date: Tue, 21 Oct 2025 18:35:59 +0800
Message-ID: <20251021103559.1903-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251020150956.491-1-vulab@iscas.ac.cn>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnyhMRYvdo3tXeEg--.23830S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr18AFWfAr4DKrWUZr48Xrb_yoW8GF1DpF
	WxGFyj9FsIgFW8Kan8Xr1UXF15t3y8ta4IgrWUW3sa93WrJFy8AFWxtF18Xan5CFWkGa13
	Wr4Utr1rGF1DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUrF4iDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkCA2j3I1HxSAAAsb

The clock obtained via devm_clk_get_enabled() is automatically managed
by devres and will be disabled and freed on driver detach. Manually
calling clk_disable_unprepare() in error path and remove function
causes double free.

Remove the redundant clk_disable_unprepare() calls from the probe
error path and aml_rtc_remove(), allowing the devm framework to
automatically manage the clock lifecycle.

Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
v2: Also remove the now-unused local variable 'rtc' in aml_rtc_remove()
---
 drivers/rtc/rtc-amlogic-a4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 1928b29c1045..a993d35e1d6b 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -390,7 +390,6 @@ static int aml_rtc_probe(struct platform_device *pdev)
 
 	return 0;
 err_clk:
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(dev, false);
 
 	return ret;
@@ -423,9 +422,6 @@ static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
 
 static void aml_rtc_remove(struct platform_device *pdev)
 {
-	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(&pdev->dev, false);
 }
 
-- 
2.25.1


