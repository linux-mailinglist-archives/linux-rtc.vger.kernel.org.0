Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41607197BD9
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgC3M3x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 08:29:53 -0400
Received: from inva021.nxp.com ([92.121.34.21]:39510 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729785AbgC3M3x (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 30 Mar 2020 08:29:53 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B71182004B3;
        Mon, 30 Mar 2020 14:29:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 42C642004BE;
        Mon, 30 Mar 2020 14:29:48 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1541240297;
        Mon, 30 Mar 2020 20:29:44 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     alexandre.belloni@bootlin.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: rtc: fsl-ftm-alarm: add shutdown interface
Date:   Mon, 30 Mar 2020 20:26:16 +0800
Message-Id: <20200330122616.24044-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Add shutdown interface

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index d7fa6c16f47b..118a775e8316 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -307,6 +307,15 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void ftm_rtc_shutdown(struct platform_device *pdev)
+{
+	struct ftm_rtc *rtc = platform_get_drvdata(pdev);
+
+	ftm_irq_acknowledge(rtc);
+	ftm_irq_disable(rtc);
+	ftm_clean_alarm(rtc);
+}
+
 static const struct of_device_id ftm_rtc_match[] = {
 	{ .compatible = "fsl,ls1012a-ftm-alarm", },
 	{ .compatible = "fsl,ls1021a-ftm-alarm", },
@@ -321,6 +330,7 @@ static const struct of_device_id ftm_rtc_match[] = {
 
 static struct platform_driver ftm_rtc_driver = {
 	.probe		= ftm_rtc_probe,
+	.shutdown	= ftm_rtc_shutdown,
 	.driver		= {
 		.name	= "ftm-alarm",
 		.of_match_table = ftm_rtc_match,
-- 
2.17.1

