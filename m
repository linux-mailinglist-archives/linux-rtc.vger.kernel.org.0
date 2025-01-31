Return-Path: <linux-rtc+bounces-3082-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84627A23D4A
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 12:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1314E1883845
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 11:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15071C3BE2;
	Fri, 31 Jan 2025 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdgYP7EZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D49F1C1AC7;
	Fri, 31 Jan 2025 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323979; cv=none; b=BPXvRmF+BXRxs3t4QKRzjYpwiU2BpqOK9BmU3E5FR5frNRrUQyaMEmrcKYByDVZBrtVtqjgDfVGI15efqeWoiQCQwuqkKtE4ok6IKpxUHcr5YeWxcoPC+MsrimBira6lIVqIRSc55tHo9ST+OVZfJuP9LUWf+u3TPIC5C66g4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323979; c=relaxed/simple;
	bh=wZOjxTN2DuUXOZ3xSPzo3yv+BNIL51kvhM9FxsKo0k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnsjP/Nulc6DYnZi8tgEdMUan+Cz7UbcDK2rh7M2OrxFthlaSwTEsF5l3MZFaTVb/LFWnaRTu06EGxGt2kAsoX55h89H1CfGp5Q25qYWBn7LMcVIegY1dicVvyAIs5umFVlyxS8S+o3vL7PPn7T+qevnUvD16DvriRD/kxsCtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdgYP7EZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D03F3C4CEE2;
	Fri, 31 Jan 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738323978;
	bh=wZOjxTN2DuUXOZ3xSPzo3yv+BNIL51kvhM9FxsKo0k4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CdgYP7EZJr/zFACJ4+GcvsE9s/IINYBRj0B9oVTwys9HDEDy58t2nG6aV3sYWqYh/
	 X+QeoHFm6uzQw0g76n9TISD+puh68iyVRTDOJr40u2pJbtag5iCBBoiLmA79ZlFrXH
	 g1OKbo22nOaloVejUgrvmaX+6/U+VpM6QMDED7GgISrUgpm5zdSm8HXmUa41N/4PNU
	 vg79krfu2Kw6HGI4VQT41Dx0yQuO2Mc5HQiqmc1YZBT0yJQRHiEUIerHb6kRXuMdRt
	 UP2WiXkqtP5tQoa4vs37I87BFED3gUlPB5n8lESVFj5TD5GK1VStUKaJcFpGebNA+l
	 Kud7OQzWO61TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB969C0218F;
	Fri, 31 Jan 2025 11:46:18 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Fri, 31 Jan 2025 17:22:14 +0530
Subject: [PATCH v5 1/2] dt-bindings: rtc: max31335: Add max31331 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-add_support_max31331_fix_7-v1-1-d29d5de3d562@analog.com>
References: <20250131-add_support_max31331_fix_7-v1-0-d29d5de3d562@analog.com>
In-Reply-To: <20250131-add_support_max31331_fix_7-v1-0-d29d5de3d562@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738324342; l=769;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=T6sFNCObCLNQPeHE4syE+HNTP2Xkdn/NWtfgIUWPH80=;
 b=tvyLKpDMR7Ry1tRadhdVzjfbed9BL6/7UN0VA71853w3LPJwphhpiQxpe9varxG6YwEOFg5yS
 AVS+iZyw0TxBVyWQQiKEQgvGQLjVQEc4/F1JakMBfehr7sxV8MenbM0
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

Added DT compatible string for MAX31331.

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



