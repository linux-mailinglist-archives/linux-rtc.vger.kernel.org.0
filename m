Return-Path: <linux-rtc+bounces-1711-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C411D95C915
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813DD282E1C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F60714B97B;
	Fri, 23 Aug 2024 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwizPeTb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60714A088;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404788; cv=none; b=uhfDtAH8EUS1K0sQuEvTTPQ1Q771jr3T/4yIPo0/yerj/YWZe3C+tu8bi8CpG0fwuNsmvNpPVSybYxDEDwJaWSY/C26aJvjkJ25xdPrHQX36f2G6b0n8HL//Rp4jr0oMOXnq3UpQC305pMAZx/RkedXlOBN+XtnIoLkEVOOjacA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404788; c=relaxed/simple;
	bh=4xDHigoIyATc3IDZe3/YKW1ddkaLez4W2M1ZcQdYvcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NI5larmB3LgRcS6ErW9AFqD7j85am5wYusnNsVIXXA8ie+cAgv9huQ0TkIV+XyXTwR50VhcG5hWWvaqDomfqXoDXL9mE1SojAvjUm5pLKjxljHxg7tn7ibsrPdESUWpSH1bnSA8rEj8ta3zRLEC53FgtdwFuvfRMauCcjTVuRX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwizPeTb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76741C4AF12;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=4xDHigoIyATc3IDZe3/YKW1ddkaLez4W2M1ZcQdYvcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hwizPeTbbiP+l8mb31tumqmYjeb6ictmuKc8+kQFeowO5Vp4Wbh9Ukh/dVUjrS87w
	 R+rxyAusVZXYw2EmOEaoqdTeFeLrOr+UEMn3EwFfTGqel28dUSGUsM2KSlaL8oN43M
	 VjiKpCb8GkRd13YitkpPFZ5K3yGjWFF6S8zxF/+FOw89JfLuOaTj1ksCI2uRlMn1zA
	 RR6aj5tccTVkSd/bcH+JJc2t1yPg7w8zDUYF08TyJ+JKjCYlylXZtbANbBgm066wDJ
	 wrlBtToSOmxUMITCHL1sCjeWyPqXIvrqTlHcXrKOgWTbFVvUt6jFJ8vQrcKqHV6CIE
	 yhF8HT+episAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B003C5472C;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 17:19:46 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-rtc-v1-3-6f70381da283@amlogic.com>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
In-Reply-To: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=878;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=kKfAM48i5NM35z09vCTUkBfuWRf4o7vOPs0ZFkbUpAc=;
 b=oEyXPyxBt9+Kn3pBRu72Bhb7+F7ejh4pwpgFy4LjcjGyHpZpH3LLZti0ow50n/x3xKQjuP1Jc
 oluZXV1U07tDHuIwUCT1eUeBl0YDZJqQrfw3ZPRm8rz1oGwHajfr66y
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
index 42decde38320..672290dddaaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2481,6 +2481,14 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Amlogic RTC Driver
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
+F:	drivers/rtc/rtc-amlogic.c
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.37.1



