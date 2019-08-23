Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E592B9AC82
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 12:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392223AbfHWKHz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 06:07:55 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46966 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfHWKHz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 06:07:55 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AA8501A02FE;
        Fri, 23 Aug 2019 12:07:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 12AA81A06EC;
        Fri, 23 Aug 2019 12:07:49 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 17F41402E1;
        Fri, 23 Aug 2019 18:07:43 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [1/3] rtc/fsl: support flextimer for lx2160a
Date:   Fri, 23 Aug 2019 17:57:38 +0800
Message-Id: <20190823095740.12280-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The patch supports flextimer for lx2160a

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 4f7259c2d6a3..2b81525f6db8 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] = {
 	{ .compatible = "fsl,ls1088a-ftm-alarm", },
 	{ .compatible = "fsl,ls208xa-ftm-alarm", },
 	{ .compatible = "fsl,ls1028a-ftm-alarm", },
+	{ .compatible = "fsl,lx2160a-ftm-alarm", },
 	{ },
 };
 
-- 
2.17.1

