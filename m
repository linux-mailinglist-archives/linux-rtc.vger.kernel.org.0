Return-Path: <linux-rtc+bounces-1781-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62D965A72
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 10:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7318D1F2215E
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 08:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3929816D9A7;
	Fri, 30 Aug 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/msJJxS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F89B16D31B;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007005; cv=none; b=bJF76LLCUUSa1qKtZUntpVJzcHBJHMQ1U9VJ8cn0ogS6+Zc+8wROlv2r1GkgSdiISM2J5/GTbJpXJMn+JLJpwfJK1q0dC1Hx6jDG6+55V4w5CfwlnCDtUcv7kIovTjWOxNAfNhWrrd0E3fOrw3sv0pmYRKxW0Mnvw0dFdg3koRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007005; c=relaxed/simple;
	bh=grKhKNpeqGkYtMzM62/xBG6cFi1MZzqmLd9p1Tq6bx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoyFH/8TxB2cHUNddRzOOO80TRkSgzotzgBsg048RLtcVpposImt8D8zeyzJcF2zoHPfZ64DXE79dTBoHo6ol5rRoeSQ07/zxJwNjcLmsjc5/Siaxe1zyCsAzAfuoNCz1aWdtIRXUWU6y8XimdEp4Tx2Biw00eNo73OimJjRTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/msJJxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBC3DC4CECB;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725007004;
	bh=grKhKNpeqGkYtMzM62/xBG6cFi1MZzqmLd9p1Tq6bx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I/msJJxSKURBRUlADhMdmwI5RIWB9sNG8Nl9zcpyMLYeMcQNTRt3kkmdMxP2hMG0h
	 3thHsnN8/Wpa/UAJ4awixQHnfpZ6/gfzdM9Dfg27Z96PaN2wXhfLKOiOFCGf4fo2P4
	 xiYGElnKDHDOWPO4RGllReezXkkvmwqf/jA7z1AI1CmIesTIYeUXwTf/8Q4VN2qmy6
	 cZTnolz9ffv+Bnr4QlqlCDYM/oPgqQsQt9svlxJLG8WP1oUG9lVKXer7gk9XraR7nV
	 Ob+YmBI4CE3lElI79l0cUaHxHIbp41QQdfK124LwO++P28z+tme4/FevDzMCkgqXPv
	 Ifd+CKCKjpNNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0E6CA0EF1;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Fri, 30 Aug 2024 10:36:40 +0200
Subject: [PATCH v7 2/3] dt-bindings: rtc: Add support for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240830-rtc-sd2405al-v7-2-2f7102621b1d@gmail.com>
References: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
In-Reply-To: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725007003; l=891;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=v8SGicMUEve3ehv2KdVupsi+4VK3XCqH4IHxbA+90tk=;
 b=lt9DhKeP2YOvwZq6gRys+1XCVsaDcmqvwk9Lo8S7DiMSz4gd+udqa3wKc4CZy4gJcf9H2+pTA
 mnBXfKTdvDXCrhY7YbH0pGHzjM/U1c+MZj12FolSxt+PJMJhTjOZ25G
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add the necessary documentation for SD2405AL.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tóth János <gomba007@gmail.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

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

-- 
2.34.1



