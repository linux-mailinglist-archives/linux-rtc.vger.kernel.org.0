Return-Path: <linux-rtc+bounces-1831-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC87969474
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3721C211C6
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EB11D67A8;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSJ4g0TB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04E1D619F;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346847; cv=none; b=naf2Wcq9j36msztjqbDR6hnitZa3fzDxmp+J15VvcVO6KMtNVPYflrHUgSWrwWVmg5fC+X8n9logmSuymn4xb5g5KYQSZsmRQzXlX0AC9iRGUEOBnMFrq0QTJBuuKBUhRrOXQlvSfsEBOxCdfw46i54ihHmW45Cp+5A5HsqVNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346847; c=relaxed/simple;
	bh=mUFXxsk2DgyvRFloTAD6u/HD5++5mkG+NueFPTUEMI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EeD3bjtwU/XDXuJCOykpsCC1mIF4o/WR7qpxM0T8uFMdDhYXpH+vsfA43RFbGBkuO1f5hKPgAEVmzQnj35CXNch4V6g5IA6o8Py9HW5rN3kT1i4Q2/5SEBrzFMWWSlPtXaSaFo2B9D5JCtsQRdLOvsrbP4Q4zmSDeP/PwBBK2s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSJ4g0TB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FA17C4CEC9;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346847;
	bh=mUFXxsk2DgyvRFloTAD6u/HD5++5mkG+NueFPTUEMI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dSJ4g0TBjeh/vsL5/0BGiOAt3eZKRKqsr176a24yoiA13uGV2ukPj2Euh1YG4ccll
	 wiBBvrJu7Rchl/PD8/NiVPLTuHAaaADFPvq4DBybqi0IVvH3gdAVOrDJilng0qFJnF
	 usXWAiyq/MpKYbZgbBnoz7unAFgqkRh3DiJw4zCsfKDZ549aVyNoRP6KsF1lE7w3KB
	 wdvObBcBSlRJ/Y8i71w6k9Gr9sFZPG4YWhhW1M1pJuv2Hfmi+E9MUK4eH+pWmCJ1im
	 uFRJeaPDc5EOa2cwGc0tz1WOtYpnlIeZeguATQYPpaeDZmHMHllMXHMlHPSskRBeH1
	 a1HAyWbL/BqnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11139CD3435;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 15:00:47 +0800
Subject: [PATCH v2 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-rtc-v2-3-05da5755b8d9@amlogic.com>
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
In-Reply-To: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346845; l=877;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=XIFaH+nJVOwTXlOGddbE310DKNtSVCRPwv4K0uAQLf0=;
 b=Gk/bz/WWEsRaeP+6/mmQ6yyounrKWRHq8LqmEPUr4dcIrifmX1etdoSsvYG9Gq6D3WQqh0vCC
 ta2k/+9Tu2YB02E6FUUGfHxjjb/rDPlGFXzEc1lqvo5BSzqPjoRDWyk
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..cdcd23456567 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2481,6 +2481,14 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.37.1



