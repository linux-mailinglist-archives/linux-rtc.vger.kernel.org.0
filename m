Return-Path: <linux-rtc+bounces-6295-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHSFCS0N02n3dQcAu9opvQ
	(envelope-from <linux-rtc+bounces-6295-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Apr 2026 03:32:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED83A1073
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Apr 2026 03:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CDE53006B3D
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Apr 2026 01:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A30F274652;
	Mon,  6 Apr 2026 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxNoFoLH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7E182D0
	for <linux-rtc@vger.kernel.org>; Mon,  6 Apr 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775439135; cv=pass; b=hfi/9VsFx3SRsJhc6BUzz8A2ZCVrkhMfQAInOAdspkchIRUtmrF7xFDS0dZT4tz8WHgRVAm314RFcEkRNamx+PrQLwB1gTWAQjq5vZz6TEd+gud04o1NX29XndSzV8E7GSxBKEIgjy4NdiheJ+QCvvN0AC8U5SveZPzzCZ/DusY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775439135; c=relaxed/simple;
	bh=/2oRo61DdxBAwVd7d7a4v3psrsDUMYudbEHSnh1N+pY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TAR4Q2FJndZWKn7HO+qoDhieS162bHKMTy9z5E7TphkYLw9D6lHWm88Rf8NMOB3++HHiLPVyCx0xDnjRDD8/O6Et9Hf99jkNMTDhcic3uLjIM/681D7bwVGnZY1hx5n5spL9uvSRo3MOOnTrYOxOlhDuMlEIOOXhsCblCN/DFHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxNoFoLH; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1948336f8f.3
        for <linux-rtc@vger.kernel.org>; Sun, 05 Apr 2026 18:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775439133; cv=none;
        d=google.com; s=arc-20240605;
        b=dcGwb0FpHVV8TcqTHpJgxQRa1XDvUSk26pC1SN/SQXxxkdIZtij50uGBjmLs1eUDLC
         9JZFIrG/+TSrEBZAgLrvJbF5nrxH/jpXkaHRmn7ntFiZMOGZ40KeIGJeYVJX19WwR+Pc
         rJH6JQTN1HlehOguaog759ELjLMTL6jMPXn2fSMyw4arPpmP+DPb5D6vj+Y78p4/kA/T
         npymRKDmNwqja45BbO/5e6DhkWuvGK2KXC69QtUHW2pE/2APrpjng4X7UISaFTkCiWgL
         qw1DogAlcK6IPAvnL+u3OI72zW5gcR23ujJbpkXEF0GZXd4+kP0hFGnTtTrJ+IUv+9+z
         8xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        fh=rJaPNyTOrKjXtPZTcN4tvilMEAWgrHoUOFkTnh5dWQQ=;
        b=GJcEnCNY6F+aOfCNCm7tamPKztUMgndU6JA2wWCfqabeumLHWTGvPSoyEx2a28WW2R
         eWTuCWEQ+TxCLX1FL6AD5r3r9su9o2nOdGTFEHE55nJoOGfJaVEUAxv5UhpMJE2YjeKd
         53PrxQOoXLwFNRUb7aYtHCWUdpVtl3yofk/i9xJ1T0tt7B6NRsXD64m/aWWlWdj7VD1f
         MGtCkLzDEZ6rNCoq6Zh5DZw9q8sV5y2wWqJLQESCKecpawQcCSCKAFafmvpS5ugxPCkj
         23M+6+z3+saKb6VQlOPepc4gEZYiJs2TXriAcK19bzJjWkvfJDA7CF+i9ecSDn/oLfQ7
         HBLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775439133; x=1776043933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        b=FxNoFoLHJbQ2q5YJo+SohtBKC4R4IdqoKvaExHOwngByGINt42VmibAXJvht95z5sX
         Anmzh610CcsFqkzeh2NL0LIH7aM9I+yTkPcJcDhOOgG4MWthqQ6FueyrALWctmJRpPl5
         54yA2bCBBi1+9FJsSSWyEXp1jMRDvfUOGUpLtqgZnVGNeFVKg6Xg+lLfq1X+QAIRmhme
         EacJrL1mfa/bl3jfFTnI5um5JOhJpsCjlY9J6mrGY5VrtvrX2JcthsqowTAFhWHVC/UJ
         lWG3qfC2u3yMjTiaUuer682ES+21LtRGA2skqbOfgQ8bmCeLxc3nzHE/oyW4q4iuxjDR
         x/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775439133; x=1776043933;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        b=CaBgRKdNmX0fEwWiSnqei86zy6ABv3kbqRlbjrVNH1c6ERr2FClhEKKz46aMlgK1XP
         I0xwt3NE73/mkHdwsSOAY0Z/v4QvfRZlZ9nUdpndENCC7De/cnYzVln4hsZb0q9XRIky
         H1Ll4/mpiZUCmdBgc8an5rKDcfF7EuyCd6bSkmichdoLt+SQth1ma1gkVc7cXYKBdt61
         +gyzqLub1S6xftzofaEYmvVV/TqRgDCGm/+FAMY9Eb6YDyPZlgEmzdGju2xJDAIGvP8T
         ut7CwD8YtPufHBISvRt02N+K09zIWETPmnJG8YQrwxKrs8iSZd93DuqgN4iAU10XCMpC
         8+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUdXlFOmigGLa6yDO7rhCmMwAnIa97kDulHMWZB/0espFcsfnAPvSGyvrbnaUEobIDUamadj/Q3Td8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLy92cYaOqN/iQGLI/fMnxFdhdMyrG3EFLwlaLU8OmnDFi9hW
	SubM3pFS6NZ5+AVp0QBxr4LTzpnUUf6JNjFj5UCl417iag5D0GjfbSvwZzF3UCe/gntb/4R6j+T
	7hIFa21FZhokr98q4U24fGT/pxlzBsqs=
X-Gm-Gg: AeBDietvO3/G+cG/8TcYKoaoGZ7dvIZhE7n5r7EWdQKd66mFe9lNsa83TBaW7UQPAxY
	UyYqUqm5aYEmGNDv2sWhAFktWJWnsLSbniSc3ajfEzA/BVD2DAVYyepWKc5esd0WPa/I/jKsvHx
	4s6LoTa/Ij1gEUnCtpuTiNjHYxaPuhuk2DAmo1axqiwR9c1GpockP2t9dHD2TbIUx79cJJsi+B0
	yo8+z6Njra8X62PpcdZyQ6gq30CKdN9+KjddYEhTQdcxanPqsVf+qXHQLIxQiJL1QRXuqJhrL1I
	qOVC0bAMZIVKO95fu6U42tsIv80ewdgtBFGzA/oRQeWT1ozkIyzz07sS3GEqXGru3IHmwDf7MnS
	29js1J98PZp4lt8QaJA==
X-Received: by 2002:a05:6000:400e:b0:43c:f7e5:817b with SMTP id
 ffacd0b85a97d-43d2928f611mr16359770f8f.19.1775439132847; Sun, 05 Apr 2026
 18:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Avi Radinsky <avi.radinsky@gmail.com>
Date: Sun, 5 Apr 2026 21:31:36 -0400
X-Gm-Features: AQROBzA3j2s2NQMYcQWfo_HArGSVTDexkk-MQM2xoTZ5dio4YbuWIuqeCIsmH_w
Message-ID: <CAK=E+3BLMV35g1hC2=aQ57yKxgw1y8qR8ufpHQdKcx4MdT9ioA@mail.gmail.com>
Subject: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to YAML
To: alexandre.belloni@bootlin.com, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6295-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aviradinsky@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url,bootlin.com:email]
X-Rspamd-Queue-Id: 85ED83A1073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the MOXA ART Real Time Clock text binding to YAML schema.

