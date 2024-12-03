Return-Path: <linux-rtc+bounces-2653-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171D9E19AC
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D02416601A
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6E21E282C;
	Tue,  3 Dec 2024 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="ZUjl4u0P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6B1E2826;
	Tue,  3 Dec 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222757; cv=none; b=mQROWAmql/wTgc5k3mmNSv7YUkxqHBD5fMICURhLDQxeL9DZV4jzpfGRHdXa0m2RL5MdCTJQMPI+vfe6mtG7+Ry6RG5Bmj4TPGok0ylJamBKehxnzUOP6azzTp8Y2FDFOmjO41lkpi/4I9IiDvszZpxFGpUFsF7ddlNgeOhKw9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222757; c=relaxed/simple;
	bh=lfceF/R4zTEKZtMbD2dtF8hRgU22gyhkWzqZ3V/HmJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlouS7m7sbFfUUz13bAYu174IEs8Ja/NZQZ14nGzhvHq8OBIT1oeP1byugs1/Au4aFcIykG3USLpOaADaSK3HkeN0/glmyfHVSb3fKHgwmFH2VqrijsI4j5Hi1wsL7Vu8orLjAhzC62Jqp7p+7VvsLqCLfSNhWOqZOjfUkouq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=ZUjl4u0P; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nX4bkbIZKpT7sODYvlUnUTFKlu0EJnUa7K5EJrNYpnI=; b=ZUjl4u0PaXGwcTI9JyDaApkeDd
	guJmK9tROv4XV6z1g2pBzD0MHtIerd2KWGlnGO0T5ELQoVOEPc8I/GEJVcNI91KYx5F1IlpeuBILy
	1LdF44sHZPMGDYrMttP3dfUZ8EQ9dz/ZFPHwjsqzXqDLnf3SzOtb4JosrXSE7aTLMvmJCYJVFDv+Z
	Frc33UuUlEbJ8QeddEnJlnYn6WyNFk1FueJc5ioqP4gcq6a/YKwMp8fGpYdNDzOiLp+uPSGrdUBJb
	oNfltBafrhC9vOF7wqphSvzH0VRfz3e2swbIq7q7YDnRglYlKQZBXhzY69oEuNqqvbv/4VyIsci+C
	zCqn8dng==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-0001P6-8A; Tue, 03 Dec 2024 11:45:54 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-000LAz-2C;
	Tue, 03 Dec 2024 11:45:53 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:33 +0100
Subject: [PATCH 3/6] rtc: cpcap: Fix initial enable_irq/disable_irq balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-3-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=822;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=lfceF/R4zTEKZtMbD2dtF8hRgU22gyhkWzqZ3V/HmJo=;
 b=85nu3Rb3mId3Ufq7YSxPYM3kCNK9+/t/TLYGoPM4g2wqqf7gttiZ56EwrnAoJ9+1Z5OQUFACb
 V0fF4wGUVqOCpiYWkU4xYH7Io8dhgu1axxAS9+CuYtuDnZ7Cq+fMKjs
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

Interrupts are automatically enabled when requested, so we need to
initialize alarm_enabled accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-cpcap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index afc8fcba8f8885c15730e47fe0a9d3f681e3cba4..b74148935d21ff69095e703e99bf024714e41ac1 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -268,6 +268,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return err;
 
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
+	rtc->alarm_enabled = true;
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
 					cpcap_rtc_alarm_irq,
 					IRQF_TRIGGER_NONE | IRQF_ONESHOT,

-- 
2.47.1


