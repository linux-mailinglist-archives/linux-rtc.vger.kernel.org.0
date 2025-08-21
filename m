Return-Path: <linux-rtc+bounces-4737-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83B1B308B1
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 23:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62A65C8451
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 21:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156642E973D;
	Thu, 21 Aug 2025 21:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDvrVJw0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92520766E;
	Thu, 21 Aug 2025 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755813433; cv=none; b=SCkHgvAczXa6i2JJiVNwYOWhKv6ChT+2maCVG38buO3fQGcX6TBASQqA18uuj8vXrWKJsv2ck4zTTAu/+pddbpx5MMjc4EfWYC/fjl0sP4zugGkukg2DPFh6jrQ+lGl1U8yS0c5PlcvpKoSG96qVmjwfNt5j98w/GYo4v0RE+s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755813433; c=relaxed/simple;
	bh=b6yybqEuzIomdbDqAF4ulhEb+OUHj67l2i0cWttl8lE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muwnxvuLaX/ZBPStJe0x6JS9LIPSx+NqQyhFqbN8DOBfHqA1m7rbfc7OchHWt6LSdyWulBqwWxac4wdPvUdJlk4aCfVDGiN1JQNW1ct4yO/ITrdcO3Pvf96AGMejgm0IAo+7q8fe3RZiyUfS1tHvfFkWk7E5FymE4/C0rQSLWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDvrVJw0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BEDC4CEEB;
	Thu, 21 Aug 2025 21:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755813432;
	bh=b6yybqEuzIomdbDqAF4ulhEb+OUHj67l2i0cWttl8lE=;
	h=From:To:Cc:Subject:Date:From;
	b=hDvrVJw0ZfqngVkGKtoHXrmc13C0dYFWVnC3hIh000hBMp9+r4g3TMjMmS6yGv8BY
	 LyDGu91S2xMXJu09sr1IWoC/JG4X+BhADKZyKQRwqgOQ/bEj+F5+ujGXBJglKVgplN
	 6wHFYuHAFgNGgCz3OelV1CUtuaUhnlrEYpyCgfwNkYWDV7Q4T4t+Sa8WPV5HKDZzwU
	 GXr5IFWwa4+sfxyIKm9m/bNXsI5++1vyAgdzNcPDQ+b1sJmOwX81UD8f1ccnyKCKHC
	 RAZv8LnkMAgi1G3+xA4I1k4u+pmjHD9Phxuu8ekE0KQfEjnD1kpmwjdoP2OrouWh/Y
	 yWmdfi1QnvllA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: rtc: Fix Xicor X1205 vendor prefix
Date: Thu, 21 Aug 2025 16:57:01 -0500
Message-ID: <20250821215703.869628-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vendor for the Xircom X1205 RTC is not Xircom, but Xicor which was
acquired by Intersil.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7330a7200831..f8a35446d029 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -85,8 +85,8 @@ properties:
       - via,vt8500-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
-      # Xircom X1205 I2C RTC
-      - xircom,x1205
+      # Xicor/Intersil X1205 I2C RTC
+      - xicor,x1205
 
   reg:
     maxItems: 1
-- 
2.50.1


