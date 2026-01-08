Return-Path: <linux-rtc+bounces-5678-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CFD01054
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 05:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFC4C303C81C
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 04:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3763E2C15AA;
	Thu,  8 Jan 2026 04:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NOrHBo03"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD92D0C92;
	Thu,  8 Jan 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767848077; cv=none; b=RrRU41kzZRiCjDgyQQlD/X9Vgbv/ubrnRSiYXmpOcdUuXZ7xR1UQeUmEvcwnrrF4FTEzmfDo0C+hdWRZJK5+hKDmxSk1wFVqmEQdcmFE9xjc28rAGdlzRwDrJjzUoHzxh8/4AvByWxCjFp2D/phTP8FueVBe6ih3va/7OILfimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767848077; c=relaxed/simple;
	bh=+pCPQlFfOws6uO02Y0jpO+Waj/kEo5NNF/ZBUOzuS/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ctxsJXzoK0X95WEs2gFU14olO0d401wh52nylcYohRN0xaYxKf03oGEAZS8wzvUxTQwR65+5WREpolpKEcZcO8H48qwYbK28eOD56kXVUMYnMNhH2g2t7CXHSWYM2pQKnsEi3XTDg29KMNxANJvhVtzjwBYGEovkBuLRv3ImyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NOrHBo03; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=X/n1ZntMzq9AuXSix6vB3mMWKZ++xOALnOCLXmXVsSk=; b=NOrHBo03ZxK4IP90/11Zr/Jfmn
	kuZJwdW0ScnbUpgQ2PPqcsibn9zJrifhI8wI3qQ8jwno+WN9i5M+ezwIttaE/hJhUcwW8F20c11Gj
	CqFr8+rwxx7qHsaRVk6N7UEIoyc+bSwNgOp4QPxadUWkHoGkAyiaH0gtAk/s8oEvwfzTCMJ0G5spI
	qRz2zTDXH8HrrAw2zBCm67CBMLlp1y70dc/CGdgJvYlA/VjmeL6V1wKpr0A6avJiRTSr5j+C5Afb7
	jQ6C0GkRe5ibyHu3sna7AkLG08DiB0mv4sH4WEp/SPTCnynxboo7zr64KJDS1nqVah933q8+cRAHv
	Z1qPjb5w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdi2b-0000000FvSq-25j3;
	Thu, 08 Jan 2026 04:54:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: max31335: use correct CONFIG symbol in IS_REACHABLE()
Date: Wed,  7 Jan 2026 20:54:32 -0800
Message-ID: <20260108045432.2705691-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IS_REACHABLE() is meant to be used with full symbol names from a kernel
.config file, not the shortened symbols used in Kconfig files, so
change HWMON to CONFIG_HWMON in 3 places.

Fixes: dedaf03b99d6 ("rtc: max31335: add driver support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org

 drivers/rtc/rtc-max31335.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260107.orig/drivers/rtc/rtc-max31335.c
+++ linux-next-20260107/drivers/rtc/rtc-max31335.c
@@ -591,7 +591,7 @@ static struct nvmem_config max31335_nvme
 	.size = MAX31335_RAM_SIZE,
 };
 
-#if IS_REACHABLE(HWMON)
+#if IS_REACHABLE(CONFIG_HWMON)
 static int max31335_read_temp(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
@@ -672,7 +672,7 @@ static int max31335_clkout_register(stru
 static int max31335_probe(struct i2c_client *client)
 {
 	struct max31335_data *max31335;
-#if IS_REACHABLE(HWMON)
+#if IS_REACHABLE(CONFIG_HWMON)
 	struct device *hwmon;
 #endif
 	const struct chip_desc *match;
@@ -727,7 +727,7 @@ static int max31335_probe(struct i2c_cli
 		return dev_err_probe(&client->dev, ret,
 				     "cannot register rtc nvmem\n");
 
-#if IS_REACHABLE(HWMON)
+#if IS_REACHABLE(CONFIG_HWMON)
 	if (max31335->chip->temp_reg) {
 		hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name, max31335,
 							     &max31335_chip_info, NULL);