Signed-off-by: Avi Radinsky <avi.radinsky@gmail.com>
---
 .../bindings/rtc/moxa,moxart-rtc.txt          | 17 --------
 .../bindings/rtc/moxa,moxart-rtc.yaml         | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
deleted file mode 100644
index 1374df7bf9d6..000000000000
--- a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-MOXA ART real-time clock
-
-Required properties:
-
-- compatible : Should be "moxa,moxart-rtc"
-- rtc-sclk-gpios : RTC sclk gpio, with zero flags
-- rtc-data-gpios : RTC data gpio, with zero flags
-- rtc-reset-gpios : RTC reset gpio, with zero flags
-
-Example:
-
-       rtc: rtc {
-               compatible = "moxa,moxart-rtc";
-               rtc-sclk-gpios = <&gpio 5 0>;
-               rtc-data-gpios = <&gpio 6 0>;
-               rtc-reset-gpios = <&gpio 7 0>;
-       };
diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
new file mode 100644
index 000000000000..9693c96a9f27
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: moxa,moxart-rtc
+
+  rtc-sclk-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC serial clock.
+
+  rtc-data-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC data input/output.
+
+  rtc-reset-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC reset.
+
+required:
+  - compatible
+  - rtc-sclk-gpios
+  - rtc-data-gpios
+  - rtc-reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "moxa,moxart-rtc";
+        rtc-sclk-gpios = <&gpio 5 0>;
+        rtc-data-gpios = <&gpio 6 0>;
+        rtc-reset-gpios = <&gpio 7 0>;
+    };
--
2.51.0

