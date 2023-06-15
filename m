Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28037313FC
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jun 2023 11:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245574AbjFOJd5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Jun 2023 05:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245582AbjFOJdv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Jun 2023 05:33:51 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C20E2705;
        Thu, 15 Jun 2023 02:33:36 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F8Yr9O021704;
        Thu, 15 Jun 2023 11:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=4u7WnsfFSTX7SSmQl5Vo2PZjRXDH79xbQ6aVufDM0rY=;
 b=E5E8gkoYbihkBR1/QigXPsxLbKeuXTvqdQnCvhOLyIJQRVV7vpWTdP6OjWJEd+bYc+KZ
 aypLPTWyYh7ZhykvL9v1VPoemmRfkz7pNwDc0XZUQasSklgd7QArnHoEXDPLLOQ7KPL1
 BedtARqF303jjZh+X9jodCA3PAMjC6V88zHMazpkRUZ2GQIWwqq0XIgrQuryLaSIAHTE
 211L0s7KXBX6HbbtrTBrr8SGc74L4YrMgD2ly7F7HCZhKLANTPGBLUehrvqYedz1vMsP
 pbNUZowvvaupNkZ72tTsFDB5eC34HXfidNkHwoT6CWVF0o4/c2W1RhUDi9WBgINYphU4 bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7y8sgedt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 11:33:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45B82100046;
        Thu, 15 Jun 2023 11:33:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EA0E21A91B;
        Thu, 15 Jun 2023 11:33:27 +0200 (CEST)
Received: from localhost (10.252.8.64) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 11:33:26 +0200
From:   Valentin Caron <valentin.caron@foss.st.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Guibout <christophe.guibout@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        <linux-rtc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH 6/7] rtc: stm32: fix unnecessary parentheses
Date:   Thu, 15 Jun 2023 11:27:52 +0200
Message-ID: <20230615092753.323844-7-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615092753.323844-1-valentin.caron@foss.st.com>
References: <20230615092753.323844-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.8.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix a few style issues reported by checkpatch.pl:
- Unnecessary parentheses
- Lines should not end with a '('

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 17e549806784..30c5004d6902 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -160,10 +160,9 @@ static int stm32_rtc_enter_init_mode(struct stm32_rtc *rtc)
 		 * slowest rtc_ck frequency may be 32kHz and highest should be
 		 * 1MHz, we poll every 10 us with a timeout of 100ms.
 		 */
-		return readl_relaxed_poll_timeout_atomic(
-					rtc->base + regs->isr,
-					isr, (isr & STM32_RTC_ISR_INITF),
-					10, 100000);
+		return readl_relaxed_poll_timeout_atomic(rtc->base + regs->isr, isr,
+							 (isr & STM32_RTC_ISR_INITF),
+							 10, 100000);
 	}
 
 	return 0;
@@ -448,16 +447,16 @@ static int stm32_rtc_valid_alrm(struct stm32_rtc *rtc, struct rtc_time *tm)
 	 *	M-D-Y H:M:S < alarm <= (M+1)-D-Y H:M:S
 	 * with a specific case for December...
 	 */
-	if ((((tm->tm_year > cur_year) &&
-	      (tm->tm_mon == 0x1) && (cur_mon == 0x12)) ||
-	     ((tm->tm_year == cur_year) &&
-	      (tm->tm_mon <= cur_mon + 1))) &&
-	    ((tm->tm_mday > cur_day) ||
-	     ((tm->tm_mday == cur_day) &&
-	     ((tm->tm_hour > cur_hour) ||
-	      ((tm->tm_hour == cur_hour) && (tm->tm_min > cur_min)) ||
-	      ((tm->tm_hour == cur_hour) && (tm->tm_min == cur_min) &&
-	       (tm->tm_sec >= cur_sec))))))
+	if (((tm->tm_year > cur_year &&
+	      tm->tm_mon == 0x1 && cur_mon == 0x12) ||
+	     (tm->tm_year == cur_year &&
+	      tm->tm_mon <= cur_mon + 1)) &&
+	    (tm->tm_mday > cur_day ||
+	     (tm->tm_mday == cur_day &&
+	     (tm->tm_hour > cur_hour ||
+	      (tm->tm_hour == cur_hour && tm->tm_min > cur_min) ||
+	      (tm->tm_hour == cur_hour && tm->tm_min == cur_min &&
+	       tm->tm_sec >= cur_sec)))))
 		return 0;
 
 	return -EINVAL;
@@ -666,7 +665,7 @@ static int stm32_rtc_init(struct platform_device *pdev,
 	 * Can't find a 1Hz, so give priority to RTC power consumption
 	 * by choosing the higher possible value for prediv_a
 	 */
-	if ((pred_s > pred_s_max) || (pred_a > pred_a_max)) {
+	if (pred_s > pred_s_max || pred_a > pred_a_max) {
 		pred_a = pred_a_max;
 		pred_s = (rate / (pred_a + 1)) - 1;
 
-- 
2.25.1

