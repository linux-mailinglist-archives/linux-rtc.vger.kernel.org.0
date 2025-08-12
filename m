Return-Path: <linux-rtc+bounces-4674-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E2B2338A
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 20:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81BDF1B6221B
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 18:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C742FE57A;
	Tue, 12 Aug 2025 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fk2zgRVr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C842ECE93;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755023129; cv=none; b=dcElGuZCe2/xfbcNU8tJUD+PjnNTLPbPpl6mJFpcvNl3xLkUYWGU3ksMH+tUgSKI5B+y+UIprgL5vMkqwUryOsTYDkVdWe0nbJEpc/k+bA7smxTmywPGnmsDnes4G7FFUDWlUuQ5rHe2TB6XnCU5cE8OJh8pSPA4PdsPuzEJBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755023129; c=relaxed/simple;
	bh=63ifB2UNg7AJZpvKq4iGRrTwpRB8tb+yLkJzjM2n5lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcFKrIdTsW2sZu9GahrDcSvCZevtdjgvEANur/y2IZedI8z79Elyd/MaWQXmdAP95IMvY/IeiMwYk3AuwWxKGX6ZXVRHOQfGh/u+rkGsidzZ/VccdnB87febZIBk+a0xGaLInMfl3objZGq/WD2EhhJpNZ3CpTGY/jcBfKRKmU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fk2zgRVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96EAEC4AF0C;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=63ifB2UNg7AJZpvKq4iGRrTwpRB8tb+yLkJzjM2n5lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fk2zgRVrLT4mojGFu2aLBKsIMMTKCINompo7OsWLUwFRq0XC3D0b4ULuZrwavryGS
	 ZCNN6RIZ+1EBp9FU8tIdgVEdHApW6D7NeYiE6E24td8WQsuoWXVoZPsdyIcoQ1dZBs
	 9fDdTgIapMkHSwe3tN5RXy7uUARwiOORJzZYtLz2o+U9b5b852/XpCxOMfgZ6faKNo
	 5tS0Y4yVp3TEoXqE4frEuwiGA60VTNXFgeR44GDh2XxHM3O9QY+D9HWAkRxuxhd5xW
	 qw7ZUkJdSy6pzWoRPL4wGQZ8UvvqQzM7wtoSb/wZB4CWBs70/f+HCl+Z1hn64bU53d
	 s/xQitVDbIJPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C6CCA0EC4;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 12 Aug 2025 18:25:17 +0000
Subject: [PATCH 3/3] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-wip-smc-rtc-v1-3-66a8e96dad60@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=63ifB2UNg7AJZpvKq4iGRrTwpRB8tb+yLkJzjM2n5lA=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsdrFXpbt80jVMT1u8Pu6utUjNomDqHVOZJv03zlH8d
 eJH7BZ3lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACaiaMXwP0q1O2n15tUtrhMK
 sxfIHuz9HJFxL9o7mSWXecluFj3jNEaG3ie6ZVHZ2RW734dYft+yN3UH283TK+7zW5luqSzmLNz
 IDwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.34.1



