Return-Path: <linux-rtc+bounces-3215-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B6A3832F
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 13:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E364164182
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 12:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DE021ADDE;
	Mon, 17 Feb 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfnQo5hT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5E21A44E;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796104; cv=none; b=c+SAW0kWlYBce1wZYe454yK//ZBgeZbAiAWtLp/SG47PG+iKMLMu6xOk78pOSPzjjNIvpr5jh6GZSUeE6tWPkptJFRQjQL9Z+Oz392NnKv4+7OIZxDtLpy4+egSUt/C4ZD/7x/91rfvDJjzjVmdQ9iM8fw17/Zc+zH614KTGn8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796104; c=relaxed/simple;
	bh=15Zd8A/AX7JK7ne2Uut2xhNj6TA143EWb+kPmN9w7Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9FoA8fsDYWjnnxQBjyNjEayJmhJyfiFJrw3V7VZGyG5Ue5HxzzmCBPMDklB8bbT4D6e7bM7wTA2qKk2bGlJ035y2Ou7AqKVuKzgHO0HxL7X+GsJi6YlBzbZgwcaf8Tkw3oqcDQTZxWDHEiRVynZta/NTg4hBoUTS7+bJvy1h6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfnQo5hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4023FC4CEE4;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739796104;
	bh=15Zd8A/AX7JK7ne2Uut2xhNj6TA143EWb+kPmN9w7Mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hfnQo5hTFAbmGYFcHeUWh9FAsPdtZr4JMUhjESvabqVX0Vc2tPI0gT47eGX4L314t
	 khQA9XcvMCsgdTec16NUKbmV1d6VO8L7+rrVuFlUHeOaPC+pax1XIV4sbcMBtRq2nP
	 at8eR/9iVvFqHvBxsi+9+Ds2MZ+FtcH7Tx4pQJMBegtBeb5MWur2oNZtJ+0Jdf7Bv0
	 EMdkRWU140YK0SM+cZXrVx3z/nm4XBOT7AvRxCWbOdh7qVmbvxOK0JOUq/9D6A6n19
	 CEvl42fleYGfnZl/TbBTBw12clcYFYTDKY7xgHUJrFxrbg1CPtoX9DmkzybTfkEkXe
	 BXv4iV9sN9+oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3712CC021AB;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Mon, 17 Feb 2025 18:17:16 +0530
Subject: [PATCH RESEND v5 1/2] dt-bindings: rtc: max31335: Add max31331
 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-add_support_max31331_fix_8-v1-1-16ebcfc02336@analog.com>
References: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
In-Reply-To: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739796453; l=833;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=kBVh5Woapx+65ZvZaO0BE5t/r0tL7uQbUpMT/sCj/bA=;
 b=bn/FRRqulS/I7fnK6tfOK5I8k5G5Nz8tQ4WHbP0daq3P158iZYjVmiSidcFKWd62zrc/7Pdm4
 +KnrZXiGFI/AWc+75q9Ip+5ta+W+hvg65P6hJ5V4k9i3p5/pRD40//O
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

Added DT compatible string for MAX31331.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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



