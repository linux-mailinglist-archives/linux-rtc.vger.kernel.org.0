Return-Path: <linux-rtc+bounces-74-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A077BEC83
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 23:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218761C20CD9
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 21:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607BE41235;
	Mon,  9 Oct 2023 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZGGPv8Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465242030B
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 21:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3B9C433CB;
	Mon,  9 Oct 2023 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886074;
	bh=ESmiH/TEMoyx2a7FlX65mUwzXaBIM0ko/o8gmuHHSoo=;
	h=From:To:Cc:Subject:Date:From;
	b=ZZGGPv8QSL2rXh+PxVZvekJ/yuCN1VFSLEc6tXQOTwetm5HnA7ds3y1wIY5M4MFmc
	 IEsixsfZBC9jQmqsIWRIFeMaO2bVmZ20Jo5sKT2I/VLE4HOMKflQsPekscqYoQLeYn
	 g19UzVvIb+iH7kIwnnwCFo8H8/GVVjYyS2Xkq1MVPg57e5pk9iqjpyHNEdavd+UQ5f
	 1b4Ql9ZUueL3emkuU2N4q/utxrQhHks5VjKvLRuweDt7tkBeyAgFQiXmJHL4lsM0Uu
	 Np/IHyxjMvCbvOvOuVAPir61fSQGmMyD1q/F47sTZG2Q+oaGfIZ0IfMPoR0Be4rQW+
	 4n7YjbV4LfsjA==
Received: (nullmailer pid 3246161 invoked by uid 1000);
	Mon, 09 Oct 2023 21:14:13 -0000
From: Rob Herring <robh@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: omap: Use device_get_match_data()
Date: Mon,  9 Oct 2023 16:13:42 -0500
Message-ID: <20231009211356.3242037-12-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/rtc/rtc-omap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 5b10ab06cd2e..c6155c48a4ac 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -18,12 +18,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/rtc.h>
 #include <linux/rtc/rtc-omap.h>
 
@@ -729,16 +729,14 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	struct omap_rtc	*rtc;
 	u8 reg, mask, new_ctrl;
 	const struct platform_device_id *id_entry;
-	const struct of_device_id *of_id;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
-	of_id = of_match_device(omap_rtc_of_match, &pdev->dev);
-	if (of_id) {
-		rtc->type = of_id->data;
+	rtc->type = device_get_match_data(&pdev->dev);
+	if (rtc->type) {
 		rtc->is_pmic_controller = rtc->type->has_pmic_mode &&
 			of_device_is_system_power_controller(pdev->dev.of_node);
 	} else {
-- 
2.42.0


