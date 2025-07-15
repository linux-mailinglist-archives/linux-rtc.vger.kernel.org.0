Return-Path: <linux-rtc+bounces-4520-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B347B0610A
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 16:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0F05A21AD
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6B828C5AE;
	Tue, 15 Jul 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="O1i5CBSe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAC728C02E;
	Tue, 15 Jul 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588525; cv=none; b=cISIfLgWj8eTfFQLCy80g0yQUnoKmIQpIgstJV2dFWDqRjyncxW95dcSV5sqFBbPvvcRm/zg+O02n6GrTlLMgshyR7dG5A+B+drRO9I97avgum6+A5wbMlKLMHgsy3Yaq25rpTohQUWIbVvMz8EIZEncuaBEy40/Bk7v5TCrqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588525; c=relaxed/simple;
	bh=AyBMnRPXZKo0iVukBDmbimwbmKBQ5V2SO/MbMumXqLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y4lZko4UD/ewk1iA08BKOJP9wz9wiF+CxHtNXQH7CmBx3ANFnqFrYGDft2nGpASd1bdrgyM4c9W6A5GjQEacm89gJu+cETO9IR65QAFHpxCj0qAg3DHNW0aWVK2kBuOiUisqN9K8KQvArFhMIyAErg+qbLkLDtKh1HQYodQjZsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=O1i5CBSe; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FD0R8I025062;
	Tue, 15 Jul 2025 16:08:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	n5N0n1iUi16xCCfgujsNyLja1114BqY2n0xqBlEvMcY=; b=O1i5CBSeoDSVNUF8
	zz8pxa4JqZOIpDCuUHlnKXd0TUEFvGMWJ08ZNy8XEgWnWiLNYxZ6RKpG32qZGAOy
	nhhdG3hUwgztWeARreDi+wTVMsRlV8/Weh0d5dgTbZcWkFIs++ha/SY4c6xIhwfJ
	Vqr6lEWwFUW1RUhAE0Du2KHQeMViDJXKsGZbblXyRYz8/8fCgmrS+G6gcNE6tyJR
	V2kgk8V6I6DuKS0Mr6FYhuMiIbNtmOfI7o6bLP/AnRbw0snxZUqwGGP2f1DrsSqq
	dtz0ktwFpxov6IzGtDw4jC8VsZDu8TMtl8vqlG8heftf8Qkv/zUlysGy2OJSby+A
	woHJrg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ucu9dney-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:08:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 41D3640056;
	Tue, 15 Jul 2025 16:07:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8699CBA59CD;
	Tue, 15 Jul 2025 16:07:26 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:26 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:15 +0200
Subject: [PATCH 3/3] rtc: optee: add alarm related rtc ops to optee rtc
 driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250715-upstream-optee-rtc-v1-3-e0fdf8aae545@foss.st.com>
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.15-dev-7616d
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01

Add read_alarm and set_alarm ops from the rtc framework.
The support of an alarm is handled by a kernel thread waiting in OP-TEE
for an asynchronous notification that comes in the interrupt
handler of the alarm interruption on OP-TEE secure world.

Once the notification arrives, the kernel thread previously suspended
is rescheduled (this is handled by the OP-TEE kernel driver) and comes
back with the alarm information to the kernel.

A second session is therefore needed to enable/disable/cancel a waiting
alarm event as the kernel thread stopped in OP-TEE takes a form of mutex
on the session and so no one can use this session in parallel.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/rtc/rtc-optee.c | 434 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 413 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index b65953eb7ca1..27db403e3047 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -5,19 +5,104 @@
 
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/tee_drv.h>
 
-#define RTC_INFO_VERSION	0x1
+#define RTC_INFO_VERSION			0x1
 
