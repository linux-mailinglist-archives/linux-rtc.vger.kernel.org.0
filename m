Return-Path: <linux-rtc+bounces-4074-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E30AB0DC2
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 10:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68180B22F86
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80A727700C;
	Fri,  9 May 2025 08:45:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853F27466E;
	Fri,  9 May 2025 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780301; cv=none; b=ef0SuAl7h4axFAE0UxcC0D4ZNUFgFu5n+oA30eiVr7MM1L9FiQ3x4Zh9Qy1ogeQYYE0xiQonlYvpj0CqDTD8GB4BD1MkbLDH1fCujzp18dvy9MhlUcKOK8ukBm3U6ch2Un5EFrHl0fi6GRjtd0UVnWB+7LexOFS4kai3f0bTyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780301; c=relaxed/simple;
	bh=83LchbGfj7pUh3V7yoqpETsha1f/icNh4UGsTHqOpqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3o6W3bCvf6APAsXIAg71QbcwBqC+rwlXgemHf9TsT4sr7q0WyccDB6wF4Z0+85hjNetJJ5yHgXAbWQRttLvBF7hLK2ROkp0qmwWW1quoe72i6fTG1ubX96DTHc8vCqdveO5hgYvd0YcMBXso3NIss7IOKQVPsXEeOzbSv1Sq+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=none smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpgz13t1746780262tfbaf49cd
X-QQ-Originating-IP: vyKoXwAJ6eYJ3x/CAIlepOPBrViOluMUliIZrXCoGz0=
Received: from localhost.localdomain ( [118.249.225.48])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 16:44:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12412747546962337345
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
Subject: [PATCH V2] rtc: loongson: Add missing alarm notifications for ACPI RTC events
Date: Fri,  9 May 2025 16:44:16 +0800
Message-Id: <20250509084416.7979-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: MShfLn39PbN248Ei8zfQ4ZDd91Rwua7y2etKEfO/Qd7sW9SR/OTBOVEW
	uVlmpStSwXNLy/EgBBGqtXejGiwSNXf6xjguKf0cmIiYcyNHR9LB8hWDmjkE5zjOf8UAIi9
	W+iRPsli3glBidME9lKOwu8pvzEInyZNHLdN+PDx5jQFAcFoYOlEIJQ2e2M31FlU3ZGOCT0
	c08ZlCTpXeF5X4MROCHRGIwcC5LH/ZUbRakhP5LZk6E/oC+Z15X1IANyHh9LloUIjWLdNxn
	SYjEzwQcj+ybcGW5M54ByW2C4IFLrV7WkzT6uy1Tp3313RWDteOa/W67pKDYHWdgtL5hTQw
	crfnblWTqmnapyX8SzGpy4etLh7PcVYNI2MT/kWGyEtPyEPJgR0+GTAWqFqaPYEqlxtrEis
	/SdT33fxZR0XaLWU11SxeptqBczqa2QKgUFC8qGixNiK/WaWSQqfQujZhU1oYtk5DYMoRPq
	wigIg4xH4e4IoHuF2G6e6mb6rx1ont7ZKUxf73y1CIuRHpWmYSRkQGQAltTatcUhQ6Ji/N+
	D9R5PG6AoCb6rENAiGdSEfd0kgel0whJL2it9E85F680cnQncltaNbbXDhzsk7XWBrKAbOO
	8wXSiwDZmggdk3bN2ON0tcXA4nqrzsKTkMllyY2wkvfeEQxa7VMhdFABYlV09RZs6ZocU4X
	KIW7kVrkLEHXg5eFFWR378qrAmx7U7xDgQ5jtMyI7nDLq+1x2W8ZeLwQag2jQCyE4gr5rMX
	6T/SlOb7kZPbKpzBt2HdDEB6Qx/rQApkWzdGq/2uVwN7WHbnyn0l9vALdjDJq701mmwM+K2
	P9xe6fMZHeMYOOsQ5AI20k6hGYhun4Bsyh5tWQah+l2tA0K5K8jIg4jjlPGKL6jDtgjITdw
	2HkNymEtbjEE0bpr8FtE4hYtBlBTj5MR+cO3IbfN78IUsMdGs4X/xCFuxJlzYuW0pIwIlyP
	p3YMQCrhpkoxLGpk1mPAz89uHbK1Fq2ZyQEn7V/JrijRkBmYDzaNg7D2tIOXD4Tqaj8is2y
	PkHCTGLg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

When an application sets and enables an alarm on Loongson RTC devices,
the alarm notification fails to propagate to userspace because the
ACPI event handler omits calling rtc_update_irq().

As a result, processes waiting via select() or poll() on RTC device
files fail to receive alarm notifications.

The ACPI interrupt is also triggered multiple times. In loongson_rtc_handler,
we need to clear TOY_MATCH0_REG to resolve this issue.

Fixes: 09471d8f5b39 ("rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()")
Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-loongson.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 97e5625c064c..2ca7ffd5d7a9 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -129,6 +129,14 @@ static u32 loongson_rtc_handler(void *id)
 {
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+
 	spin_lock(&priv->lock);
 	/* Disable RTC alarm wakeup and interrupt */
 	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
-- 
2.33.0


