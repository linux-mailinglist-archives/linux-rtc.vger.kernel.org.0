Return-Path: <linux-rtc+bounces-1924-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD297467D
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 01:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACFF287849
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 23:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41B01AD40D;
	Tue, 10 Sep 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0HlY28I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797B1AC8B2;
	Tue, 10 Sep 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726011876; cv=none; b=OOi/3CUjCeFJrA8iNvCoR22nWz/REnKUfV8FzW35I7fFstt5jOO8grlYpt4Dy6gMXw1dUjgiDpMHiHNZ3OmaNGBjU8uzpPrvC3C9fOqsJh4nIVndO+mHR8Wp/Zrjr6YIh/vlSG79piV3Easbv6NfZN/5I21prG2WeP2wlsxhqnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726011876; c=relaxed/simple;
	bh=GL8lUr8WY3cTgLAHEESls100v4NcVVKKCChvCfDwG+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EoFoNVGFyUlD/Qbrmv2UqsCWpVjBCmScBMeGCB61FZggQlGs2kCPlyHpqcG48jcKbU2DhIBtHK/Swim75E+KjGph6BH5LcYs9csQlqbr5Pi2rHeD2RslOOBbuVUasaFPHZACmo6FaTePvkij2wDCPN0rKDhIqENE3yuK2dqiSyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0HlY28I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF570C4CECE;
	Tue, 10 Sep 2024 23:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726011876;
	bh=GL8lUr8WY3cTgLAHEESls100v4NcVVKKCChvCfDwG+M=;
	h=From:To:Cc:Subject:Date:From;
	b=T0HlY28IMYXu0m0mmiAmivGiWlvmsBVhHPXYEcpt8OZ+p1yHIQNsz1If6icQF66Ti
	 wXHoHwUndCdK65cXumoogP9ByoeZjP+NHBjjBYdBJXaTU/4BcNm6cAAB9g4DyiVlxV
	 mGNogAUBL2BR/bJLqjTuKj8JfDYD/3bpVJSLDoRAUIjrU31gHjQdarU3C1ZpOulUvM
	 A0tw2ZFs6bN+NdtBCyA11fDAi9q/YuIuKfxkAP+QliDVuJ69PlBjRAiDZYLwoou5f2
	 0vSHC7XpLlUdH4apw36P9roWS+5qHxJ1b4FgmjzoHlP4liDdbjjJMFLkRuKFY6hYjC
	 Puhgev/vM04ig==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: Drop non-trivial duplicate compatibles
Date: Tue, 10 Sep 2024 18:44:31 -0500
Message-ID: <20240910234431.1043923-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several compatibles documented in trivial-rtc.yaml are documented
elsewhere and are not trivial, so drop them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index fffd759c603f..9e506543f5bf 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -43,7 +43,6 @@ properties:
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8010
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-      - epson,rx8025
       - epson,rx8035
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
       - epson,rx8111
@@ -52,10 +51,6 @@ properties:
       - epson,rx8581
       # Android Goldfish Real-time Clock
       - google,goldfish-rtc
-      # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
-      - isil,isl1208
-      # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
-      - isil,isl1218
       # Mvebu Real-time Clock
       - marvell,orion-rtc
       # Maxim DS1742/DS1743 Real-time Clock
@@ -68,8 +63,6 @@ properties:
       - microcrystal,rv8523
       # NXP LPC32xx SoC Real-time Clock
       - nxp,lpc3220-rtc
-      # Real-time Clock Module
-      - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,r2025sd
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.45.2