-#define TA_CMD_RTC_GET_INFO		0x0
-#define TA_CMD_RTC_GET_TIME		0x1
-#define TA_CMD_RTC_SET_TIME		0x2
-#define TA_CMD_RTC_GET_OFFSET		0x3
-#define TA_CMD_RTC_SET_OFFSET		0x4
+#define TA_RTC_FEATURE_CORRECTION		BIT(0)
+#define TA_RTC_FEATURE_ALARM			BIT(1)
+#define TA_RTC_FEATURE_WAKEUP_ALARM		BIT(2)
 
-#define TA_RTC_FEATURE_CORRECTION	BIT(0)
+enum rtc_optee_pta_cmd {
+	/*  PTA_CMD_RTC_GET_INFO - Get RTC information
+	 *
+	 * [out]        memref[0]  RTC buffer memory reference containing a struct pta_rtc_info
+	 */
+	PTA_CMD_RTC_GET_INF = 0x0,
+
+	/*
+	 * PTA_CMD_RTC_GET_TIME - Get time from RTC
+	 *
+	 * [out]    memref[0]  RTC buffer memory reference containing a struct pta_rtc_time
+	 */
+	PTA_CMD_RTC_GET_TIME = 0x1,
+
+	/*
+	 * PTA_CMD_RTC_SET_TIME - Set time from RTC
+	 *
+	 * [in]     memref[0]  RTC buffer memory reference containing a struct pta_rtc_time to be
+	 *                     used as RTC time
+	 */
+	PTA_CMD_RTC_SET_TIME = 0x2,
+
+	/*
+	 * PTA_CMD_RTC_GET_OFFSET - Get RTC offset
+	 *
+	 * [out]    value[0].a  RTC offset (signed 32bit value)
+	 */
+	PTA_CMD_RTC_GET_OFFSET = 0x3,
+
+	/*
+	 * PTA_CMD_RTC_SET_OFFSET - Set RTC offset
+	 *
+	 * [in]     value[0].a  RTC offset to be set (signed 32bit value)
+	 */
+	PTA_CMD_RTC_SET_OFFSET = 0x4,
+
+	/*
+	 * PTA_CMD_RTC_READ_ALARM - Read RTC alarm
+	 *
+	 * [out]     memref[0]  RTC buffer memory reference containing a struct pta_rtc_alarm
+	 */
+	PTA_CMD_RTC_READ_ALARM = 0x5,
+
+	/*
+	 * PTA_CMD_RTC_SET_ALARM - Set RTC alarm
+	 *
+	 * [in]     memref[0]  RTC buffer memory reference containing a struct pta_rtc_alarm to be
+	 *                     used as RTC alarm
+	 */
+	PTA_CMD_RTC_SET_ALARM = 0x6,
+
+	/*
+	 * PTA_CMD_RTC_ENABLE_ALARM - Enable Alarm
+	 *
+	 * [in]     value[0].a  RTC IRQ flag (uint32_t), 0 to disable the alarm, 1 to enable
+	 */
+	PTA_CMD_RTC_ENABLE_ALARM = 0x7,
+
+	/*
+	 * PTA_CMD_RTC_WAIT_ALARM - Get alarm event
+	 *
+	 * [out]     value[0].a  RTC wait alarm return status (uint32_t):
+	 *                       - 0: No alarm event
+	 *                       - 1: Alarm event occurred
+	 *                       - 2: Alarm event canceled
+	 */
+	PTA_CMD_RTC_WAIT_ALARM = 0x8,
+
+	/*
+	 * PTA_CMD_RTC_CANCEL_WAIT - Cancel wait for alarm event
+	 */
+	PTA_CMD_RTC_CANCEL_WAIT = 0x9,
+
+	/*
+	 * PTA_CMD_RTC_SET_WAKE_ALARM_STATUS - Set RTC wake alarm status flag
+	 *
+	 * [in]     value[0].a RTC IRQ wake alarm flag (uint32_t), 0 to disable the wake up
+	 *                     capability, 1 to enable.
+	 */
+	PTA_CMD_RTC_SET_WAKE_ALARM_STATUS = 0xA,
+};
+
+enum rtc_wait_alarm_status {
+	WAIT_ALARM_RESET = 0x0,
+	WAIT_ALARM_ALARM_OCCURRED = 0x1,
+	WAIT_ALARM_CANCELED = 0x2,
+};
 
 struct optee_rtc_time {
 	u32 tm_sec;
@@ -29,6 +114,12 @@ struct optee_rtc_time {
 	u32 tm_wday;
 };
 
+struct optee_rtc_alarm {
+	u8 enabled;
+	u8 pending;
+	struct optee_rtc_time time;
+};
+
 struct optee_rtc_info {
 	u64 version;
 	u64 features;
@@ -41,15 +132,21 @@ struct optee_rtc_info {
  * @dev:		OP-TEE based RTC device.
  * @ctx:		OP-TEE context handler.
  * @session_id:		RTC TA session identifier.
+ * @session2_id:	RTC wait alarm session identifier.
  * @shm:		Memory pool shared with RTC device.
  * @features:		Bitfield of RTC features
+ * @alarm_task:		RTC wait alamr task.
+ * @rtc:		RTC device.
  */
 struct optee_rtc {
 	struct device *dev;
 	struct tee_context *ctx;
 	u32 session_id;
+	u32 session2_id;
 	struct tee_shm *shm;
 	u64 features;
+	struct task_struct *alarm_task;
+	struct rtc_device *rtc;
 };
 
 static int optee_rtc_readtime(struct device *dev, struct rtc_time *tm)
@@ -60,7 +157,7 @@ static int optee_rtc_readtime(struct device *dev, struct rtc_time *tm)
 	struct tee_param param[4] = {0};
 	int ret;
 
-	inv_arg.func = TA_CMD_RTC_GET_TIME;
+	inv_arg.func = PTA_CMD_RTC_GET_TIME;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
 
@@ -100,7 +197,7 @@ static int optee_rtc_settime(struct device *dev, struct rtc_time *tm)
 	struct optee_rtc_time *optee_tm;
 	int ret;
 
-	inv_arg.func = TA_CMD_RTC_SET_TIME;
+	inv_arg.func = PTA_CMD_RTC_SET_TIME;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
 
@@ -137,7 +234,7 @@ static int optee_rtc_readoffset(struct device *dev, long *offset)
 	if (!(priv->features & TA_RTC_FEATURE_CORRECTION))
 		return -EOPNOTSUPP;
 
-	inv_arg.func = TA_CMD_RTC_GET_OFFSET;
+	inv_arg.func = PTA_CMD_RTC_GET_OFFSET;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
 
@@ -162,7 +259,7 @@ static int optee_rtc_setoffset(struct device *dev, long offset)
 	if (!(priv->features & TA_RTC_FEATURE_CORRECTION))
 		return -EOPNOTSUPP;
 
-	inv_arg.func = TA_CMD_RTC_SET_OFFSET;
+	inv_arg.func = PTA_CMD_RTC_SET_OFFSET;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
 
@@ -176,13 +273,228 @@ static int optee_rtc_setoffset(struct device *dev, long offset)
 	return 0;
 }
 
+static int optee_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct optee_rtc_alarm *optee_alarm;
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_READ_ALARM;
+	inv_arg.session = priv->session_id;
+	inv_arg.num_params = 1;
+
+	/* Fill invoke cmd params */
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
+	param[0].u.memref.shm = priv->shm;
+	param[0].u.memref.size = sizeof(struct optee_rtc_alarm);
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	optee_alarm = tee_shm_get_va(priv->shm, 0);
+	if (IS_ERR(optee_alarm))
+		return PTR_ERR(alarm);
+
+	if (param[0].u.memref.size != sizeof(*optee_alarm))
+		return -EPROTO;
+
+	alarm->enabled = optee_alarm->enabled;
+	alarm->pending = optee_alarm->pending;
+	alarm->time.tm_sec = optee_alarm->time.tm_sec;
+	alarm->time.tm_min = optee_alarm->time.tm_min;
+	alarm->time.tm_hour = optee_alarm->time.tm_hour;
+	alarm->time.tm_mday = optee_alarm->time.tm_mday;
+	alarm->time.tm_mon = optee_alarm->time.tm_mon;
+	alarm->time.tm_year = optee_alarm->time.tm_year - 1900;
+	alarm->time.tm_wday = optee_alarm->time.tm_wday;
+	alarm->time.tm_yday = rtc_year_days(alarm->time.tm_mday,
+					    alarm->time.tm_mon,
+					    alarm->time.tm_year);
+
+	return 0;
+}
+
+static int optee_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct optee_rtc_alarm *optee_alarm;
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_SET_ALARM;
+	inv_arg.session = priv->session_id;
+	inv_arg.num_params = 1;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+	param[0].u.memref.shm = priv->shm;
+	param[0].u.memref.size = sizeof(struct optee_rtc_alarm);
+
+	optee_alarm = tee_shm_get_va(priv->shm, 0);
+	if (IS_ERR(optee_alarm))
+		return PTR_ERR(optee_alarm);
+
+	optee_alarm->enabled = alarm->enabled;
+	optee_alarm->pending = alarm->pending;
+	optee_alarm->time.tm_sec = alarm->time.tm_sec;
+	optee_alarm->time.tm_min = alarm->time.tm_min;
+	optee_alarm->time.tm_hour = alarm->time.tm_hour;
+	optee_alarm->time.tm_mday = alarm->time.tm_mday;
+	optee_alarm->time.tm_mon = alarm->time.tm_mon;
+	optee_alarm->time.tm_year = alarm->time.tm_year + 1900;
+	optee_alarm->time.tm_wday = alarm->time.tm_wday;
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	return 0;
+}
+
+static int optee_rtc_enable_alarm(struct device *dev, unsigned int enabled)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_ENABLE_ALARM;
+	inv_arg.session = priv->session_id;
+	inv_arg.num_params = 1;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = (bool)enabled;
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	return 0;
+}
+
 static const struct rtc_class_ops optee_rtc_ops = {
-	.read_time	= optee_rtc_readtime,
-	.set_time	= optee_rtc_settime,
-	.set_offset	= optee_rtc_setoffset,
-	.read_offset	= optee_rtc_readoffset,
+	.read_time		= optee_rtc_readtime,
+	.set_time		= optee_rtc_settime,
+	.set_offset		= optee_rtc_setoffset,
+	.read_offset		= optee_rtc_readoffset,
+	.read_alarm		= optee_rtc_read_alarm,
+	.set_alarm		= optee_rtc_set_alarm,
+	.alarm_irq_enable	= optee_rtc_enable_alarm,
 };
 
