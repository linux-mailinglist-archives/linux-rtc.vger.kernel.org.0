Return-Path: <linux-rtc+bounces-4204-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD22AC8C50
	for <lists+linux-rtc@lfdr.de>; Fri, 30 May 2025 12:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 109839E3F1B
	for <lists+linux-rtc@lfdr.de>; Fri, 30 May 2025 10:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF39A222597;
	Fri, 30 May 2025 10:41:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C272223DE9;
	Fri, 30 May 2025 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601692; cv=none; b=UiE5xD6aMfmVLwYGV8XgONBI/Wu0Y3r2lG7y7lHtVrfSHKdXnFBFmVJqsmfaeNUuiiVSsmVjdtgXLhGzyUBHD/DhY9ahd5OFTnf/uPHcXCpnNLVF7sRefuY83uvjoEi55I4m+HblD7mnuXI4/UfCs6QHrMDkdIHjnpDfWD/WvfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601692; c=relaxed/simple;
	bh=w/fSzHN9CXaAh7Hkz/K3YmGsmgNkKGT9EwDj0Vng6gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U/3+Y3RXcmrroGFA8j/FnDxAd8Pa6f5pT8xhGBDvWTTQbbGNWr6NUo8orI2EVV5tdhwuKWxnwaFBmRFeFGFp09/vqWbgKM/eOOk/2JM1zIA25QVc6TD2aUuw7FZx1fYgnYIyMUSOm6fAL0I0NzrRGX2fl9kkuXJPsR/1KFdA0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 56F5B1A1C4D;
	Fri, 30 May 2025 12:41:23 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 48F631A0053;
	Fri, 30 May 2025 12:41:23 +0200 (CEST)
Received: from lsv15324.swis.ro-buh01.nxp.com (lsv15324.swis.ro-buh01.nxp.com [10.162.247.227])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A6CB7202FA;
	Fri, 30 May 2025 12:41:22 +0200 (CEST)
From: Elena Popa <elena.popa@nxp.com>
To: alexandre.belloni@bootlin.com,
	hvilleneuve@dimonoff.com,
	r.cerrato@til-technologies.fr
Cc: linux-rtc@vger.kernel.org,
	Elena Popa <elena.popa@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] rtc: pcf2127: add missing semicolon after statement
Date: Fri, 30 May 2025 13:40:01 +0300
Message-Id: <20250530104001.957977-2-elena.popa@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530104001.957977-1-elena.popa@nxp.com>
References: <20250530104001.957977-1-elena.popa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Replace comma with semicolon at the end of the statement when setting
config.max_register.

Fixes: fd28ceb4603f ("rtc: pcf2127: add variant-specific configuration structure")
Cc: stable@vger.kernel.org
Cc: Elena Popa <elena.popa@nxp.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/rtc/rtc-pcf2127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 2c7917bc2a31..2e1ac0c42e93 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1543,7 +1543,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		config.write_flag_mask = 0x0;
 	}
 
-	config.max_register = variant->max_register,
+	config.max_register = variant->max_register;
 
 	regmap = devm_regmap_init_spi(spi, &config);
 	if (IS_ERR(regmap)) {
-- 
2.34.1


