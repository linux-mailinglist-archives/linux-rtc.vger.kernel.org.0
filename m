Return-Path: <linux-rtc+bounces-4660-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59041B20186
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAC0179555
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDB126C3B6;
	Mon, 11 Aug 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QNZtTEE2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30E17DFE7;
	Mon, 11 Aug 2025 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900183; cv=none; b=rzYuHlY8x40ei3uxWACqHC4h3thoUOmpUITv6C0VRcs2IXnWm/kJGRVO5hYAIMFFMPU+JplFyQEvIQIShxUqspNxyXmhA753Hc6kHIpX5frOlMSP9isqz5PoLPmBjZ8HGvSW8hnH4Kyt5nXzYK7rfq3L8BoYfmujbIuKVlCt5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900183; c=relaxed/simple;
	bh=srm3zsoprTKXB85DJvR2KprlSioEN2mDA9xeJVhDzcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwkEZ1PRu6KrFeBQveUwB6fkrnONQUY6G7i+ZkCkIM9iBIF/UqgRB6/0CZMM0IU5nijyh4TgIpXiHH4pFRO0bJTaa8nlTy76wfo6j9iQGDshCJbyBjKFT3oJpoK9E5zK04xcJx1pre9g6l1TS8Wjsz5a5/HJIKYsCAOi1ulMsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=QNZtTEE2; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6e046d2c768b11f0b33aeb1e7f16c2b6-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x/e5kCslJYDoFpQ6zaF3VOwpJkCoYx1KKrXOFc+oh2Q=;
	b=QNZtTEE2rzaqZDZGephNySLtzpjwf0mgv++vMoadLqHf8URiYECyPcRluyhC8GiHfC8hSbAZGJ+QmnNvwJ1VzN4OLzkDIAeQNPi0FDcQ8KfZoaVLYn458j/JtTsM0KAHCy0KzhfFOo7AJvL9Gc3hh6p/zBrlviHf4ZEGJFCA+lw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:1b0383d7-e001-4440-8e5f-6a0cb6f59297,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:1335d09d-7ad4-4169-ab95-78e9164f00fe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e046d2c768b11f0b33aeb1e7f16c2b6-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 392357454; Mon, 11 Aug 2025 16:16:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:16:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:59 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and shutdown handling
Date: Mon, 11 Aug 2025 16:15:34 +0800
Message-ID: <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

This patch introduces a new function, mtk_rtc_reset_bbpu_alarm_status,
to reset the BBPU alarm status in the MT6397 RTC driver. This function
writes the necessary bits to the RTC_BBPU register to clear the alarm
status and ensure proper operation.

Additionally, the mtk_rtc_shutdown function is added to handle RTC
shutdown events. It resets the BBPU alarm status and updates the
RTC_IRQ_EN register to disable the one-shot alarm interrupt,
ensuring a clean shutdown process.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b..063bd399de8c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	return ret;
 }
 
+static void mtk_rtc_reset_bbpu_alarm_status(struct mt6397_rtc *rtc)
+{
+	u32 bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
+	int ret;
+
+	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_BBPU, bbpu);
+	if (ret < 0) {
+		dev_err(rtc->rtc_dev->dev.parent, "%s: write rtc bbpu error\n",
+			__func__);
+		return;
+	}
+
+	mtk_rtc_write_trigger(rtc);
+}
+
 static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 {
 	struct mt6397_rtc *rtc = data;
@@ -51,6 +66,8 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
 				 irqen) == 0)
 			mtk_rtc_write_trigger(rtc);
+
+		mtk_rtc_reset_bbpu_alarm_status(rtc);
 		mutex_unlock(&rtc->lock);
 
 		return IRQ_HANDLED;
@@ -297,6 +314,22 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
+static void mtk_rtc_shutdown(struct platform_device *pdev)
+{
+	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	mtk_rtc_reset_bbpu_alarm_status(rtc);
+
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + RTC_IRQ_EN,
+				 RTC_IRQ_EN_ONESHOT_AL, 0);
+	if (ret < 0)
+		return;
+
+	mtk_rtc_write_trigger(rtc);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int mt6397_rtc_suspend(struct device *dev)
 {
@@ -345,7 +378,8 @@ static struct platform_driver mtk_rtc_driver = {
 		.of_match_table = mt6397_rtc_of_match,
 		.pm = &mt6397_pm_ops,
 	},
-	.probe	= mtk_rtc_probe,
+	.probe = mtk_rtc_probe,
+	.shutdown = mtk_rtc_shutdown,
 };
 
 module_platform_driver(mtk_rtc_driver);
-- 
2.46.0


