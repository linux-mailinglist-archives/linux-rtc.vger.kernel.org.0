Return-Path: <linux-rtc+bounces-398-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87020804A6E
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Dec 2023 07:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EDDDB20A68
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Dec 2023 06:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D70912E4C;
	Tue,  5 Dec 2023 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L4G8dPUM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48682A4;
	Mon,  4 Dec 2023 22:41:25 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B51uVN9027304;
	Tue, 5 Dec 2023 06:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=huc3944qrFK6MGxccYFPxDHeN84EgsRy740zHLv+jlE=;
 b=L4G8dPUMuI0HzHM7j8i2zlL7yciXNE2geDNH4QY0qOJh9JEFVVdC49t2ClqKwjKxTsgX
 WBd8iR48Vzx47jf8lgJf8r9WXGgloiVaDWMoj0+wA6KeDgjGwQQesiELKxHX8HtCjWWb
 m39Aq3LsdbRjPGO2pG4mO1L43i+7owCoYUZ6f4fmyxoajjBGZ9rM/qyoJdd4IFbut/Qh
 tuWwXPuw35ShGiuobplMwCTFa481iQnW8fNCRgWUZEzIexVU5K20ZPkdFAXvDm+lC0QT
 pvFGOtCTUK0rQhrlSJdEZkSCHdijXk2UcrBmiX4rC0UrLMg1bTzcscwWCxoPErUQ1RHj RQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usfu79ypv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 06:41:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B56fDK0011767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 06:41:13 GMT
Received: from jianbinz-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 22:41:11 -0800
From: jianbinz <quic_jianbinz@quicinc.com>
To: <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
CC: jianbinz <quic_jianbinz@quicinc.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] rtc: rtc-pm8xxx: Retrigger RTC alarm if it's fired before the driver probed
Date: Tue, 5 Dec 2023 14:40:50 +0800
Message-ID: <20231205064050.31827-1-quic_jianbinz@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 392r4c0mU2zyUR5Mc6a_2Sf2ijE9kHhQ
X-Proofpoint-ORIG-GUID: 392r4c0mU2zyUR5Mc6a_2Sf2ijE9kHhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=937 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050053

If the alarm is triggered before the driver gets probed, the alarm
interrupt will be missed and it won't be detected, and the stale
alarm settings will be still retained because of not being cleared.
Check this condition during driver probe, retrigger the alarm and
clear the settings manually if it's such case.

Changes in v2:
*Adapt the V1 patch according to the newest rtc-pm8xxx

Changes in v1:
*During driver probe: read ALARM_EN, read ALARM_DATA, read RTC_RDATA,
if (ALARM_DATA < RTC_DATA), Trigger the alarm event and clear the alarm settins
Link to v1:https://lore.kernel.org/linux-rtc/20220321090514.4523-1-quic_jianbinz@quicinc.com/

Signed-off-by: jianbinz <quic_jianbinz@quicinc.com>
---
 drivers/rtc/rtc-pm8xxx.c | 57 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index f6b779c12ca7..eac4e7f23aaa 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -309,21 +309,33 @@ static int pm8xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	return 0;
 }
 
+static int pm8xxx_rtc_read_alarm_raw(struct pm8xxx_rtc *rtc_dd, u32 *secs)
+{
+	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
+	u8 value[NUM_8_BIT_RTC_REGS];
+	int rc;
+
+	rc = regmap_bulk_read(rtc_dd->regmap, regs->read, value, sizeof(value));
+	if (rc)
+		return rc;
+
+	*secs = get_unaligned_le32(value);
+
+	return 0;
+}
+
 static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
-	u8 value[NUM_8_BIT_RTC_REGS];
 	unsigned int ctrl_reg;
 	u32 secs;
 	int rc;
 
-	rc = regmap_bulk_read(rtc_dd->regmap, regs->alarm_rw, value,
-			      sizeof(value));
+	rc = pm8xxx_rtc_read_alarm_raw(rtc_dd, &secs);
 	if (rc)
 		return rc;
 
-	secs = get_unaligned_le32(value);
 	secs += rtc_dd->offset;
 	rtc_time64_to_tm(secs, &alarm->time);
 
@@ -398,6 +410,39 @@ static irqreturn_t pm8xxx_alarm_trigger(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Trigger the alarm event and clear the alarm settings
+ * if the alarm data has been behind the RTC data which
+ * means the alarm has been triggered before the driver
+ * is probed.
+ */
+static int pm8xxx_rtc_init_alarm(struct pm8xxx_rtc *rtc_dd)
+{
+	int rc;
+	u32 alarm_sec, rtc_sec;
+	unsigned int ctrl_reg, alarm_en;
+	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
+
+	rc = pm8xxx_rtc_read_raw(rtc_dd, &rtc_sec);
+	if (rc)
+		return rc;
+
+	rc = pm8xxx_rtc_read_alarm_raw(rtc_dd, &alarm_sec);
+	if (rc)
+		return rc;
+
+	rc = regmap_read(rtc_dd->regmap, regs->alarm_ctrl, &ctrl_reg);
+	if (rc)
+		return rc;
+
+	alarm_en = !!(ctrl_reg & PM8xxx_RTC_ALARM_ENABLE);
+
+	if (alarm_en && rtc_sec >= alarm_sec)
+		pm8xxx_alarm_trigger(0, rtc_dd);
+
+	return 0;
+}
+
 static int pm8xxx_rtc_enable(struct pm8xxx_rtc *rtc_dd)
 {
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
@@ -527,6 +572,10 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	rc = pm8xxx_rtc_init_alarm(rtc_dd);
+	if (rc)
+		return rc;
+
 	return 0;
 }
 
-- 
2.17.1


