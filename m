Return-Path: <linux-rtc+bounces-4528-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED6B0896C
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E60D163BE3
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3D1289E05;
	Thu, 17 Jul 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwPkftbr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056FE635;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745123; cv=none; b=JPtE8ImqvJCRFbPQlZHlEKIXb2hTGizxTZ8xcuO0/Z16TMmBxWc1DoZK957iC8STiRsTVj7MHBqQJJvWWPzl4rKey/WEUcCObUDV2qRyIBl68+QO8UKnFKzk6f7MrUWiUq0OiaIndrGYDszUB6H3G87WU5BUHmGmioglKSMepmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745123; c=relaxed/simple;
	bh=SSrptMa19AA/XTd/MCF/BLG2gYrgYjh0sTQ0u3DDHqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqtKy1XPQsiHRR5dq+uZf3EumbF6y9edepgF/azkD1udaz/Eoq9oIUnl8HApw5ZWzNxxuWauaFAWp9Y5WKk2tqesJKgbu3fTgA/GxmgyjgeP0uRiNNBgx2tvt/+qkdJmE7hrHQeZNA1zpWl/BQcI8HiPqYosTN9acFUcgNpx+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwPkftbr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80E5EC4CEE3;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=SSrptMa19AA/XTd/MCF/BLG2gYrgYjh0sTQ0u3DDHqU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UwPkftbrO7iMGO5OaH1JvZV0nI6Hq3UFTYB6bCrA5HJMoJhq9yiSWIbMxsvMNvKN+
	 foJ/V+IDZiy51TF0vN0fMk7pDuSSYEjcRLlmchjfApOGG83UEk3mt3mHCRHWJl10t5
	 hCFZAuK6UPv9mtsso20Gi1dryQC7qW2mW7kNOVYFp0RReZEksOUgloT3fDU3tnzEQ8
	 C25n+ZsO/IGz3AZvI15+jAeea/iAW9oCJk/G+N/DQEJJyi76LIDDA0M1icnx8fbRqm
	 7yMzL1Go89NN/AE1Y7CbWj7nB1+acnG8lUpZcfqVHffc0DstEEZwVmc2KY2igFGJyh
	 QFOgTE636FgEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7B4C83F22;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] rtc: add amlogic C3 RTC node
Date: Thu, 17 Jul 2025 17:38:36 +0800
Message-Id: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJzEeGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3aKSZN1kY928/JRU3aQkcwtTS4sUS8MkYyWgjoKi1LTMCrBp0bG
 1tQD5coUqXQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=635;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SSrptMa19AA/XTd/MCF/BLG2gYrgYjh0sTQ0u3DDHqU=;
 b=1Jqgf8NPSE7AO66ZMlpxMqW+iQaU9ydrgRT4qpUFi1Uv4UGyEUcAN6agdhwHQqm9FqRSysslV
 k2tboqtelnLAnleh9ywMSUYZjh+K/q1JBXMPnZy73WrgbjpraPQhO18
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add C3 rtc compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: rtc: amlogic,a4-rtc: Add compatible string for C3
      arm64: dts: amlogic: C3: Add RTC controller node

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml          | 11 ++++++++---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi              | 16 ++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-c3-node-bb78598d91b3

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



