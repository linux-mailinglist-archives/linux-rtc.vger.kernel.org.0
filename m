Return-Path: <linux-rtc+bounces-4522-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B85B060F6
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 16:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AC09210B7
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 14:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8E528DB5D;
	Tue, 15 Jul 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="uGS0bm18"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358528C5B1;
	Tue, 15 Jul 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588526; cv=none; b=qG2B/tmWrS2i2JbALS5/+4TGNP6sKqo/p0dyOxwXZ2kU7988944KUrUGF7VpKjm9pmecK/DexXewbyDeZL0S6IlDLAp5DyydmeZ4Q2TK9YblmldGMkqPpDbbC1keckwOpfCB3BPv3kMcwihVeq5aRvunX2X85kkdGF/cTa6Oyto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588526; c=relaxed/simple;
	bh=tB8e29HievMYjKK/es76G537t2NjUZppPb+VRwm4WE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pS3Jd/cCt5NY+G+SUsprgpnsLeKs3anadjhCpuSFTk2GxDZz8dnvtiDpJaDzYoYtosVR9Xg+mlXjzAmYvXmMQ0nea+uq2KgIllmZizj6j9DBCZkmQOMFmA2vIu+OwqD2XKoRZkY0ZJ5ymQNcrEJMirhIAnaKsUAEmgcRBWYoXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=uGS0bm18; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDoK8E030276;
	Tue, 15 Jul 2025 16:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	uXGw9WUeFha5lfSOB+Dp3arpnW5I3Ss/rTV2qKNDad4=; b=uGS0bm18zxhCbfyn
	jIT+2Xi5vbZxfdeskXesd3o4AuPJBoOXN2E2Skz36fv4UB8dFl6NotMRww5Hx4V3
	v0AcQIy+pCw0zmXfaOiVqtuV+4dWsHSF64XzqrUJ6qEwBayfrR7rhEdwqKOHRBs5
	qMYbHPom/9E5jiw4sW1SGJFQWSm9oRbMRgkKsNVkJ5J0DzDprnkcquicZTSIw/zP
	eLpYtgYtBzz+Uj23nsZ9sbq9MEf6hbWpJMLffqSI1YKe6j1/aMNrD7pSdsSmX9We
	9UcOnMn+xREuCBCwJB7NlLAfscro3CW7n6+fKYHvK9yPNW+SjwMpM+wKZKvdt9Ex
	PlomMg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uekgwahs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:08:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B28B240055;
	Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 111D9BA56B7;
	Tue, 15 Jul 2025 16:07:25 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:13 +0200
Subject: [PATCH 1/3] rtc: rtc-optee: fix memory leak on driver removal
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250715-upstream-optee-rtc-v1-1-e0fdf8aae545@foss.st.com>
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

Fix a memory leak in case of driver removal.
Free the shared memory used for arguments exchanges between kernel and
OP-TEE RTC PTA.

Fixes: 81c2f059ab90 ("rtc: optee: add RTC driver for OP-TEE RTC PTA")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/rtc/rtc-optee.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 9f8b5d4a8f6b..6b77c122fdc1 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -320,6 +320,7 @@ static int optee_rtc_remove(struct device *dev)
 {
 	struct optee_rtc *priv = dev_get_drvdata(dev);
 
+	tee_shm_free(priv->shm);
 	tee_client_close_session(priv->ctx, priv->session_id);
 	tee_client_close_context(priv->ctx);
 

-- 
2.43.0


