Return-Path: <linux-rtc+bounces-4018-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B9AA0353
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Apr 2025 08:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBB4188A360
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Apr 2025 06:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782925DB0C;
	Tue, 29 Apr 2025 06:28:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BA13EFF3;
	Tue, 29 Apr 2025 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908122; cv=none; b=sDQeitqLOIc5jY6UUG0cV/3uUWpcqMNQ3LDaA2+UIt1kIaRgb17Un2BIBYv2UWeuqIPbRU15p4u+reBvmgNXISxsYbadvvkrYup3GRqj5UXiIOY1LAAT6FO+fnIyeiXFrySi2OEc+vSvG2beDlW7NKsZOrMgSZTDND27net4v1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908122; c=relaxed/simple;
	bh=/QcFu8jTMwn4D7EBmAXB8sLko0XzPZNY3u8sLFMOwlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JAPcYsZ7tUGDRseAgdiXffQabnjE9V14YThNYXI//CWkc2BF08ERfMt23+ZX/5ZMaAZ1PMGHXmtfe6PXUNvuTUnIrjL+4X7jnapicAU7Ufb9/PL4VA4L7R8uVqDCknKbNK9h0z1ogAC+/WKnEwTVnuk4JLYnCdIIZYTlmlDngTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=none smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz21t1745908066t901c747c
X-QQ-Originating-IP: dgSgOml0culBUhVYhft74ziURc0ZlMbrqZwb6gz4LzM=
Received: from localhost.localdomain ( [175.9.43.233])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 29 Apr 2025 14:27:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 68823556814354705
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: alexandre.belloni@bootlin.com,
	zhoubinbin@loongson.cn,
	wangming01@loongson.cn
Cc: chenhuacai@kernel.org,
	gaojuxin@loongson.cn,
	git@xen0n.name,
	jiaxun.yang@flygoat.com,
	keguang.zhang@gmail.com,
	lixuefeng@loongson.cn,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: loongson: Add missing alarm notifications for ACPI RTC events
Date: Tue, 29 Apr 2025 14:27:36 +0800
Message-Id: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: MxdW4jxL6NvXJgL4/p0KUIFjbW4kIr06zDyIqc46IjHyE52MA5l9Pwfk
	Bm+E1rvbQILY4hILsSJFtSVnk7HQu1BXUX7cGMZ54WUHk8+8c2BWFAhG7PoNJ+pSCz4mln9
	WhtOZKxrWyaq/DYgokIrHyJZu+D1z4HJqkjSpnuP/6cKgKeg/ZTBkatZJZMyCZ39dBJrSSh
	ikoo6zTaqmNiKF3leprbf0pIHslDedIyZvZJnv63H1uIgAMNdRXE3KdU6YUNHwPNGQHOIuW
	6TJEEOBRvFOH7sMNRxRhhLIScXXsdQsG2LGpng884+964SfbACMDnuJL/GjxSJ3hm6TA9xf
	54xtSCudpBlfDgXPTPvC0tdT6gmvbJh9uVdgZ6HB25akgwilOJI3eSPl1dN9v7avYC4ecIq
	ott/CH4eB/+C/+aSTWu7stAWxfjo4fq4LXG5ZO2SCwzJWQqFOpaxSbD4sRGZZ2SmxGvs1Yz
	qJXgroXnHBV1MxN7wMbK4UG9sKwpNm7zlIcLnWi5Xq317jKhiOhgXXbUXF56Zx9s+jP21Tf
	P8Hu2l9sG1i+Lwu6qBK7Avqe0YuALK7jD4UPxIGN7krnxlf1tacKg7Fz+mkCFY3+ikisvpF
	mclCyJ6UhKQ5OSg+kO12D1qIeLRdKpHOTnkZjoM4CVsvHvA79j60bbRWGol0Tgd4PLF30vn
	FOkEWYce6U62mBGGRDx6LXbnmDROuSLNNOD1j/iPekh443APvySwXpxJp69fK8y2fZNiIKO
	RBJNF8GbdRdoyEIRgPxIWgo+a3km9LSoItbjIFHLe6gKHQeKhLrnp7cdbhS7gSmN0ZLaCDl
	tY9qvfik3Uos3qp8eeR2sNK1b4eVirILt33gDwNpONPlqNyrhKf9S3yLmiCUlfLTsAOZ7gN
	GVF+5nlBR9IopMaZ3rTWEdR46TScQQinJv+bNCQe/SQaCIP8T4J/ylIGxyfrgV7Xyww/Ons
	tvUvBTy6v48dpwLqmE9eP+ngyq8zu7PsPwhA=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

When an application sets and enables an alarm on Loongson RTC devices,
the alarm notification fails to propagate to userspace because the
ACPI event handler omits calling rtc_update_irq().

As a result, processes waiting via select() or poll() on RTC device
files fail to receive alarm notifications.

Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-loongson.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 97e5625c064c..0c573f198f63 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -129,6 +129,8 @@ static u32 loongson_rtc_handler(void *id)
 {
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
 	spin_lock(&priv->lock);
 	/* Disable RTC alarm wakeup and interrupt */
 	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
-- 
2.33.0


