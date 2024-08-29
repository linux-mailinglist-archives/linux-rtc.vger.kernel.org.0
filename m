Return-Path: <linux-rtc+bounces-1769-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14835964309
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 13:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894B91F21EDC
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 11:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22BE191F98;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXtpz+I1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430919066B;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931118; cv=none; b=A7ZyZts2Dt+7x1J693Yai/77Zvnt9QQLVZzasSGn4kqFZMnnMtL7UJG788H7HjUb5Ro6Lfvr9HOQctvpz0TuNfew2OjopKM5r1xHuRagUSzxDxKC755UG4TZfPutxIA9WsMNflZdBbfzghJnV1T2L248ftv8rlGfVDJHT36+4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931118; c=relaxed/simple;
	bh=P4B9ohR1O3USzAy2ejfDMrEQvOSjHxTahbsEML5oSVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlbL14eG6dSjYirQ+uHMZZdpW4fgRm0W9Cr9JyympAb6+r7mKXk/KIl+E73dF6QT+EB1bR0abqpDdov0IUYA18VWbv130n2a9OlofUawhqOV6bknSV6P+fiAnXjOyJgtP7n53klvDAmCYNniQrNXQlSKshatL2gLHJxSx4UP+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXtpz+I1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DB0BC4CEC9;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724931118;
	bh=P4B9ohR1O3USzAy2ejfDMrEQvOSjHxTahbsEML5oSVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iXtpz+I1atvM1a+Y8ZmoNJXaXqdeUNT/6zsYL7BKCvWawzRsA7tsjMdI4fr4Rijlx
	 /GrFHGS6kRM9KhvkhmbtSDZ722Df1AcrC9emdHvP85mre/8RcgdBtkGA7BdjG+Rcz8
	 +xGP5ZAnx2ZcWHv8mh1NKVc7zFxqY5d7HHWkqqBSkvBiYZLG5gQSxwGf25hgLGKVqk
	 vjXWCzFC27XWSjjafEgB31BSs0SIo7VMPOjd4t79EI9z7afTc8uhWnBWJhWdXZuOvW
	 P30Gl0wxbUJbwji1+MXpE5a7+Lv3MAveVgL1i4Hs3xGq5nzBWxqhP+77//HtLa/a9/
	 cFdhbmTQQD/Dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628EBC83F09;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Thu, 29 Aug 2024 13:31:45 +0200
Subject: [PATCH v6 2/2] dt-bindings: rtc: Add support for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240829-rtc-sd2405al-v6-2-4fbfe2624aa7@gmail.com>
References: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
In-Reply-To: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724931117; l=1442;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=7gympWliLOXfkOAZVaUnB51JPwKhR6f6uYQ7uncDrEQ=;
 b=+ZclLvcvAgzb0+xrE1b/163fsTkk4u/29du/NrUoYWMdhZpDsT1bqwKIktJlqr4nDvAkjTN4q
 clJ6wwqhRSZCZaVTJVbCh827Qk46EoFADzmY+buHLRR6/q34MPXMQYk
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add the necessary documentation for SD2405AL.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index fffd759c603f..dae594626b2e 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -38,6 +38,8 @@ properties:
       - dallas,ds1672
       # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
       - dallas,ds3232
+      # SD2405AL Real-Time Clock
+      - dfrobot,sd2405al
       # EM Microelectronic EM3027 RTC
       - emmicro,em3027
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a70ce43b3dc0..bd8b279a5152 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -368,6 +368,8 @@ patternProperties:
     description: Devantech, Ltd.
   "^dfi,.*":
     description: DFI Inc.
+  "^dfrobot,.*":
+    description: DFRobot Corporation
   "^dh,.*":
     description: DH electronics GmbH
   "^difrnce,.*":

-- 
2.34.1



