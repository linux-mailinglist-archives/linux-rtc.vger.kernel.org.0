Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091CA3C7FC6
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jul 2021 10:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbhGNILU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Jul 2021 04:11:20 -0400
Received: from mail-co1nam11on2053.outbound.protection.outlook.com ([40.107.220.53]:22791
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238343AbhGNILT (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 14 Jul 2021 04:11:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVjZQB5m7gyn0nHy826KSHsS+MqnhGNtYNRyJrijXulJD2bXl1FMZtTYPjR4TY6/5chmViwIYe28sdW8CqnH633rPTNoHO+dn78j3IhSU3E/LbhbXWi1yxsmIUTjMSpuC+ffLNRUUvzY6LROZqRAJ7msbmovvRCJrJdSnfRTPqcmHWdYbxSJDtUEVeVi/r7SKU1wUTGR4N4RrjCUem6ivEcz9T1obnLOODS/R3gtwW8VWt29L0wh+4w+wKbUrVRJUrHOBONXy/gNB4yhVsuDDDorUvrVpEMaI+HHvyFzAgsEyw74cDqW+t5s2wXAZt5zZuAFcW3RwHrx79UICqaAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52KCmdHBf87mICT6mt4GC9cZbpx9CEDzvtlAuXVocVc=;
 b=GTlK00g+hf78y0aSsDCu0kw5Ex0222+1qNW+mB0+5hAMnjd0ORAy0SbIYQXTyuZ6Zrl2/cyFJS67wGH1fwwwfnWPSlIW7qcAi/SXwRMRxg8rRtbVqfiUClzJuoX77EJ8XM/QomdCehgAzPwx7NIWwlUZhrWSPRm8z2B5Jo6jNrAse09VDMH2dw+fF9OGc5Y0XrDQ09rnO5zpwK3euuICPwYajItbNdJZulDZWD8dMKWOpAS6ww1FMCDn38B9aVR+u+kR5plCOqQWG3HMMtyaT1hanWat2DnuLqstWWPATllYLD2MKUH/FUiBbt3FbxlpTZJsNV8CZ1ddQ6iqtDyZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=towertech.it smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52KCmdHBf87mICT6mt4GC9cZbpx9CEDzvtlAuXVocVc=;
 b=KAqgGt1QtTcW9NybsFQXWaXaluYMDprzJPwHn4rypJq6QTWNjdHNzyUauWzZzutxvKCwjK7jtc5cW5tgXe64ViB8Z45g2Plt4TqShrdzvzKkhvSFlMQaQ+uzrDyt+8kO8OGk90O/PFLs5Z4zS5Vj241JcotL69ZkoCIK2p2gtSo=
Received: from DM6PR07CA0100.namprd07.prod.outlook.com (2603:10b6:5:337::33)
 by SN6PR02MB4351.namprd02.prod.outlook.com (2603:10b6:805:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 08:08:24 +0000
Received: from DM3NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::24) by DM6PR07CA0100.outlook.office365.com
 (2603:10b6:5:337::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 14 Jul 2021 08:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT046.mail.protection.outlook.com (10.13.4.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 14 Jul 2021 08:08:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Jul 2021 01:08:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 14 Jul 2021 01:08:23 -0700
Envelope-to: git@xilinx.com,
 a.zummo@towertech.it,
 alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.81.239] (port=57830 helo=xhdsneeli41x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1m3ZwL-000AKo-SH; Wed, 14 Jul 2021 01:08:22 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <michal.simek@xilinx.com>, <sgoud@xilinx.com>,
        <shubhraj@xilinx.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH] rtc: zynqmp: Add calibration set and get support
Date:   Wed, 14 Jul 2021 13:38:09 +0530
Message-ID: <20210714080809.34289-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91321ba1-7cf8-4ed7-fc57-08d9469e8dc0
X-MS-TrafficTypeDiagnostic: SN6PR02MB4351:
X-Microsoft-Antispam-PRVS: <SN6PR02MB43518FAA752C4F563FF23475AF139@SN6PR02MB4351.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JvL908xtNRWCAv+rodhXw0zDGSQQVOSMtv5nFS57+scXlM1k4yftKWNuY2kN5Gy5IABPwnz47Spy2Qe2atWWGpRtK1Ypf1oMFduVQ7RSvGWqfjmiFfhmFqxYCHVsl4DXldLkbEcUhkYN81xTDLBv+2PCEjh48hPzMAYoOY3vpiuH8qF36KBIRAmfM4Mh+uYYAsNbixo8qGe07wy1c9ve5LWfoQ0cxFXgQtUmjqT1naG6+IpBF0m97k8AcXHXU+H6wZEjw9Iw3vuaPT1pPEfHRZvSx4aDH+LjkJJK3oF32Rdmw4p4OqOOkMTV6wVbwz+tLHoUYxAco36/nsT9wPQgwN8Fe7fNSs/6U8WL0KQOphrXYP183bewo1bxNrPsqXBrb6R0YWbSs9uZCBs8NMvM4PpEo0YE/5CesP/jR7MiqAWQdjv3aXsRa2508NaKayYxOADHJh0Y0bsq5ZaEZr+BF7qPL2fdYn4E1dWrWZ9SMrhG0F0gf5pz6tPOfsmTaaNWEKAO2bA5OGQyPJY2op72ULoRJixQWWNNry+pKkzr4gQc4H9BLVKzFPkAis7u+uQ+zAED+loEvPatGCxNgFMREo8ZrQ4fRi2lbjrbduGy6F4J+KtrY3sp0VYNhNQkyuEWr6PwNZupkMOYrFCMwtT8FuzAIWmNMgNacY482lLpIiyUVfP182MAu1bFUnCuYdMZSThizlSSzwwh4nzbedu4qa8jeYYzB4tJZ0O+us/I61+7E5qEdo197tP1FO8xlNw
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(5660300002)(47076005)(70586007)(186003)(70206006)(7696005)(82740400003)(82310400003)(36756003)(26005)(36860700001)(36906005)(83380400001)(54906003)(8936002)(2906002)(2616005)(7636003)(9786002)(6666004)(44832011)(356005)(110136005)(4326008)(107886003)(478600001)(336012)(8676002)(6636002)(1076003)(426003)(316002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 08:08:24.5708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91321ba1-7cf8-4ed7-fc57-08d9469e8dc0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4351
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Zynqmp RTC controller has a calibration feature to compensate
time deviation due to input clock inaccuracy.
Set and get calibration API's are used for setting and getting
calibration value from the controller calibration register.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/rtc/rtc-zynqmp.c | 101 ++++++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f440bb52be92..718f60d42760 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -36,10 +36,16 @@
 #define RTC_OSC_EN		BIT(24)
 #define RTC_BATT_EN		BIT(31)
 
-#define RTC_CALIB_DEF		0x198233
+#define RTC_CALIB_DEF		0x8000
 #define RTC_CALIB_MASK		0x1FFFFF
 #define RTC_ALRM_MASK          BIT(1)
 #define RTC_MSEC               1000
+#define RTC_FR_MASK		0xF0000
+#define RTC_SEC_MAX_VAL		0xFFFFFFFF
+#define RTC_FR_MAX_TICKS	16
+#define RTC_OFFSET_MAX		150000
+#define RTC_OFFSET_MIN		-150000
+#define RTC_PPB			1000000000LL
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -61,13 +67,6 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 */
 	new_time = rtc_tm_to_time64(tm) + 1;
 
-	/*
-	 * Writing into calibration register will clear the Tick Counter and
-	 * force the next second to be signaled exactly in 1 second period
-	 */
-	xrtcdev->calibval &= RTC_CALIB_MASK;
-	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
-
 	writel(new_time, xrtcdev->reg_base + RTC_SET_TM_WR);
 
 	/*
@@ -174,14 +173,76 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 	rtc_ctrl |= RTC_BATT_EN;
 	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
 
-	/*
-	 * Based on crystal freq of 33.330 KHz
-	 * set the seconds counter and enable, set fractions counter
-	 * to default value suggested as per design spec
-	 * to correct RTC delay in frequency over period of time.
+	/* Update calibvalue */
+	xrtcdev->calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
+}
+
+static int xlnx_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
+	long offset_val = 0;
+	unsigned int tick_mult = RTC_PPB / (xrtcdev->calibval & RTC_TICK_MASK);
+
+	/* Offset with seconds ticks */
+	offset_val = xrtcdev->calibval & RTC_TICK_MASK;
+	offset_val = offset_val - RTC_CALIB_DEF;
+	offset_val = offset_val * tick_mult;
+
+	/* Offset with fractional ticks */
+	if (xrtcdev->calibval & RTC_FR_EN)
+		offset_val += ((xrtcdev->calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
+			* (tick_mult / RTC_FR_MAX_TICKS);
+	*offset = offset_val;
+
+	return 0;
+}
+
+static int xlnx_rtc_set_offset(struct device *dev, long offset)
+{
+	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
+	short int  max_tick;
+	unsigned char fract_tick = 0;
+	unsigned int calibval;
+	int fract_offset;
+	unsigned int tick_mult = RTC_PPB / (xrtcdev->calibval & RTC_TICK_MASK);
+
+	/* Make sure offset value is within supported range */
+	if (offset < RTC_OFFSET_MIN || offset > RTC_OFFSET_MAX)
+		return -ERANGE;
+
+	/* Number ticks for given offset */
+	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
+
+	/* Number fractional ticks for given offset */
+	if (fract_offset) {
+		if (fract_offset < 0) {
+			fract_offset = fract_offset + tick_mult;
+			max_tick--;
+		}
+		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
+			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
+				if (fract_offset <=
+				    (fract_tick *
+				     (tick_mult / RTC_FR_MAX_TICKS)))
+					break;
+			}
+		}
+	}
+
+	/* Zynqmp RTC uses second and fractional tick
+	 * counters for compensation
 	 */
-	xrtcdev->calibval &= RTC_CALIB_MASK;
-	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
+	calibval = max_tick + RTC_CALIB_DEF;
+
+	if (fract_tick)
+		calibval |= RTC_FR_EN;
+
+	calibval |= (fract_tick << RTC_FR_DATSHIFT);
+
+	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
+	xrtcdev->calibval = calibval;
+
+	return 0;
 }
 
 static const struct rtc_class_ops xlnx_rtc_ops = {
@@ -190,6 +251,8 @@ static const struct rtc_class_ops xlnx_rtc_ops = {
 	.read_alarm	  = xlnx_rtc_read_alarm,
 	.set_alarm	  = xlnx_rtc_set_alarm,
 	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
+	.read_offset	  = xlnx_rtc_read_offset,
+	.set_offset	  = xlnx_rtc_set_offset,
 };
 
 static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
@@ -215,6 +278,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 {
 	struct xlnx_rtc_dev *xrtcdev;
 	int ret;
+	unsigned int calibval;
 
 	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
 	if (!xrtcdev)
@@ -256,9 +320,12 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = of_property_read_u32(pdev->dev.of_node, "calibration",
-				   &xrtcdev->calibval);
+				   &calibval);
 	if (ret)
-		xrtcdev->calibval = RTC_CALIB_DEF;
+		calibval = RTC_CALIB_DEF;
+	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
+	if (!ret)
+		writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
 
 	xlnx_init_rtc(xrtcdev);
 
-- 
2.31.1

