Return-Path: <linux-rtc+bounces-4530-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80321B08971
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 11:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8113BF994
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 09:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E1328A3FC;
	Thu, 17 Jul 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2UQV1ii"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577129D0E;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745123; cv=none; b=ZGX4t8uXBUwUE7DoMf6L40Wt5QD1jo9O/SBwLmLzQa7SHYNiUPzHSb1OU7P0CsoK+kFuf1M2XgofSx0Qp56zbu9tuSJhc7ZwBFO41o4v1OKF9IvuJk/mWpMR+rU12ZOs0BchWUIyyJ8C8BDRjduEjRdVw6+6bPArbpysAy8WqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745123; c=relaxed/simple;
	bh=4Ndj+Oe3t4mjo/gbKEf4uPrZCwLkmNZnl7NIMzr58ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=In+L1ArOLxmHngIRDQd0zqYOXENlYH3FaZUbJUmrhCnRKivz+L3Mgh3kcNMHU/lbnRoyjJDeXVxLaxJ31idA0rdsOC+0p+OUL0OkKZh90YFL4l1ZDjAqRaVXvlVTXsw9la9m9ZL1uxgSV7vDpSiVxAW9QSVfWhBWznQtBNx1K5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2UQV1ii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E5C5C4CEED;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=4Ndj+Oe3t4mjo/gbKEf4uPrZCwLkmNZnl7NIMzr58ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I2UQV1iijEu9OWq1nik7oCNThnCHBzy6i3OTEuMdW0p0c1gy4KR27ihBfVwZ3Mr2n
	 BR90YQFf3ZgxnZm6NolBb6Kyc3TEWTvJ0lM29+siL4RXGocYVMQgwuiBkZ8wlHeQDo
	 YeL4ObS4v66vPSLvI2mj1VzvVzzHHnOEhr+7fR0Zb8v/o7/AQUbEvjc5bULQtC6TZx
	 PqlfwJ585q6MqycUUL9IKhar4oKV/n+Xldd6KHYWCMltAb/I9mi4d3hOXC0oYS+l/D
	 /zJrzlZ7H3nf7bZ5c8qsqPJH9ee3S3RxkaOdTVHOVjFozFvVXbz3TkI2ZV4oh7QssH
	 DzizjT82R2hKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD4CC83F1A;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:38:37 +0800
Subject: [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible
 string for C3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=1022;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=hzR0ZCHlhb6lBSnaSo2wyYzPsJkwt/jiH2b4zUOXQGs=;
 b=V19qxhXEYCFJdcPhLmr3zFhQT7TnOpLv6c6lf32Vyc9pC8x2fbEg0uajlnV9BYMTjc7yPC5kI
 DU6TCgBiRRNCenfVJMYxDrLudHQU9RYjt/AcrE38bnYfmN6uoVPzWxb
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
no need for an extra compatible line in the driver, but add C3
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
index 5d3ac737abcb..e61f22eca85b 100644
--- a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
@@ -16,9 +16,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,a4-rtc
-      - amlogic,a5-rtc
+    oneOf:
+      - enum:
+          - amlogic,a4-rtc
+          - amlogic,a5-rtc
+      - items:
+          - enum:
+              - amlogic,c3-rtc
+          - const: amlogic,a5-rtc
 
   reg:
     maxItems: 1

-- 
2.37.1



