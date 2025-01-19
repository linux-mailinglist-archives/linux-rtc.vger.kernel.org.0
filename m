Return-Path: <linux-rtc+bounces-2940-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A2A160C7
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Jan 2025 08:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35533A6712
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44605199E8D;
	Sun, 19 Jan 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRDFjLtG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5EE156220;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737272494; cv=none; b=iCcqHJyBbEG0Z9AAf5lcbyIN9cCI8ZNNROpTWc6Bkvb1t7Qc/MRDWxiG7SwgAJbHU1MnINZr/qkAGC+Hhz0uqO8CnktBeXXFwD/qLv14Jo69KA/ItnOeYQNTjwmiwt2ylQgYxZjqM5bzh7rKL9cDziRRudhFIypfVkM06UBkzTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737272494; c=relaxed/simple;
	bh=Cy0jJganMav7jNDYNeyysx0pe+jVF/gBSrwx/DYb8Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epfjRLBmXFBD36HuU+9BYpC/9E8j4dl+Q7Mldq006Tkc7Cm2apepwpkZlGod/L23F2Y2aIjjjdeDHh4nVA/98IihrU4EI9zk3SFcmNIEPqu3DLIzcEpiHZE9XuABRiA9dDXzx7e5TWLFiCMMTX5aAH+NelmzSMAteTukgXq3s3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRDFjLtG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65A38C4CEE3;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737272493;
	bh=Cy0jJganMav7jNDYNeyysx0pe+jVF/gBSrwx/DYb8Qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bRDFjLtGsWlkw1/J2Dia9nH0aGRTxmFPyh9N/LsWMQAuBjAD6zWFfEQ2QhodGoxMI
	 FOmjbkr7wBTfnUGBTqbinPkiSJaFVnJj1afQL2RWPVPofGQJjEr0T4PjsgcxXALRGj
	 GtlPRO/pHY0BqJsgfGtyeQFArZn51JMFenNatB1UJMDOOrp96/3kH370G23eTbw7eU
	 Pwc3wrbXR4qk2mq0s+SfddTZgsDH1oQp5btEzfXd+rveMcvDAcfUr5q54EGR/wDVyW
	 kUtdLP95U/ELTXITQtvWOCEsAGMM/pDx6teCHbHYtbiLraJviWrKMGS4GBoAdcJpEm
	 uDIS50Feo3tbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5501BC02187;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Sun, 19 Jan 2025 13:17:38 +0530
Subject: [PATCH v4 1/2] dt-bindings: rtc: max31335: Add max31331 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-add_support_max31331_fix_5-v1-1-73f7be59f022@analog.com>
References: <20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com>
In-Reply-To: <20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737272867; l=840;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=dWSTr3UBdLNVFxzUWxXMTrRrSgNJtB4XrSFf4xsMr/Y=;
 b=iDOSYc8dZPBMY1/a+WfMXlljBO8tLciXKGRtdikc7k8KnOzGYj85+KUIc4mxM5JT23kFEbppj
 fihfwNMHQrdDM408mohlCHug588QwZnb6OcpqxfxLhhTei2594++ysO
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

Added DT compatible string for MAX31331. MAX31331 is
compatible with MAX31335 without any additional features.

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
 Documentation/devicetree/bindings/rtc/adi,max31335.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..bce7558d0d8789127dcf6050a78a166c753887ba 100644
--- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
+++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: adi,max31335
+    enum:
+      - adi,max31331
+      - adi,max31335
 
   reg:
     maxItems: 1

-- 
2.25.1