+static int optee_rtc_wait_alarm(struct device *dev, int *return_status)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_WAIT_ALARM;
+	inv_arg.session = priv->session2_id;
+	inv_arg.num_params = 1;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	*return_status = param[0].u.value.a;
+
+	return 0;
+}
+
+static int optee_rtc_cancel_wait_alarm(struct device *dev)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_CANCEL_WAIT;
+	inv_arg.session = priv->session_id;
+	inv_arg.num_params = 0;
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	return 0;
+}
+
+static int optee_rtc_set_alarm_wake_status(struct device *dev, bool status)
+{
+	struct optee_rtc *priv = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	int ret;
+
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		return -EOPNOTSUPP;
+
+	inv_arg.func = PTA_CMD_RTC_SET_WAKE_ALARM_STATUS;
+	inv_arg.session = priv->session_id;
+	inv_arg.num_params = 1;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = status;
+
+	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
+
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ? ret : -EPROTO;
+
+	return 0;
+}
+
+static int optee_rtc_handle_alarm_event(void *data)
+{
+	struct optee_rtc *priv = (struct optee_rtc *)data;
+	int wait_alarm_return_status = 0;
+	int ret;
+
+	while (!kthread_should_stop()) {
+		ret = optee_rtc_wait_alarm(priv->dev, &wait_alarm_return_status);
+		if (ret) {
+			dev_err(priv->dev, "Failed to wait for alarm: %d\n", ret);
+			return ret;
+		}
+		switch (wait_alarm_return_status) {
+		case WAIT_ALARM_ALARM_OCCURRED:
+			dev_dbg(priv->dev, "Alarm occurred\n");
+			rtc_update_irq(priv->rtc, 1, RTC_IRQF | RTC_AF);
+			break;
+		case WAIT_ALARM_CANCELED:
+			dev_dbg(priv->dev, "Alarm canceled\n");
+			break;
+		default:
+			dev_warn(priv->dev, "Unknown return status: %d\n",
+				 wait_alarm_return_status);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int optee_rtc_read_info(struct device *dev, struct rtc_device *rtc,
 			       u64 *features)
 {
@@ -193,7 +505,7 @@ static int optee_rtc_read_info(struct device *dev, struct rtc_device *rtc,
 	struct optee_rtc_time *tm;
 	int ret;
 
-	inv_arg.func = TA_CMD_RTC_GET_INFO;
+	inv_arg.func = PTA_CMD_RTC_GET_INF;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
 
@@ -238,6 +550,7 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 static int optee_rtc_probe(struct device *dev)
 {
 	struct tee_client_device *rtc_device = to_tee_client_device(dev);
+	struct tee_ioctl_open_session_arg sess2_arg = {0};
 	struct tee_ioctl_open_session_arg sess_arg = {0};
 	struct optee_rtc *priv;
 	struct rtc_device *rtc;
@@ -252,12 +565,14 @@ static int optee_rtc_probe(struct device *dev)
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	priv->rtc = rtc;
+
 	/* Open context with TEE driver */
 	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
 	if (IS_ERR(priv->ctx))
 		return -ENODEV;
 
-	/* Open session with rtc Trusted App */
+	/* Open first session with rtc Pseudo Trusted App */
 	export_uuid(sess_arg.uuid, &rtc_device->id.uuid);
 	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
 
@@ -269,6 +584,11 @@ static int optee_rtc_probe(struct device *dev)
 	}
 	priv->session_id = sess_arg.session;
 
+	/*
+	 * Shared memory is used for passing an instance of either struct optee_rtc_info,
+	 * struct optee_rtc_time or struct optee_rtc_alarm to OP-TEE service.
+	 * The former is by definition large enough to cover both parameter cases.
+	 */
 	shm = tee_shm_alloc_kernel_buf(priv->ctx, sizeof(struct optee_rtc_info));
 	if (IS_ERR(shm)) {
 		dev_err(priv->dev, "tee_shm_alloc_kernel_buf failed\n");
@@ -288,19 +608,69 @@ static int optee_rtc_probe(struct device *dev)
 		goto out_shm;
 	}
 
+	/* Handle feature's related setup before registering to rtc framework */
+	if (priv->features & TA_RTC_FEATURE_ALARM) {
+		priv->alarm_task = kthread_create(optee_rtc_handle_alarm_event,
+						  priv, "rtc_alarm_evt");
+		if (IS_ERR(priv->alarm_task)) {
+			dev_err(dev, "Failed to create alarm thread\n");
+			goto out_shm;
+		}
+
+		/*
+		 * In case of supported alarm feature on optee side, we create a kthread
+		 * that will, in a new optee session, call a PTA interface "rtc_wait_alarm".
+		 * This call return in case of alarm and in case of canceled alarm.
+		 * The new optee session is therefore only needed in this case as we cannot
+		 * use the same session for parallel calls to optee PTA.
+		 * Hence one session is reserved to wait for alarms and the other to make
+		 * standard calls to RTC PTA.
+		 */
+
+		/* Open second session with rtc Trusted App */
+		export_uuid(sess2_arg.uuid, &rtc_device->id.uuid);
+		sess2_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+		ret = tee_client_open_session(priv->ctx, &sess2_arg, NULL);
+		if (ret < 0 || sess2_arg.ret != 0) {
+			dev_err(dev, "tee_client_open_session failed, err: %x\n", sess2_arg.ret);
+			err = -EINVAL;
+			goto out_thrd;
+		}
+		priv->session2_id = sess2_arg.session;
+
+		if (priv->features & TA_RTC_FEATURE_WAKEUP_ALARM)
+			device_init_wakeup(dev, true);
+	}
+
 	err = devm_rtc_register_device(rtc);
 	if (err)
-		goto out_shm;
+		goto out_wk;
 
 	/*
-	 * We must clear this bit after registering because rtc_register_device
-	 * will set it if it sees that .set_offset is provided.
+	 * We must clear those bits after registering because registering a rtc_device
+	 * will set them if it sees that .set_offset and .set_alarm are provided.
 	 */
 	if (!(priv->features & TA_RTC_FEATURE_CORRECTION))
 		clear_bit(RTC_FEATURE_CORRECTION, rtc->features);
+	if (!(priv->features & TA_RTC_FEATURE_ALARM))
+		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+
+	/* Start the thread after the rtc is setup */
+	if (priv->alarm_task) {
+		wake_up_process(priv->alarm_task);
+		dev_dbg(dev, "Wait alarm thread successfully started\n");
+	}
 
 	return 0;
-
+out_wk:
+	if (priv->features & TA_RTC_FEATURE_ALARM) {
+		device_init_wakeup(dev, false);
+		tee_client_close_session(priv->ctx, priv->session2_id);
+	}
+out_thrd:
+	if (priv->features & TA_RTC_FEATURE_ALARM)
+		kthread_stop(priv->alarm_task);
 out_shm:
 	tee_shm_free(priv->shm);
 out_sess:
@@ -315,6 +685,13 @@ static int optee_rtc_remove(struct device *dev)
 {
 	struct optee_rtc *priv = dev_get_drvdata(dev);
 
+	if (priv->features & TA_RTC_FEATURE_ALARM) {
+		optee_rtc_cancel_wait_alarm(dev);
+		kthread_stop(priv->alarm_task);
+		device_init_wakeup(dev, false);
+		tee_client_close_session(priv->ctx, priv->session2_id);
+	}
+
 	tee_shm_free(priv->shm);
 	tee_client_close_session(priv->ctx, priv->session_id);
 	tee_client_close_context(priv->ctx);
@@ -322,6 +699,20 @@ static int optee_rtc_remove(struct device *dev)
 	return 0;
 }
 
+static int optee_rtc_suspend(struct device *dev)
+{
+	int res = optee_rtc_set_alarm_wake_status(dev, device_may_wakeup(dev));
+
+	if (res) {
+		dev_err(dev, "Unable to transmit wakeup information to optee rtc\n");
+		return res;
+	}
+
+	return 0;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(optee_rtc_pm_ops, optee_rtc_suspend, NULL);
+
 static const struct tee_client_device_id optee_rtc_id_table[] = {
 	{UUID_INIT(0xf389f8c8, 0x845f, 0x496c,
 		   0x8b, 0xbe, 0xd6, 0x4b, 0xd2, 0x4c, 0x92, 0xfd)},
@@ -337,6 +728,7 @@ static struct tee_client_driver optee_rtc_driver = {
 		.bus		= &tee_bus_type,
 		.probe		= optee_rtc_probe,
 		.remove		= optee_rtc_remove,
+		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
 	},
 };
 

-- 
2.43.0


