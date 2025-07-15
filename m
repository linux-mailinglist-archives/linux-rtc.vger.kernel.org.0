Return-Path: <linux-rtc+bounces-4519-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC27B06104
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 16:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCE31892E28
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A8F28C2BB;
	Tue, 15 Jul 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HJLuOnXm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC128C01F;
	Tue, 15 Jul 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588524; cv=none; b=aOowwEyzfpKVeUZTCoBhkGo3GaG8qAgOdSxPNWsDV+T3k4Z4kTTspsDKy1s5kbNiGJ9lyvAKDzJs0024aIaigaPJLokOP51qUb1pfBFIQ0ONq9LrlEj8hjBpb0FEHdkHXaQimq6Z6i5eVrNdjUkKfE9EWpprWGctPt834pnDKIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588524; c=relaxed/simple;
	bh=eYt8nfiDWhDjOUqWMBw8bYNSNUGL9pcxy4yz5lH1BhQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oUbVp8P7CgYn0xRd/cM/pUYPWSR4Lhp8LudZmH9V6RWxzKVPqlLqOJ4493QdW3dO8sO3/pjmq7zUNUBhzM/0FBHmjvea46LIDLwGbeD/qIT9YT7zbpVL+3NBf4tKdAXDkUhmHXiVrCnvxhUPcYnxkOXdgYC9IHVnaT22QIdWdd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HJLuOnXm; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE6WrE015016;
	Tue, 15 Jul 2025 16:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=470mP4bxBH7G0P09+MOOw3
	OPj3nyNTjTISkkwVkIIc4=; b=HJLuOnXmaQvZrUzwkQcXXgslkkD+u1VMvT7vBn
	F33ISkO/VfJBpPf+Kt23F27yyEt8g+lNXlu40ruiLIFiQJESuoGmrKI72Ws5dxcK
	/zFtUG+KKd7pUQ7kJZJIB9KgiQ1gDTAI4kv1tpZq7PK2m2SvNvP261SZvwSnzXPy
	bGQOiGcdWn7/X4pzuRi9qB6xJww1WZyEl7tk2GUw2QJ5RSo3Bha+OgHVVLwVcCa/
	Dz3K9odL4IjmERl503i584/tmbL4CbqKX4kqLTWKxqtBW0eklNoOFM3mdb3LAfeQ
	W3PxLF/FrsJddENCGRSJ14/g1UKEJ5NZtXVkqfCc+WQ5mnTg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nntncq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:08:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 90B6240054;
	Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57141B885C8;
	Tue, 15 Jul 2025 16:07:24 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/3] Add alarm operation to the rtc-optee driver
Date: Tue, 15 Jul 2025 16:07:12 +0200
Message-ID: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJBgdmgC/x3MMQ6AIAxA0auQzjZBlEGvYhwQi3ZQSUFjYry7x
 PEN/z+QSJgS9OoBoYsTH3tBXSnwq9sXQp6LwWhjtTEtnjFlIbfhETMRSvaofdBTF1rb2BpKGIU
 C3/90GN/3A9lKAH5kAAAA
X-Change-ID: 20250224-upstream-optee-rtc-0cf0b9f45351
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

The optee-rtc driver is used to query the rtc handled by OP-TEE OS
through PTA (Pseudo Trusted Application) call.
This serie fixes memory concerns and add alarm operations for the
rtc-optee driver as the RTC PTA now support them [1].

For the alarm notification, the OP-TEE OS secure world will be
able to inform the kernel when a secured alarm will occured
through a notification sent to a kernel thread waiting in OP-TEE OS.

[1]: https://github.com/OP-TEE/optee_os/pull/7440

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (3):
      rtc: rtc-optee: fix memory leak on driver removal
      rtc: optee: remove unnecessary memory operations
      rtc: optee: add alarm related rtc ops to optee rtc driver

 drivers/rtc/rtc-optee.c | 464 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 426 insertions(+), 38 deletions(-)
---
base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
change-id: 20250224-upstream-optee-rtc-0cf0b9f45351

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


