Return-Path: <linux-rtc+bounces-1269-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD419014AB
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Jun 2024 07:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 798A4B21017
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Jun 2024 05:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6847125D5;
	Sun,  9 Jun 2024 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ROU7Tsba"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB32F9E4;
	Sun,  9 Jun 2024 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717912334; cv=none; b=gmzdfBuvdScq8c+25+aqr+iY6ytNor9j/4j+gt5CE+A2r6uFCl9n6khv6s7iBgZuUcwKrgMiy/NVh5rrXGPZnWGU41aao3IlMm5j3mFxRLFOEL9BNtTBKBP/d95YkDRkcR+1quCoM8U09298i0tQIQMLG/qihgn+xAWsjTwkDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717912334; c=relaxed/simple;
	bh=/vxmh5hOYyPDkCuiG+xxbeJXWvzO/BNiwrvOWusGqIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Xb4WAmTfiHjlzT4+JfH+OiJKDyDClgdGt13mrEhbYC9o+fx5yxTN0AZmx8lz0MF2HEYr69SHjvHQO2Qn8y3Uj9YZ9NlL044odyTOO0VsnKJ74mJWBkZYGcqkTbnhP3Grs04hdbYG80QLlKJACvyqGNjRbGYKg+L9cWrkB59+Xd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ROU7Tsba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4594xnbr013417;
	Sun, 9 Jun 2024 05:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0iyWLsns4fdGIeHnp8ygoE
	/PAtrOJcezLajc879zaMg=; b=ROU7TsbaoxX1ztEX3Iu0LTE1s3AfMfjXs8gwsa
	ddxVm/Qm5oNct0JCF+Iuy3o3pBybK5PaUHo+oeDY1mQW1qJj1PHv5deeoZ01tUO4
	ULlgiVyVSa1H2P75EN14QWZmC7FSZfxXc0dRbXN+gLoTURwfdy3Yqdn9bHCywr3/
	AsaCwhTXI+4K0t29hasDZ0ffxO2NFG68oo4JgxoKPH+ynjxejCauH43ZmUxVXZjg
	n28Si2wOJTXZSXq5bKS6M1Lm9Un8WJSFDdsg0gddi6gv8GlKGWqW62QOLOM8dBz5
	0i3f9Q8E3UEn/kokTmmivqrsGYfRQZlRNyNNodUWpaT4Ew+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemghc6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 05:52:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4595q6FH007391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 05:52:06 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Jun 2024
 22:52:04 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 8 Jun 2024 22:52:03 -0700
Subject: [PATCH] rtc: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240608-md-drivers-rtc-v1-1-5f44222adfae@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAJDZWYC/x3MTQqDQAxA4atI1g3EQWTwKqWL+cnUgE5LYkUQ7
 95pl9/ivROMVdhg6k5Q3sXkVRv6WwdpDvXJKLkZHLmBRvK4ZswqO6uhbgkLee/G6PpCCVr0Vi5
 y/If3R3MMxhg11DT/NovUz4FrsI0VrusLeNG8PX8AAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jiaxun Yang
	<jiaxun.yang@flygoat.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2Lf4WyM78J-61eeeInrXX6IuNHeIqueh
X-Proofpoint-ORIG-GUID: 2Lf4WyM78J-61eeeInrXX6IuNHeIqueh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406090044

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-twl.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE(). This includes rtc-mpc5121.c,
which does not produce a warning with the x86 allmodconfig since it is
not built for x86, but it may cause this warning with Freescale PPC
configurations.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/rtc/lib_test.c     | 1 +
 drivers/rtc/rtc-goldfish.c | 1 +
 drivers/rtc/rtc-mpc5121.c  | 1 +
 drivers/rtc/rtc-omap.c     | 1 +
 drivers/rtc/rtc-rc5t583.c  | 1 +
 drivers/rtc/rtc-tps65910.c | 1 +
 drivers/rtc/rtc-twl.c      | 1 +
 7 files changed, 7 insertions(+)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index 3893a202e9ea..c30c759662e3 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -97,4 +97,5 @@ static struct kunit_suite rtc_lib_test_suite = {
 
 kunit_test_suite(rtc_lib_test_suite);
 
+MODULE_DESCRIPTION("KUnit test for RTC lib functions");
 MODULE_LICENSE("GPL");
diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index 59c0f38cc08d..53ec7173c28e 100644
--- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -203,4 +203,5 @@ static struct platform_driver goldfish_rtc = {
 
 module_platform_driver(goldfish_rtc);
 
+MODULE_DESCRIPTION("Android Goldfish Real Time Clock driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 28858fcaea8f..71eafe4fbc72 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -403,5 +403,6 @@ static struct platform_driver mpc5121_rtc_driver = {
 
 module_platform_driver(mpc5121_rtc_driver);
 
+MODULE_DESCRIPTION("Freescale MPC5121 built-in RTC driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("John Rigby <jcrigby@gmail.com>");
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index c6155c48a4ac..e6b2a9c15b54 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -1027,4 +1027,5 @@ static struct platform_driver omap_rtc_driver = {
 module_platform_driver(omap_rtc_driver);
 
 MODULE_AUTHOR("George G. Davis (and others)");
+MODULE_DESCRIPTION("TI OMAP1, AM33xx, DA8xx/OMAP-L13x, AM43xx and DRA7xx RTC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index 6f4bf919827a..115c46f862f9 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -308,4 +308,5 @@ static struct platform_driver rc5t583_rtc_driver = {
 module_platform_driver(rc5t583_rtc_driver);
 MODULE_ALIAS("platform:rtc-rc5t583");
 MODULE_AUTHOR("Venu Byravarasu <vbyravarasu@nvidia.com>");
+MODULE_DESCRIPTION("RICOH 5T583 RTC driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 411ff66c0468..2ea1bbfbbc2a 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -466,4 +466,5 @@ static struct platform_driver tps65910_rtc_driver = {
 module_platform_driver(tps65910_rtc_driver);
 MODULE_ALIAS("platform:tps65910-rtc");
 MODULE_AUTHOR("Venu Byravarasu <vbyravarasu@nvidia.com>");
+MODULE_DESCRIPTION("TI TPS65910 RTC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index 13f8ce08243c..2cfacdd37e09 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -685,4 +685,5 @@ static struct platform_driver twl4030rtc_driver = {
 module_platform_driver(twl4030rtc_driver);
 
 MODULE_AUTHOR("Texas Instruments, MontaVista Software");
+MODULE_DESCRIPTION("TI TWL4030/TWL5030/TWL6030/TPS659x0 RTC driver");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240608-md-drivers-rtc-f08826b21f0c


