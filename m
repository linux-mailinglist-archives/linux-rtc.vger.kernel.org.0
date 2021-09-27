Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF62C418F10
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Sep 2021 08:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhI0Gku (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Sep 2021 02:40:50 -0400
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com ([40.107.93.75]:3232
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232955AbhI0Gks (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 27 Sep 2021 02:40:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFiBIIWSQNZ6zuv1tsbqUnmS1hxJYQ4o2Ek492PgktVinA9PlhISogIs4pow9dCLq08r83OW8Pid7B6jZHXLfWZ65etABW3TBDVFqB5E/gVUPe6x97DOI9LgOTFbYWfLiEdDloCQZn+QAeFgLPH8XWRCtTNegA806JvOTtjRWOz4PLwQ8Q4OE5CZRGEpYBP5qwc834+8b/Eg0i1UTCk0iE60BO45tpweEYYaWX0bjarlKd3v5hSSHVrrLgaffqNVkj8z8FOLqdXbJELUSfRm2VUNXUHmczcC++WzjhUdX3ebK4vAbdHDTajGCgKWRgi/Mg5U7sIMLbiIOD2qInbp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Y374y5IlMRQ7aUgiulltuj5Rk/zq79jL9KOT64z/iMs=;
 b=McoOjxLoMGczYgoG/TNVpjscepXVqQ/XRDMpxNLT3+bC65UN+9V14lMcwbYAK1EIAqm5A1I/8Zdro5Cn0pVC+EOw+OPHMJCA7zozBK+8/pw37KcAaHbKSMdlYRcv/WT2kk9cB4l5kITIWty5LVTfOOonVMf7K9LyVU3qDV6FBu6RVQinw+hjqldZSuInLCwWnicpUimmtftGLEuzs38BCG4OJnZYkHk3Uk7K4rhP2KPnDeWOas9VjKVJHb6Sk6uihJRiwfQyMaMT+LDwIHZmcSNxu/zg20fJhE2cLUpm1SJe8hg2S/rRIzBw6FB6iciseErv+Vv05AFzrrcDaOjWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=towertech.it smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y374y5IlMRQ7aUgiulltuj5Rk/zq79jL9KOT64z/iMs=;
 b=Qip1pHxfKVrS587Oh9Q5AMnENMr//mJoKen4HUEhvEKinQIVDhB25qS87UQ3eCmjn5H2Vs0RPqq4843bvhMiEGueB5GGOafcJiAOV8JJT9sxMbSg4Ee0bkQZZ34N1U59QBo0RomeBVKMYPv7jW6nJbRrOcvbKqsFSVLFyJOXCck=
Received: from DM5PR07CA0166.namprd07.prod.outlook.com (2603:10b6:3:ee::32) by
 SJ0PR02MB8768.namprd02.prod.outlook.com (2603:10b6:a03:3d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 06:39:09 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::2a) by DM5PR07CA0166.outlook.office365.com
 (2603:10b6:3:ee::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 06:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 06:39:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 26 Sep 2021 23:38:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 26 Sep 2021 23:38:46 -0700
Envelope-to: git@xilinx.com,
 a.zummo@towertech.it,
 alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.66.193] (port=60102 helo=xhdsneeli40u.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1mUkHl-00073C-F9; Sun, 26 Sep 2021 23:38:45 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <michal.simek@xilinx.com>, <sgoud@xilinx.com>,
        <shubhraj@xilinx.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2] rtc: zynqmp: Add calibration set and get support
Date:   Mon, 27 Sep 2021 12:08:37 +0530
Message-ID: <20210927063837.38478-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2491918-ef46-47db-384b-08d98181828e
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8768:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB8768A617B49D808900356DC6AFA79@SJ0PR02MB8768.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gzqfqZZjgC+QaFJRHicmsd+w9O+wLcTw4CfJQiLXHOQzJ/tMWb7HFAdVdzHBlgy3ALteSNwGMTySkgR8EIJOg05Y2ch0F9XL1tZjeYRXrjei6pPEsx+hKjooIZIBmXQFFpAgoJteQmHxqUto3a3hS6VlhRwLkDIuefwdhUo2E4k7MINuMbtFwZETxbFMxNXkfVQimPgr5cd04dgv/GsgfjL24GwOKMKonQxO5LjCxEREyvaTN2evYzJXARfJXdKS3Qy8p22/J0s9YFF5Nk9U1N+ImfOTKDKXOvvZNlId8u0yI8z8aFC9UsnAOqS7tL/9wnhBGu2SwWmZTp34O4yB9HkwrZj5N/fznqYU9VR3IwpCRx2IU17b8eEzlocCsasiGzlr3DWZ6otPa1U+Z915DhSyEdBm7hg8Dv6H5yE0V4pF7yfCxDr2x08VCpWOT7eceZn7WE7ErQ8h9J7XQILmvblrVuMNNNRisyRhli6EfNJChEEXpsr6hXnkEmnJqUXtARTMgYP5E8a7nIgVtOMaQAMxmyWany7hpau7cfwizWQ1xwoWqkqWjMBMWFlTPDBQYFHYI2HI7iEaUogoCMVgFD4CNtz7D+N2a4uPQfqF8Y1ddBbY2SAvPgiUSZmMHF1FwEu4YVxVXrkkHsM91TN5YBgygVQkL9bfcVJaIpI5+76aHUgXfI4r5hr464hoAPEIXedbc71lL/JCIxSuqdFQqOaMAF1y+P4kzGtlVm3eBwoXKN/MZefOeb92/mza3fs7
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6666004)(36756003)(54906003)(110136005)(336012)(36860700001)(2616005)(186003)(44832011)(1076003)(47076005)(83380400001)(26005)(426003)(9786002)(8936002)(4326008)(316002)(70206006)(36906005)(107886003)(82310400003)(70586007)(6636002)(8676002)(2906002)(7696005)(508600001)(7636003)(356005)(5660300002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 06:39:08.9849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2491918-ef46-47db-384b-08d98181828e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8768
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Zynqmp RTC controller has a calibration feature to compensate
time deviation due to input clock inaccuracy.
Set and get calibration API's are used for setting and getting
calibration value from the controller calibration register.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V2:
-Removed unused macro.
-Updated code with review comments.
---
 drivers/rtc/rtc-zynqmp.c | 100 ++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f440bb52be92..3731ddfbd90f 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -36,10 +36,15 @@
 #define RTC_OSC_EN		BIT(24)
 #define RTC_BATT_EN		BIT(31)
 
-#define RTC_CALIB_DEF		0x198233
+#define RTC_CALIB_DEF		0x8000
 #define RTC_CALIB_MASK		0x1FFFFF
 #define RTC_ALRM_MASK          BIT(1)
 #define RTC_MSEC               1000
+#define RTC_FR_MASK		0xF0000
+#define RTC_FR_MAX_TICKS	16
+#define RTC_OFFSET_MAX		150000
+#define RTC_OFFSET_MIN		-150000
+#define RTC_PPB			1000000000LL
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -61,13 +66,6 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -174,14 +172,76 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
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
@@ -190,6 +250,8 @@ static const struct rtc_class_ops xlnx_rtc_ops = {
 	.read_alarm	  = xlnx_rtc_read_alarm,
 	.set_alarm	  = xlnx_rtc_set_alarm,
 	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
+	.read_offset	  = xlnx_rtc_read_offset,
+	.set_offset	  = xlnx_rtc_set_offset,
 };
 
 static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
@@ -215,6 +277,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 {
 	struct xlnx_rtc_dev *xrtcdev;
 	int ret;
+	unsigned int calibval;
 
 	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
 	if (!xrtcdev)
@@ -256,9 +319,12 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
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
2.17.1

