Return-Path: <linux-rtc+bounces-2656-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F269E19B0
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D0A2875C2
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19391E284A;
	Tue,  3 Dec 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="GYJJlfCT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A141E0DC0;
	Tue,  3 Dec 2024 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222758; cv=none; b=hreoVyDaRXGLCNAlVGQZbO2P/zkX7RHVzAjqGWIq+6OcKhZykgu6xO8Eaz7H9oKtMG5g8HobqoTBbifXRxzg4vbgxhd53AiA9kBBnOehFYV1TRhOyJzLvuqujSuMogmeww6UoK1e+VnSewwMC6fwDws1UwJ0OAqBBU1jpFQNRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222758; c=relaxed/simple;
	bh=HikzWfGUHdTPcWzOAsF0rH2hfac+zvWroN/rJRztwt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpxBMDPeI0cnn6q9gzbxuEbmj+uVbWvJUav3EvyLcYX1uY06Qlc/Nqdyo4CtQkYO+MIFDFMAO3jIkbhnQO3Bby0pt9nq20+lq5pNPnH6VW/GnZ58vOjFH9oDKNmFb3GTP2PQwXgSsx1qxvpz8tkU14QoMWUYAAiIrok6nNpW/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=GYJJlfCT; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HckHfqd1Ci6rmjSqq4jkSS7hiji1q1F7NU0SCgFEvmw=; b=GYJJlfCTzz73b3h2Mt6iEEDNRu
	AOeaqNKu9mpvJQY8YbJjd1ZfBMvJwxlxsTD37HpItfsU9han+JWfFOJKUxaCArHc+RRbnkYiJglrV
	UcyVdWDrF6PwqJjK3Oyj03pcPmIPOR/F/6uKgLHlK32r7NBRH2hcbgLElX8CAHqwOQ6M5vAN3tI93
	uLwdtRWhBhBt/13KLlLW8g/1NqrGhK+xri6yTUwt8tGj+k1JF8sFCVjnUpHFHgTFurueeejNCVa1P
	2aKxSFzRDJck5ezBB0XGUXo/7nrCxc5BzQMuLa5iq5hJ1miHzs373wU1WDrdxR/KdGv42HF15lPSc
	nJOIGDCw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-0001PS-Px; Tue, 03 Dec 2024 11:45:54 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-000LCx-0P;
	Tue, 03 Dec 2024 11:45:54 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:34 +0100
Subject: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=826;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=HikzWfGUHdTPcWzOAsF0rH2hfac+zvWroN/rJRztwt0=;
 b=8Vqg6fZTE/p/+KF1BlVVtd+83PourQxUoWZXQn/mUt9bvnFZCLorV9aF867KVouKsn3OJN2sl
 wqfo9+wfKNmD24TJGy5aeAutisgd/gGfeZmtBfh7RiGY6hoJHR63G0G
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

Interrupts are automatically enabled when requested, so we need to
initialize irq_enabled accordingly to avoid causing an unbalanced enable
warning.

To: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-st-lpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	rtc->irq_enabled = true;
 	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
 			       IRQF_NO_AUTOEN, pdev->name, rtc);
 	if (ret) {

-- 
2.47.1


