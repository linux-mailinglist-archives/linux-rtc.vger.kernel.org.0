Return-Path: <linux-rtc+bounces-302-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7287EAF75
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 12:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAF21B209AA
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 11:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088BE3B2B0;
	Tue, 14 Nov 2023 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78B14A9E
	for <linux-rtc@vger.kernel.org>; Tue, 14 Nov 2023 11:46:20 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31499AB;
	Tue, 14 Nov 2023 03:46:18 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AEA0ZUG023350;
	Tue, 14 Nov 2023 06:46:07 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3uaqbpsc0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 06:46:06 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 3AEBk5Ql054381
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Nov 2023 06:46:05 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 14 Nov 2023 06:46:04 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 14 Nov 2023 06:46:04 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 14 Nov 2023 06:46:04 -0500
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.153])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3AEBjssv004685;
	Tue, 14 Nov 2023 06:45:56 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH] rtc: Kconfig: add missing dependency for lpc24xx
Date: Tue, 14 Nov 2023 13:45:31 +0200
Message-ID: <20231114114532.37840-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: lPret9m-vWU4oJFZdpoW22AQ4ZJ7pAYu
X-Proofpoint-GUID: lPret9m-vWU4oJFZdpoW22AQ4ZJ7pAYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_10,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=796
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311140090

The driver depends on COMMON_CLK. Add the dependency in Kconfig.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3814e0845e77..c172391bb765 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1705,6 +1705,7 @@ config RTC_DRV_LPC24XX
 	tristate "NXP RTC for LPC178x/18xx/408x/43xx"
 	depends on ARCH_LPC18XX || COMPILE_TEST
 	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
 	help
 	  This enables support for the NXP RTC found which can be found on
 	  NXP LPC178x/18xx/408x/43xx devices.
-- 
2.42.0


