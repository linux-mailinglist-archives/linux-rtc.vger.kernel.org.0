Return-Path: <linux-rtc+bounces-6640-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1iieI8QeKmoFjAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6640-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 04:34:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E927C66DD65
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 04:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=S1JuR9bO;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6640-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6640-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BAFE3026164
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 02:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1659F26F293;
	Thu, 11 Jun 2026 02:34:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6E81F1513;
	Thu, 11 Jun 2026 02:33:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781145240; cv=none; b=osZRRvsKoVQXrPskCeAnu1OJOpQe1W8shKCnRKAbWj6W1r3Cl7PYTVYjaCPuvJnWKuQcHKJlszPBcMVUAjO5fj1RarCtwXgn77d/i3lbwptdnpaaV7J/1Eggl9gx0UDG6Gw+t2zLCCSE1IAEhO7e/1trRr09IDY0hnls3yWUis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781145240; c=relaxed/simple;
	bh=HCKsj/0Eqvf7BBel4od38eR5CgjD4TPsXr0qPW9XY2c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RCfVh0xjz9tpOr+JhZ+GtArsCfqc8d77CDx8bkhlhrl04uFtszsDc/go1Nuv4bl2+baVe/f8O7GsR6041V56GuPA1rHtIl8u0HI3mcn+wpmWhkth++yNcpooNsiqcl0TLg+mVKGxtlIrJ0CSIkEEE9cDnbsixeuuqFz81x2MClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=S1JuR9bO; arc=none smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B1hKYp2428073;
	Thu, 11 Jun 2026 02:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3Qf+323Ii
	pbAKKO8YFiCQo9USBM6NBOOnsLQXwzwcLw=; b=S1JuR9bOcLSmU7PDVVh8fhO8B
	3HsA1mAR4TToTjwS0R6tx3WHfTOHk/zvVDK99MhQgQQLWPFZKjPvtR1ie6u9JI96
	xfQBqUkZp4BWaITa3swQMro0PXYYfpwRk9ZXWot3pEe4L+oSPXWZmJZkppZRdbj1
	t795AFE8Dpu3xnqdTmT6QjQER6eN959nz7sulHzIKIuSUNfRvJQ0BwEt1EzE4irz
	X0x6KsNIzR3RONYWIM3zCJIV67/ihAPn5uvh+WqIYYKA+FydKegzIN2ZR+o2qgeA
	JvqfpGa/2DaH8Td4UIi6bis+vfy5nhxi5q5jqe1yBdvk3lRAIFtNNEg16hToQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7frd73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Jun 2026 02:33:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 10 Jun 2026 19:33:52 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 10 Jun 2026 19:33:51 -0700
From: Xue Lei <Xue.Lei@windriver.com>
To: <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <xue.lei@windriver.com>
Subject: [PATCH] rtc: mv: add suspend/resume support for wakeup
Date: Thu, 11 Jun 2026 10:33:50 +0800
Message-ID: <20260611023350.1370881-1-Xue.Lei@windriver.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PKk/P/qC c=1 sm=1 tr=0 ts=6a2a1e91 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=M1d-zidf5v9J7YHPdqcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Tws-VbeLqYsiX14UyC5GDCyq8pTM6N8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAyMiBTYWx0ZWRfX9GDG/lpa6+6r
 qBI5uvXxXHm/H4jWW6HWQe2oRfxVoTxw0YqJcPGppmptOlQPL+l3gK44Gp+I/R8TuWVCc6F3oP4
 xiJG/KKF1X/3AfH9SH0HP9K1L0r2DSYh+vOlqapSQsMQxF23mtJwZKQyYvbcBo1q9xrCD/wjV8A
 CKsfwJcaw/GOFL+p3gex2wGDfx3kP7mXiqpu6G/inzjBQWM2SwmzCXbNREgLpRRBovJPfVtvaRs
 F2x3KadH/L2QfV9hxL9RqC7PQl17d5rX/ceVND6L8dDC4UwHCAcjLjaRIllmc6okN/X0ZM+dSgr
 X+pN+qKJFn+sFU+rytVA38Bnn+nHizIuFC/Vga+mukOaE1bEp2uifbwgEsMbfLQlNsOkkBWot8x
 C1FeqHTbBZfjhkm12RW2zikh62VGspYBjwQNAdkr3FOCkMOlCsNteCDahp2fkkaqN2+sGmX3Jsj
 gIub2YSXvJwklgrIDYg==
X-Proofpoint-ORIG-GUID: Tws-VbeLqYsiX14UyC5GDCyq8pTM6N8W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAyMiBTYWx0ZWRfX85CqUJhBtbhj
 z35WBOUY3BjaAusQiHejsmFhXwWrQhAiqsewqlEokS182iTNu1sDoBRvme42kRpcSmn0RGRxpd8
 Heh77CzbuOoQnqM+bCdKi83T/SeyW5BfBUaDK/JeOPO2eKj48/kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110022
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6640-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Xue.Lei@windriver.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xue.lei@windriver.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Xue.Lei@windriver.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E927C66DD65

Add PM suspend/resume callbacks to enable/disable IRQ wake for the
RTC alarm interrupt. This allows the RTC alarm to wake the system
from STR (e.g. via rtcwake -m mem -s N).

Without this, the RTC IRQ is masked during suspend by the MPIC's
IRQCHIP_MASK_ON_SUSPEND behavior, preventing alarm-based wakeup.

Signed-off-by: Xue Lei <Xue.Lei@windriver.com>
---
 drivers/rtc/rtc-mv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index db31da56bfa7..55fa937f9f70 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -301,6 +301,28 @@ static const struct of_device_id rtc_mv_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, rtc_mv_of_match_table);
 #endif
 
+#ifdef CONFIG_PM_SLEEP
+static int mv_rtc_suspend(struct device *dev)
+{
+	struct rtc_plat_data *pdata = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev) && pdata->irq >= 0)
+		enable_irq_wake(pdata->irq);
+	return 0;
+}
+
+static int mv_rtc_resume(struct device *dev)
+{
+	struct rtc_plat_data *pdata = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev) && pdata->irq >= 0)
+		disable_irq_wake(pdata->irq);
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(mv_rtc_pm_ops, mv_rtc_suspend, mv_rtc_resume);
+
 /*
  * mv_rtc_remove() lives in .exit.text. For drivers registered via
  * module_platform_driver_probe() this is ok because they cannot get unbound at
@@ -312,6 +334,7 @@ static struct platform_driver mv_rtc_driver __refdata = {
 	.driver		= {
 		.name	= "rtc-mv",
 		.of_match_table = of_match_ptr(rtc_mv_of_match_table),
+		.pm	= &mv_rtc_pm_ops,
 	},
 };
 
-- 
2.49.1


